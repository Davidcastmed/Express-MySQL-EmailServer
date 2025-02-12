import mysql from 'mysql2';
import sql from 'mssql';
import dotenv from 'dotenv';
import {sendEmail} from './emailService.js'
dotenv.config();

const dbConfig = {
    user: process.env.USER,
    password: process.env.PASSWORD,
    server: process.env.SERVER,
    database: process.env.DATABASE,
    option:{
      encrypt:true,
      TrustServerCertificate:true
    },
  };
  const createPool = new sql.ConnectionPool(dbConfig)
  .connect()
  .then(pool => {
    console.log('yes')
    return pool
  })
  .catch(err => {
    console.error('error', err)
    throw err
  })

  export async function getTest() {
    console.log('this is')
    // const pool = await createPool
    // const [rows] = await pool.request().query('SELECT * FROM Test');
    // return res.json(rows.recordset);
  }

const pool = mysql
  .createPool({
    host: process.env.MYSQL_HOST,
    user: process.env.MYSQL_USER,
    password: process.env.MYSQL_PASSWORD,
    database: process.env.MYSQL_DATABASE,
    port: process.env.MYSQL_PORT,
    multipleStatements: true
  })
  .promise();

FORMAT(sale_price, 2, 'de_DE')
// tengo que adaptar el sistema al formato de numero aleman, investigar como funciona en el resto de europa antes de tomar una desicion
export async function updateCustomer(data,id_customer)
{
  try {  
      data.id_country = Number(data.id_country); //convertir string a número
      if (!data.street_and_nr || !data.PLZ || !data.ort) {
        throw new Error("Missing required fields");
      }
      if (isNaN(data.id_country) || typeof data.id_country == 'string' ) {
         throw new Error('Invalid Country ID: Must be a number');
      } else {
          console.log('Data to update:',data.street_and_nr,
          data.PLZ,
          data.ort,
          data.id_country,
          id_customer)

        const [result] = await pool.query(
          ` UPDATE Customers SET street_and_nr = ?, PLZ = ?, ort = ?, id_country = ?  WHERE id_customer = ?`,[
            data.street_and_nr,
            data.PLZ,
            data.ort,
            data.id_country,
            id_customer
            ]
          );
        return result;
      }
    }catch(error){
    console.error('Error in UpdateCustomer():', error.message);
    return {
      success:false,
      message: "an error has occurred",
      error: error.message}
  };
}
export async function getArticles() {
  const [rows] = await pool.query('SELECT * FROM Articles');
  return rows;
}
export async function seachrArticlesByname(search){
  const content = '%'+search.search+'%'
  const [row] = await pool.query(`
  SELECT * FROM Articles WHERE Articles.name LIKE ?
  `,[content]);
  return row
}
export async function getArticleDetails(id) 
{
  /////////////inicio////////
  // try {
  //   const recipientEmail  = "castmeddavid@gmail.com"
  //   const subject = "Confirmación de recepción";
  //   const message = "Hemos recibido tu información. Gracias por tu envío.";
  //   await sendEmail(recipientEmail, subject, message);
  // } catch (error) {
  //   console.error("Error al enviar el correo de confirmación:", error);
  // }
/////////final//////codigo de prueba
  console.log('id', id)
  const [row] = await pool.query(
    `
    SELECT 
    Articles.id_article, Articles.cod_article, Articles.id_provider, Articles.name, Articles.dimensions, Articles.sale_price, Articles.short_description, Articles.long_description, Articles.pic_1, Articles.pic_2, Articles.pic_3, Articles.pic_4, Articles.stock, Articles.shipping_days,Providers.company_name, Providers.email as provider_email, Providers.description as provider_desc  
    FROM Articles, Providers 
    WHERE Articles.id_provider = Providers.id_provider AND Articles.id_article = ?
  `,
    [id]
  );
  return row;
}
 export async function getCustomer(email, password){

  const [row] = await pool.query(`SELECT * FROM Customers WHERE Customers.email = ? AND Customers.password = ?`,[email, password]);
  return row

 }
