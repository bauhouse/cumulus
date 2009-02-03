<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/tags.xsl"/>

<xsl:output method="xml"
	doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
	doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
	omit-xml-declaration="yes"
	encoding="UTF-8"
	indent="yes" />

<xsl:template match="/">
	<html>
		<head>
			<title>Cumulus Tag Cloud</title>
		</head>
		<body style="margin:0; padding:0;">
			<!-- SWFObject embed by Geoff Stearns geoff@deconcept.com http://blog.deconcept.com/swfobject/ -->
			<script type="text/javascript" src="workspace/assets/js/swfobject.js"></script>

			<div id="cumulus">
				<h1>Cumulus</h1>
				<p>
					<xsl:for-each select="data/tags/entry">
						<xsl:call-template name="tags"/>
					</xsl:for-each>
				</p>
			</div>
			<script type="text/javascript">
				<xsl:comment>
					var rnumber = Math.floor(Math.random()*9999999);
					var widget_so = new SWFObject("workspace/tagcloud.swf", "tagcloudflash", "100%", "100%", "9", "#ffffff");
						widget_so.addParam("allowScriptAccess", "always");
						widget_so.addVariable("tcolor", "0x2A8CC8");
						widget_so.addVariable("tcolor2", "0x999999");
						widget_so.addVariable("hicolor", "0x000000");
						widget_so.addVariable("tspeed", "100");
						widget_so.addVariable("distr", "true");
						widget_so.write("cumulus");
				</xsl:comment>
			</script>
		</body>
	</html>
</xsl:template>
	
</xsl:stylesheet>