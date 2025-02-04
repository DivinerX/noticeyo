const nodemailer = require('nodemailer');
const path = require('path');

module.exports = {
    transfer: function (receipt, filename) {
        console.log(receipt)
        let transporter = nodemailer.createTransport({
            host: "nw2.fcomet.com",
            port: 465,
            secure: true,
            auth: {
                user: "notice@noticepros.com",
                pass: "!!!###24red1234",
            },
            tls: {
                rejectUnauthorized: false
            }
        });

        let mailOptions = {
            from: "notice@noticepros.com",
            to: receipt,
            subject: '3 DAY NOTICE - PAY RENT OR QUIT',
            text: '3 DAY NOTICE - PAY RENT OR QUIT',

            attachments: [
                {
                    filename: "3 DAY NOTICE - PAY RENT OR QUIT",
                    path: path.join(__dirname, 'public', `${filename}.pdf`),
                    contentType: 'application/pdf',
                },
            ],
        };

        transporter.sendMail(mailOptions, (error, info) => {
            if (error) {
                console.log('Error occurred:', error);
            } else {
                console.log('Email sent successfully:', info.response);
            }
        });
    }
}