export async function insertCustomer(
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
) {
  const [result] = await pool.query(
    `
    INSERT INTO Customers( 
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
      id_country ) VALUES (?,?,?,?,?,?,?,?,?,?,?)
    `,
    [
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
    ]
  );
}
export async function insertArticle(
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
) {
  const [result] = await pool.query(
    `
  INSERT INTO Articles(cod_article, name, shipping_days, price, short_description, long_description, creation_date, stock, active, pic_1, pic_2, pic_3, pic_4)VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  `,
    [
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
    ]
  );
}

export async function makeTheOrder(orderDetail) {
  try {
    const OrderGeneratedId = Math.floor(10000 + Math.random() * 90000000);
    const flatTax = 0.19 // es una constante, esto depende de otros factores, 
    // aqui se me ocurre que deberia ser un select de una tabla en la base de datos donde se almacenan lodos los tipos se taxes

    // const [id] = await pool.query(
    //   `SELECT count(id_order) + 1 as id_order from Orders;`
    // );
    // INSERT in table Orders
    const id_order = OrderGeneratedId;
    const id_customer = orderDetail.id_customer;
    const state = 'pending';
    const delivered_date = 'pending';
    const pay_method = orderDetail.payMethod;
    const comment = orderDetail.comment;
    ////////Info f

    //Get Customer, Order Details and Addresse to add in the Email to send to the administrator
    let orderDetailToEmail = []

    const[OrderInfoToEmail] = await pool.query(`SELECT id_customer, name, last_name, email, telephone, street_and_nr, PLZ, ort FROM Customers WHERE id_customer = ? `,[id_customer]);
    console.log('this one', OrderInfoToEmail)
   // return OrderInfoToEmail;

    // State y delivered_date tienen un valor "pending" porque tiene que ser procesada por Phi-Admin, este sería el procedimiento para hacer efectivo el envío físico de el/los artículos. Una vez que las Ordenes son procesadas por un humano(empleado) los cámbios son actualizados a State = "delivered" y delivered_date = "la fecha en que se procesa la orden"
    const [Orders] = await pool.query(`
      INSERT INTO Orders(id_order, id_customer, state, delivered_date,pay_method,comment)
      VALUES(?,?,?,?,?,?)`, [id_order, id_customer, state, delivered_date, pay_method, comment]);

    // Preparar el INSERT en la tabla Order_Detail con los siguintes pasos
    // 1. Seleccionar los precios individuales de los artículos en la tabla artículos con los id's recibidos.
    // 2. hacer el INSERT en la tabla Order_Details

    // Este ciclo se repite cada vez que se llenan los detalles de la compra 
    for (let i = 0; i < orderDetail.articles.length; ++i) {

      const id_article = orderDetail.articles[i].id_article;
      const amount = orderDetail.articles[i].amount;
      // Aquí se seleccionan los detalles del articulo con su respectivo Id, por ahora id y código pero se podria destructurar para cualquier atributo de la tabla 
      const [row] = await pool.query(
        ` SELECT Articles.name, Articles.sale_price as unit_price, Articles.cod_article from Articles Where Articles.id_article = ?`, [id_article]
      );
      const article_name = row[0].name;
      const unit_price = row[0].unit_price;
      const cod_article = row[0].cod_article;
      let total_price = unit_price * amount; 
      let taxes = total_price * flatTax; // 200 * 0.19 = 38
      let subTotal = total_price - taxes; // 200 - 38 = 162
      //let total = subTotal + totalTaxes; // 200
      // flatTax = 0.19 analizar si el impuesto se mete en el valor total o se separa. en este ejemplo el impuesto se separa en la base de datos.
      //total = ((unit_price * amount) - subTotal);
      //let total = subTotal + 


      const [Order_Details] = await pool.query(`
      INSERT INTO Order_Detail(id_order,id_article,cod_article, amount, unit_price, taxes, total_price )
      VALUES(?,?,?,?,?,?,?)
     `, [id_order,id_article, cod_article, amount,unit_price, taxes, subTotal]);

     const data = {
      id_order:id_order,
      name:article_name,
      cod_article:cod_article,
      unit_price:unit_price,
      amount:amount,
      subTotal:subTotal,
      taxes:taxes,
      comment:comment
     };
     orderDetailToEmail.push(data);
    }
    //Enviar correo de aviso: Nueva Orden de Compra
    console.log('orderDetailToEmail', orderDetailToEmail)
    // aqui deberia armar el objeto para el email
    let articlesOfTheOrder = "";
    let subTotal = 0;
    let grandTotal = 0;
    let totalTaxesAll = 0;
    const discount = 0.00 // esto tengo que trabajarlo, incluir en DB y en el ciclo
    for(let item of orderDetailToEmail ){
      subTotal += item.subTotal;
      totalTaxesAll +=item.taxes;
      grandTotal =  subTotal + totalTaxesAll;
      articlesOfTheOrder +=   `<tr>
      <td style="border: 1px solid #ddd; padding: 8px;">${item.cod_article}</td>
      <td style="border: 1px solid #ddd; padding: 8px;">${item.name}</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">${item.unit_price}€</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">${item.amount}</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">${discount}€</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: end;">${item.subTotal}€</td>
    </tr>`
  
    }
    try {

      const recipientEmail  = OrderInfoToEmail[0].email // por ahora estoy usando el correo del cleinte, pero esto esta para informar al administrador de la nueva orden.
      // El email al cliente debe ser quizas con un formato diferente mas bonito
      const subject = "A new order has been placed";
      const htmlMessage = `
      <div style="background-color: #fafcfe; padding: 1rem;" > 
        <h3 style="margin:0;">${OrderInfoToEmail[0].name+' '+OrderInfoToEmail[0].last_name}</h3>
        <h4 style="margin:0;">${OrderInfoToEmail[0].street_and_nr}</h4>
        <h4 style="margin:0;">${OrderInfoToEmail[0].PLZ+' '+OrderInfoToEmail[0].ort}</h4> 
      </div>
      <div style="background-color: #fafcfe; padding: 1rem;">
        <h3>Hi!, this is the list of the new Order: ${id_order}</h3>  
        <table style="width: 100%; border-collapse: collapse;">
          <thead>
            <tr>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">CODE</th>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">ARTIKELNAME</th>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">PREIS</th>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">MENGE</th>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">RABATT(%)</th>
              <th style="border: 1px solid #ddd; padding: 8px; background-color: #f2f2f2;">NETTO</th>
            </tr>
          </thead>
          <tbody>
            ${articlesOfTheOrder} <!-- Articulos de la orden-->
          </tbody>
        </table>
        <p style="text-align: end;padding-right: 5px; font-weight: 600;">
        <span style="margin-right: 1rem;" >Zwischensumme:</span>
        <span style="margin-left: 1rem;">${subTotal}€</span>
        </p><br>
        <p style="text-align: end;padding-right: 5px; font-weight: 600;">
        <span style="margin-right: 1rem;" >Umsatzsteuer:</span> 
        <span style="margin-left: 1rem;">${totalTaxesAll}€</span>
        </p> <br>
        <p style="text-align: end;padding-right: 5px; font-weight: 600;">
        <span style="margin-right: 1rem;" >Gesamtsumme:</span> 
        <span style="margin-left: 1rem;">${grandTotal}€</span>
        <p style="font-weight: 600;"> KOMMENTAR : ${comment}</p>
      </div>
      `
      ;
      await sendEmail(recipientEmail, subject, htmlMessage);
    } catch (error) {
      console.error("Error al enviar el correo de confirmación:", error);
    }
  }catch(error){
    console.error('error in makeTheOrder():',error.message)
    return {
      success: false,
      message: "error while processing the order",
      error: error.message
    }
  }
  
}
export async function insertEmailToAds(email) {
const emailToAds = email.email
  const [result] = await pool.query(`
  INSERT INTO Emails_Ads(email) VALUE (?) 
  `,[emailToAds]);
}
export async function additionalInfo(data) {
  const chrome = data.chrome
  const explorer = data.IExplorerAgent
  const firefox = data.firefoxAgent
  const safari = data.safariAgent
  const country = data.country
  const [result] = await pool.query(`
  INSERT INTO additional_Info(chrome, explorer, firefox, safari, country) VALUES (?,?,?,?,?) 
  `,[chrome,explorer,firefox,safari,country]);
}
