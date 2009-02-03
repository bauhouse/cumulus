<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" encoding="UTF-8" indent="yes" />

<xsl:template match="/">
	<tags>
		<xsl:for-each select="data/tags/entry">
			<a title="{topics} topics" class="tag-link-{@id}" rel="tag" style="font-size: {topics * 8};" color="0x{color}" hicolor="0x{hover-color}"><xsl:value-of select="tag"/></a>
		</xsl:for-each>
	</tags>
</xsl:template>
	
</xsl:stylesheet>