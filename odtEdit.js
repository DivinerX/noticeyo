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

  xmlContent = xmlContent.replace(/{tenant.first_name}/g, customData.Tenants[0].fname);
  xmlContent = xmlContent.replace(/{tenant.last_name}/g, customData.Tenants[0].lname);
  xmlContent = xmlContent.replace(/{property.street_address}/g, customData.address);
  xmlContent = xmlContent.replace(/{property.cty}/g, customData.cty);
  xmlContent = xmlContent.replace(/{property.cnty}/g, customData.cnty);
  xmlContent = xmlContent.replace(/{property.st_province_region}/g, customData.st);
  xmlContent = xmlContent.replace(/{property.postal}/g, customData.zip);
  xmlContent = xmlContent.replace(/{particular.total_written}/g, customData.Particular.Written);
  xmlContent = xmlContent.replace(/{particular.total_dollar}/g, customData.Particular.Dollars);
  xmlContent = xmlContent.replace(/{particular.total_cent}/g, customData.Particular.Cents);
  xmlContent = xmlContent.replace(/{particular.first_name}/g, customData.Particular.PayToFirst);
  xmlContent = xmlContent.replace(/{particular.last_name}/g, customData.Particular.PayToLast);
  xmlContent = xmlContent.replace(/{particular.street_address}/g, customData.Particular.address);
  xmlContent = xmlContent.replace(/{particular.cty}/g, customData.Particular.cty);
  xmlContent = xmlContent.replace(/{particular.cnty}/g, customData.Particular.cnty);
  xmlContent = xmlContent.replace(/{particular.st_province_region}/g, customData.Particular.st);
  xmlContent = xmlContent.replace(/{particular.postal}/g, customData.Particular.zip);
  xmlContent = xmlContent.replace(/{particular.days_open}/g, customData.Particular.OpenDays);
  xmlContent = xmlContent.replace(/{particular.hours_open}/g, customData.Particular.OpenHours);
  xmlContent = xmlContent.replace(/{landlord.first_name}/g, customData.Landlord.fname);
  xmlContent = xmlContent.replace(/{landlord.last_name}/g, customData.Landlord.lname);
  // xmlContent = xmlContent.replace(/{notice.datatime}/g, customData.notice.createdAt);
  xmlContent = xmlContent.replace(/{timestamp}/g, new Date());
  const len = customData.Tenants.length
  xmlContent = xmlContent.replace(/{tenant1}/g, len > 0 && customData.Tenants[0].eml1 ? `${customData.Tenants[0].fname} ${customData.Tenants[0].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant2}/g, len > 1 && customData.Tenants[1].eml1 ? `${customData.Tenants[1].fname} ${customData.Tenants[1].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant3}/g, len > 2 && customData.Tenants[2].eml1 ? `${customData.Tenants[2].fname} ${customData.Tenants[2].lname}` : "");
  xmlContent = xmlContent.replace(/{tenant4}/g, len > 3 && customData.Tenants[3].eml1 ? `${customData.Tenants[3].fname} ${customData.Tenants[3].lname}` : "");
  // xmlContent = xmlContent.replace(/{tenant2}/g, customData.Tenant.email_2 ? `${customData.Tenant.first_name_2} ${customData.Tenant.last_name_2}` : "");
  // xmlContent = xmlContent.replace(/{tenant3}/g, customData.Tenant.email_3 ? `${customData.Tenant.first_name_3} ${customData.Tenant.last_name_3}` : "");
  // xmlContent = xmlContent.replace(/{tenant4}/g, customData.Tenant.email_4 ? `${customData.Tenant.first_name_4} ${customData.Tenant.last_name_4}` : "");

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