const puppeteer = require("puppeteer");

const printPDF = async (url, name) => {
    const browser = await puppeteer.launch({ 
        executablePath: '/usr/bin/google-chrome-stable',
        headless: true, 
        args: ['--no-sandbox'] });
    const page = await browser.newPage();

    await page.goto(url, {
        waitUntil: 'networkidle2'
    });

    await page.pdf({ path: `./public/${name}.pdf`, format: 'legal' });

    await browser.close();

    return name
}

module.exports = {
    printPDF
}