<#
.SYNOPSIS
  Convierte un clone de projects-base en un proyecto limpio.

.DESCRIPTION
  - Rellena {{PROJECT_NAME}} y {{PROJECT_SHORT_DESCRIPTION}} en README/AGENTS.
  - Instala las skills de .opencode/skills/ en el global de OpenCode (o no, con -Skills none).
  - Reescribe las referencias .opencode/skills/ -> ~/.config/opencode/skills/.
  - Elimina .opencode/skills/, templates/ y scripts/ (este script).
  - Reinicia el historial git para que el proyecto se suba limpio.

.EXAMPLE
  .\scripts\init.ps1 -Name "Mi App" -Description "API de pedidos"
#>
[CmdletBinding()]
param(
  [Parameter(Mandatory = $true)][string]$Name,
  [Parameter(Mandatory = $true)][string]$Description,
  [ValidateSet('global', 'none')][string]$Skills = 'global',
  [string]$SkillsRoot = (Join-Path $HOME '.config\opencode\skills')
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot

# Marca de seguridad: solo desde la raiz de un clone del template (o una vez inicializado).
foreach ($marker in 'AGENTS.md', '.opencode', 'specs', (Join-Path 'templates' 'README.md')) {
  if (-not (Test-Path (Join-Path $root $marker))) {
    throw "No parece la raiz de projects-base (falta '$marker'). Ejecuta este script desde un clone nuevo del template."
  }
}

function Replace-Ascii {
  param([string]$Path, [hashtable]$Map)
  # Round-trip UTF-8 por bytes: solo cambia la subcadena ASCII, acentos y BOM intactos.
  $text = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($Path))
  $orig = $text
  foreach ($k in $Map.Keys) { $text = $text.Replace($k, [string]$Map[$k]) }
  if ($text -ne $orig) { [IO.File]::WriteAllBytes($Path, [Text.Encoding]::UTF8.GetBytes($text)) }
}

# 1. README del proyecto desde la plantilla, con placeholders resueltos.
Copy-Item (Join-Path $root 'templates\README.md') (Join-Path $root 'README.md') -Force
$placeholders = @{
  '{{PROJECT_NAME}}'            = $Name
  '{{PROJECT_SHORT_DESCRIPTION}}' = $Description
}
Replace-Ascii -Path (Join-Path $root 'README.md') -Map $placeholders
Replace-Ascii -Path (Join-Path $root 'AGENTS.md') -Map $placeholders

# 2. Skills: instalar en global y quitar del proyecto.
if ($Skills -eq 'global') {
  New-Item -ItemType Directory -Path $SkillsRoot -Force | Out-Null
  Copy-Item (Join-Path $root '.opencode\skills\*') -Destination $SkillsRoot -Recurse -Force
}
Remove-Item (Join-Path $root '.opencode\skills') -Recurse -Force

# 3. Reescribir referencias a la ruta global donde acaban las skills.
$pathMap = @{ '.opencode/skills/' = '~/.config/opencode/skills/' }
Replace-Ascii -Path (Join-Path $root 'AGENTS.md') -Map $pathMap
foreach ($md in Get-ChildItem (Join-Path $root 'docs') -Filter '*.md') {
  Replace-Ascii -Path $md.FullName -Map $pathMap
}

# 4. El proyecto no necesita infraestructura del template.
Remove-Item (Join-Path $root 'templates') -Recurse -Force
Remove-Item $PSScriptRoot -Recurse -Force -ErrorAction SilentlyContinue

# 5. Historial fresco: el proyecto se sube limpio, sin los blobs del template.
Remove-Item (Join-Path $root '.git') -Recurse -Force
git -C $root init -q
git -C $root add -A
$committed = $false
try {
  git -C $root -c core.safecrlf=false commit -q -m "chore: init $Name from projects-base"
  if ($LASTEXITCODE -eq 0) { $committed = $true }
} catch { }

# 6. Resumen.
$pending = Select-String -Path (Join-Path $root 'AGENTS.md') -Pattern '\{\{[A-Z_0-9]+\}\}' -AllMatches |
  ForEach-Object { $_.Matches } | ForEach-Object { $_.Value } | Sort-Object -Unique

Write-Host ""
Write-Host "Proyecto '$Name' inicializado."
Write-Host "  Skills: $(if ($Skills -eq 'global') { "instaladas en $SkillsRoot" } else { 'omitidas (-Skills none)' }) y fuera del repo."
Write-Host "  README y AGENTS.md con placeholders resueltos; referencias de skills -> global."
$gitMsg = if ($committed) { 'fresco, 1 commit' } else { 'NO se pudo commitear (configura git user.name/email)' }
Write-Host "  Historial git: $gitMsg."
if ($pending) { Write-Host "  Pendiente a mano en AGENTS.md: $($pending -join ', ')" }
Write-Host ""
Write-Host "Siguiente: abre OpenCode en esta carpeta y ejecuta la fase 1 (Constitucion) -"
Write-Host "prompt en ~/.config/opencode/skills/anti-vibecode-sdd/prompts.md"
