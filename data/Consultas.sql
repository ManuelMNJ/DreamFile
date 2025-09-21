SELECT 
  s.id_sueño,
  IF(s.es_anonimo, 'Anónimo', u.nombre_usuario) AS autor,
  s.titulo,
  s.fecha,
  s.texto,
  s.visibilidad
FROM sueños s
JOIN usuarios u ON s.id_usuario = u.id_usuario
WHERE s.visibilidad = 'publico';

SELECT 
  s.id_sueño,
  s.titulo,
  GROUP_CONCAT(e.tipo SEPARATOR ', ') AS emociones
FROM sueños s
JOIN sueños_emociones se ON s.id_sueño = se.id_sueño
JOIN emociones e ON se.id_emocion = e.id_emocion
WHERE s.visibilidad = 'publico'
GROUP BY s.id_sueño;

SELECT 
  s.id_sueño,
  s.titulo,
  GROUP_CONCAT(et.nombre SEPARATOR ', ') AS etiquetas
FROM sueños s
JOIN sueños_etiquetas se ON s.id_sueño = se.id_sueño
JOIN etiquetas et ON se.id_etiqueta = et.id_etiqueta
WHERE s.visibilidad = 'publico'
GROUP BY s.id_sueño;

SELECT 
  s.id_sueño,
  s.titulo,
  COUNT(l.id_like) AS total_likes
FROM sueños s
LEFT JOIN likes l ON s.id_sueño = l.id_sueño
GROUP BY s.id_sueño;

SELECT * FROM suenos WHERE visibilidad = 'publico';