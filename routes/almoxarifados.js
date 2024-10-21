const { app, conn } = require('../server.js');


// Código Automático:
app.get('/codigo/almoxarifados', async (req, res) => {

    let [query] = await conn.promise().execute(`CALL codigo_almoxarifado ( );`);

    res.send(query[0])
});


// Novo Registro:
app.post('/novo/almoxarifados', async (req, res) => {
    let {codigo, almoxarifado, descricao} = req.body;

    let [query] = await conn.promise().execute('CALL novo_almoxarifado (?, ?, ?)',
        [codigo, almoxarifado, descricao]
    )

    if(query[0]){
        res.send({ codigo : "Código já em utilização!" })
    }

    else if(!query[0]){
        res.send({ sucesso : query })
    }
});