<!--- NOTE: 
Prerequisites:
1. OpenOffice must be installed on the server.
2. You must add the JODconverter JAR files to your installation.  See ReadMe.txt for more information.
 --->
<!--- 
function convertDocument
	srcfile = Full expanded path to the source file.  (Required)
	filename = Full expanded path of the destination file.  (Required)
	overwrite = Whether or not to overwrite the destination filename. (Optional, default=false)
	format = Currently PDF is the only valid format. (Optional, default="PDF")
	pathToOO = Path to soffice.exe file (Optional, default=C:\Program Files (x86)\OpenOffice.org 3\program\soffice.exe)
--->
<!--- Create the Object --->
<cfset ooLib = createObject('component','oolib') />
<!--- Perform the Conversion --->
<cfset ooResults = ooLib.convertDocument(expandpath('WordDocument.docx'),expandpath('PdfDocument.pdf'),true)>
<!--- Check for success, and link to results --->
<cfif ooResults.converted>
	<cfoutput>SUCCESS <a href="#ooResults.filename#">VIEW PDF</a></cfoutput>
<cfelse>
	<cfoutput>ERROR: #ooResults.errorMessage#</cfoutput>
</cfif>