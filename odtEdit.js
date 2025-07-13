const fs = require('fs');
const AdmZip = require('adm-zip');
const xml2js = require('xml2js');
const { exec } = require('child_process');
const { promisify } = require('util');


async function fillOdtBlanks(odtFilePath, outputFilePath, customData) {
  const zip = new AdmZip(odtFilePath);
  const zipEntries = zip.getEntries();

  const contentXmlEntry = zipEntries.find(entry => entry.entryName === 'content.xml');
  if (!contentXmlEntry) {
    console.error('content.xml not found in the .odt file.');
    return;
  }
  const contentXml = contentXmlEntry.getData().toString('utf8');

  const parser = new xml2js.Parser();
  const builder = new xml2js.Builder();
  let contentObj = await parser.parseStringPromise(contentXml);

  let xmlContent = JSON.stringify(contentObj);

  xmlContent = xmlContent.replace(/{tenant.first_name}/g, customData.TENs[0].fname);
  xmlContent = xmlContent.replace(/{tenant.last_name}/g, customData.TENs[0].lname);
  xmlContent = xmlContent.replace(/{property.street_address}/g, customData.address);
  xmlContent = xmlContent.replace(/{property.cty}/g, customData.cty);
  xmlContent = xmlContent.replace(/{property.cnty}/g, customData.cnty);
  xmlContent = xmlContent.replace(/{property.st_province_region}/g, customData.st);
  xmlContent = xmlContent.replace(/{property.postal}/g, customData.zip);
  xmlContent = xmlContent.replace(/{particular.total_written}/g, customData.PARTICULAR.Written);
  xmlContent = xmlContent.replace(/{particular.total_dollar}/g, customData.PARTICULAR.Dollars);
  xmlContent = xmlContent.replace(/{particular.total_cent}/g, customData.PARTICULAR.Cents);
  xmlContent = xmlContent.replace(/{particular.first_name}/g, customData.PARTICULAR.PayToFirst);
  xmlContent = xmlContent.replace(/{particular.last_name}/g, customData.PARTICULAR.PayToLast);
  xmlContent = xmlContent.replace(/{particular.street_address}/g, customData.PARTICULAR.address);
  xmlContent = xmlContent.replace(/{particular.cty}/g, customData.PARTICULAR.cty);
  xmlContent = xmlContent.replace(/{particular.cnty}/g, customData.PARTICULAR.cnty);
  xmlContent = xmlContent.replace(/{particular.st_province_region}/g, customData.PARTICULAR.st);
  xmlContent = xmlContent.replace(/{particular.postal}/g, customData.PARTICULAR.zip);
  xmlContent = xmlContent.replace(/{particular.days_open}/g, customData.PARTICULAR.OpenDays);
  xmlContent = xmlContent.replace(/{particular.hours_open}/g, customData.PARTICULAR.OpenHours);
  xmlContent = xmlContent.replace(/{landlord.first_name}/g, customData.OWN.fname);
  xmlContent = xmlContent.replace(/{landlord.last_name}/g, customData.OWN.lname);
  // xmlContent = xmlContent.replace(/{notice.datatime}/g, customData.notice.createdAt);
  xmlContent = xmlContent.replace(/{timestamp}/g, new Date());
  const len = customData.TENs.length
  xmlContent = xmlContent.replace(/{tenant1}/g, len > 0 && customData.TENs[0].eml1 ? `${customData.TENs[0].fname} ${customData.TENs[0].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant2}/g, len > 1 && customData.TENs[1].eml1 ? `${customData.TENs[1].fname} ${customData.TENs[1].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant3}/g, len > 2 && customData.TENs[2].eml1 ? `${customData.TENs[2].fname} ${customData.TENs[2].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant4}/g, len > 3 && customData.Tenants[3].eml1 ? `${customData.Tenants[3].fname} ${customData.Tenants[3].lname}` : "");

  const updatedContentXml = builder.buildObject(JSON.parse(xmlContent));

  zip.updateFile('content.xml', Buffer.from(updatedContentXml));

  zip.writeZip(outputFilePath);
  console.log(`Filled .odt file has been saved as ${outputFilePath}`);
}

async function convertOdtToPdf(inputOdtPath, outputPdfPath) {
  const execAsync = promisify(exec);
  const command = `libreoffice --headless --convert-to pdf ${inputOdtPath} --outdir ./${outputPdfPath}`;
  try {
    const { stdout, stderr } = await execAsync(command)
    if (stderr) {
      console.error('Error:', stderr);
    } else {
      console.log('Success:', stdout);
    }
  } catch (error) {
    console.error('Error executing the command:', error);
  }
}

module.exports = {
  fillOdtBlanks,
  convertOdtToPdf
}