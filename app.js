import express from 'express';
import cors from 'cors';
import {
  getTest,
  getCustomer,
  getArticleDetails,
  insertArticle,
  insertCustomer,
  makeTheOrder,
  insertEmailToAds,
  seachrArticlesByname, 
  additionalInfo,
  updateCustomer
} from './database.js';

const app = express();

app.use(express.json());

app.use(cors());

app.get('/test', async (req, res) => {
  const test = await getTest();
  res.send(test);
});



//Buscar Artículos por Nombre
app.get('/:search', async(req, res)=> {
  const search = req.query
  const result = await seachrArticlesByname(search);
  res.send(result);
} );
//Actualizar Info del cliente
app.put('/update-customer/:customerId', async (req, res)=>{

  const {id_customer} = req.params.customerId;
  const {
      street_and_nr,
      PLZ,
      ort,
      id_country} = req.body;

  const data = await updateCustomer(req.body,req.params.customerId);
   
  res.send(data) 
})

app.get('/article-details/:id', async (req, res) => {
  console.log('ssssss', req.params)
  const id = req.params.id;
  const article = await getArticleDetails(id);
  res.send(article);
});

// //GET Customer per email and password
app.get('/customer/:login', async (req, res) =>{
  const {email, password} = req.query;
  const login = await getCustomer(email, password);
  if (login.length == 0){
     res.status(404).send()
  }else{
    res.status(201).send(login);
  }
})

app.post('/customer', async (req, res) => {
  const {
    id_customer,
    name,
    last_name,
    gender,
    email,
    password,
    telephone,
    street_and_nr,
    PLZ,
    ort,
    id_country,
  } = req.body;

  const customer = await insertCustomer(
    id_customer,
    name,
    last_name,
    gender,
    email,
    password,
    telephone,
    street_and_nr,
    PLZ,
    ort,
    id_country
  );
  res.status(201).send(customer);
});

app.post('/order', async (req, res) => {
  console.log('Order:',req.body);
  const orderDetail = await makeTheOrder(req.body);
  res.status(201).send(orderDetail);
});

app.post('/email', async (req, res) => {
  console.log('email:',req.body, );
const email = await insertEmailToAds(req.body);
res.status(201).send(email);
});

app.post('/additional-info', async (req, res) => {
  console.log('landing on..',req.body, );
  const data = await additionalInfo(req.body);
  res.status(201).send(data);
});

app.post('/article', async (req, res) => {
  const {
    cod_article,
    name,
    shipping_days,
    price,
    short_description,
    long_description,
    creation_date,
    stock,
    active,
    pic1,
    pic2,
    pic3,
    pic4,
  } = req.body;

  const article = await insertArticle(
    cod_article,
    name,
    shipping_days,
    price,
    short_description,
    long_description,
    creation_date,
    stock,
    active,
    pic1,
    pic2,
    pic3,
    pic4
  );
  res.status(201).send(article);
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send({message:'something broke'});
});

 const PORT = process.env.PORT || 8080;
 app.listen(PORT, () => {
console.log(`Server is running on port ${PORT} `);
});

