const { app, conn } = require('../server.js');


// Código Automático:
app.get('/codigo/almoxarifados', async (req, res) => {

    let [query] = await conn.promise().execute('CALL codigo_almoxarifado ( );');

    res.send(query[0])
});

// Pesquisa:
app.post('/pesquisa/almoxarifados', async (req, res) => {
    let { pesquisa } = req.body;
    pesquisa =  pesquisa ? String(pesquisa).replaceAll(' ','|') : '|';

    let [query] = await conn.promise().execute('CALL pesquisa_almoxarifado ( ? )',
        [pesquisa]
    );

    res.send(query[0]);
})


// Novo Registro:
app.post('/novo/almoxarifados', async (req, res) => {   
    let {codigo, almoxarifado, descricao} = req.body;

    let [query] = await conn.promise().execute('CALL novo_almoxarifado (?, ?, ?)',
        [codigo, almoxarifado, descricao]
    )

    if(query[0]){
        res.send({ codigo : "Código já em utilização!" })
        return
    }

    else if(!query[0]){
        res.send({ sucesso : query })
        return
    }
});


// Consultar Registro:
app.get('/consulta/almoxarifados/:id', async(req, res) => {
    let { id } = req.params;

    let [query] = await conn.promise().execute('CALL consultar_registro ( ? )',
        [id]
    )

    res.send(query[0]);
})