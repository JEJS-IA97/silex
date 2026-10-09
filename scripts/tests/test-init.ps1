# Test de scripts/init.ps1: clona el working tree a un temporal, ejecuta init y verifica.
# ASCII-only (PowerShell 5.1 lee UTF-8 sin BOM como ANSI).
$ErrorActionPreference = 'Stop'
$script:pass = 0
$script:fail = 0

function Check([string]$Name, [bool]$Cond) {
  if ($Cond) { Write-Host "  PASS $Name"; $script:pass++ }
  else { Write-Host "  FAIL $Name"; $script:fail++ }
}

$template = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
$work = Join-Path $env:TEMP "init-test-$(Get-Random)"
$proj = Join-Path $work 'proj'
$globalRoot = Join-Path $work 'global-skills'

# Copia del working tree (sin .git ni node_modules) y le da historial de template.
robocopy $template $proj /E /XD .git node_modules /NFL /NDL /NJH /NJS | Out-Null
if ($LASTEXITCODE -ge 8) { throw "robocopy fallo con codigo $LASTEXITCODE" }
git -C $proj init -q
git -C $proj add -A
git -C $proj -c core.safecrlf=false commit -q -m 'template snapshot'

& (Join-Path $proj 'scripts\init.ps1') -Name 'Proyecto Demo' -Description 'Demo desc' -SkillsRoot $globalRoot

Write-Host '--- Verificaciones ---'
Check 'skills locales eliminadas' (-not (Test-Path (Join-Path $proj '.opencode\skills')))
$skillsInstalled = (Test-Path (Join-Path $globalRoot 'anti-vibecode-sdd')) -and
                   (Test-Path (Join-Path $globalRoot 'ui-ux-pro-max')) -and
                   (Test-Path (Join-Path $globalRoot 'typeui-fundamentals'))
Check 'skills instaladas en SkillsRoot' $skillsInstalled
Check '9 skills en global' ((Get-ChildItem $globalRoot -Directory).Count -eq 9)

$readme = Get-Content (Join-Path $proj 'README.md') -Raw
Check 'README nombre resuelto' ($readme.StartsWith("# Proyecto Demo"))
Check 'README descripcion resuelta' ($readme.Contains('Demo desc'))
Check 'README sin placeholder' (-not $readme.Contains('{{PROJECT_NAME}}'))

$agents = Get-Content (Join-Path $proj 'AGENTS.md') -Raw
Check 'AGENTS nombre resuelto' ($agents.Contains('Proyecto Demo'))
Check 'AGENTS sin .opencode/skills/' (-not $agents.Contains('.opencode/skills/'))
Check 'AGENTS con ruta global' ($agents.Contains('~/.config/opencode/skills/'))
Check 'AGENTS conserva {{STACK}} pendiente' ($agents.Contains('{{STACK}}'))

$hard = Get-Content (Join-Path $proj 'docs\hardening-notes.md') -Raw
Check 'hardening-notes reescrito' (-not $hard.Contains('.opencode/skills/'))

Check 'templates/ eliminado' (-not (Test-Path (Join-Path $proj 'templates')))
Check 'scripts/ eliminado' (-not (Test-Path (Join-Path $proj 'scripts')))
Check 'graphify-out en .gitignore' ((Get-Content (Join-Path $proj '.gitignore') -Raw).Contains('graphify-out/'))
Check 'opencode.json presente' (Test-Path (Join-Path $proj '.opencode\opencode.json'))
Check '.opencode/.gitignore presente' (Test-Path (Join-Path $proj '.opencode\.gitignore'))
Check 'constitution.md presente' (Test-Path (Join-Path $proj 'docs\constitution.md'))
Check 'plantilla de spec presente' (Test-Path (Join-Path $proj 'specs\001-nombre-feature-mvp\spec.md'))

$commits = @(git -C $proj log --oneline --all)
Check 'historial fresco: 1 commit' ($commits.Count -eq 1)
Check 'commit inicial es init' ($commits[0] -match 'init Proyecto Demo')

Write-Host ''
Write-Host "Resultado: $script:pass pass, $script:fail fail"
if ($script:fail -gt 0) {
  Write-Host "Artefactos conservados en: $work"
  exit 1
}
Remove-Item $work -Recurse -Force
exit 0
