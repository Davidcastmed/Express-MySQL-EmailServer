// emailService.js
// require("dotenv").config();
import { createTransport } from "nodemailer";

// Configuración de Nodemailer
const transporter = createTransport({
  service: "gmail",
  host: "smtp.gmail.com",
  port: 465, // o 587 para TLS
  secure: true, // usa `true` para el puerto 465 y `false` para el puerto 587
  auth: {
    user: "sopaslunamia@gmail.com",
    pass: "muuh wdso hynm qpqc" // from google 2-Step Verification
    // user: process.env.EMAIL_USER,
    // pass: process.env.EMAIL_PASS
  }
});

// Función para enviar correos electrónicos
export async function sendEmail(recipientEmail, subject, htmlMessage) {
  const mailOptions = {
    from: "sopaslunamia@gmail.com",
    to: recipientEmail,
    subject: subject,
    html: htmlMessage
    // from: process.env.EMAIL_USER,
    // to: recipientEmail,
    // subject: subject,
    // text: message
  };

  return new Promise((resolve, reject) => {
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.error("Error al enviar el correo:", error);
        reject(error);
      } else {
        console.log("Correo enviado:", info.response);
        resolve(info.response);
      }
    });
  });
}

// export default { sendEmail };
