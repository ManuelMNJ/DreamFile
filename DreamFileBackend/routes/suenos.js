const express = require('express');
const router = express.Router();
const db = require('../db');

router.get('/publicos', async (req, res) => {
    try {
        const [suenos] = await db.query(`
            SELECT
                s.id_sueno,
                s.titulo,
                s.texto,
                s.fecha,
                IF(s.es_anonimo = 1, 'Anónimo', u.nombre_usuario) AS autor,
                COUNT(l.id_like) AS likes
            FROM suenos s
                     JOIN usuarios u ON s.id_usuario = u.id_usuario
                     LEFT JOIN likes l ON s.id_sueno = l.id_sueno
            WHERE s.visibilidad = 'publico'
            GROUP BY s.id_sueno, s.titulo, s.texto, s.fecha, autor
            ORDER BY likes DESC
        `);
        res.json(suenos);
    } catch (err) {
        console.error('Error en /suenos/publicos:', err);
        res.status(500).json({ error: 'Error al obtener sueños públicos' });
    }
});

module.exports = router;