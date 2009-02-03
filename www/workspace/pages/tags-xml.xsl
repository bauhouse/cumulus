<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:import href="../utilities/tags.xsl"/>

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
	<tags>
		<xsl:for-each select="data/tags/entry">
			<xsl:call-template name="tags"/>
		</xsl:for-each>
	</tags>
</xsl:template>

</xsl:stylesheet>