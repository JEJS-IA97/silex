# Checklist de Producción para Apps Generadas con IA

## Diseño y UI/UX
- [ ] Paleta de colores cohesiva (no neón aleatorio)
- [ ] Jerarquía visual clara (el usuario sabe dónde mirar)
- [ ] Efectos de brillo con propósito informativo
- [ ] Iconos SVG profesionales (no emojis)
- [ ] Layouts variados (no solo tarjetas)
- [ ] Indicadores de estado con significado real
- [ ] Identidad de marca única (evitar el "look AI")

## SEO Técnico
- [ ] Títulos únicos y descriptivos por página (50-60 caracteres)
- [ ] Meta descripciones únicas por página (140-155 caracteres)
- [ ] Un solo `<h1>` por página
- [ ] Jerarquía de encabezados correcta (h1 → h2 → h3)
- [ ] Etiquetas canónicas en todas las páginas indexables
- [ ] Open Graph y Twitter Cards configurados
- [ ] Imagen OG de 1200x630 píxeles
- [ ] Favicon y Apple Touch Icon
- [ ] Sitemap.xml generado y accesible
- [ ] robots.txt configurado correctamente (no bloquear IA de búsqueda)
- [ ] Datos estructurados JSON-LD en el HTML inicial
- [ ] Atributo `<html lang="es">`
- [ ] Texto alternativo en todas las imágenes
- [ ] Página 404 personalizada con estado HTTP correcto

## Rendimiento
- [ ] Bundle de JS < 500KB (usar code splitting)
- [ ] `React.lazy()` y `Suspense` para rutas y componentes pesados
- [ ] `manualChunks` en Vite para separar vendors
- [ ] Imágenes optimizadas (WebP/AVIF) con `loading="lazy"`
- [ ] Atributos `width` y `height` en imágenes (evitar CLS)
- [ ] Sin errores en la consola del navegador
- [ ] LCP < 2.5s, INP < 200ms, CLS < 0.1

## Seguridad
- [ ] Sourcemaps deshabilitados en producción
- [ ] Sin variables de entorno expuestas en el cliente
- [ ] HTTPS configurado con certificado válido
- [ ] Headers de seguridad (HSTS, CSP básico)
- [ ] Sin endpoints de debug activos en producción

## Preparación para IA
- [ ] robots.txt permite crawlers de búsqueda IA (OAI-SearchBot, PerplexityBot)
- [ ] Contenido renderizado en el servidor (SSR/SSG)
- [ ] Datos estructurados en el HTML inicial (no inyectados con JS)
- [ ] Contenido claro y extractable para answer engines

## Despliegue
- [ ] Dominio personalizado configurado
- [ ] URL de producción (no *.vercel.app)
- [ ] Variables de entorno configuradas en el hosting
- [ ] Pipeline de CI/CD funcionando
- [ ] Monitoreo de errores configurado