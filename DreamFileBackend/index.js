// index.js
const express = require('express');
const app = express();
const suenosRoutes = require('./routes/suenos');

app.use(express.json());
app.use('/suenos', suenosRoutes);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Servidor DreamFile corriendo en puerto ${PORT}`);
});