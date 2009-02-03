<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template name="tags">

	<!-- Configure minimum and maximum point sizes for fonts -->
	<xsl:param name="minsize" select="12"/>
	<xsl:param name="maxsize" select="36"/>

	<!-- Size difference in points between each number of topics -->
	<xsl:param name="step" select="4"/>
	
	<!-- Custom colors for tags and hovers -->
	<xsl:param name="color">
		<xsl:if test="color"><xsl:value-of select="color"/></xsl:if>
	</xsl:param>
	<xsl:param name="hicolor">
		<xsl:if test="hover-color"><xsl:value-of select="hover-color"/></xsl:if>
	</xsl:param>
	
	<!-- Calculate font size -->
	<xsl:param name="fontsize">
		<xsl:choose>
			<xsl:when test="topics &lt; $minsize div $step"><xsl:value-of select="$minsize"/></xsl:when>
			<xsl:when test="topics &gt; $maxsize div $step"><xsl:value-of select="$maxsize"/></xsl:when>
			<xsl:otherwise><xsl:value-of select="$step * topics"/></xsl:otherwise>
		</xsl:choose>
	</xsl:param>

	<!-- Anchor for each tag -->
	<a href="{uri}" title="{topics} topics" class="tag-link-{@id}" rel="tag" style="font-size: {$fontsize}pt;">
		<xsl:if test="$color != ''">
			<xsl:attribute name="color"><xsl:value-of select="$color"/></xsl:attribute>
		</xsl:if>
		<xsl:if test="$hicolor != ''">
			<xsl:attribute name="hicolor"><xsl:value-of select="$hicolor"/></xsl:attribute>
		</xsl:if>
		<xsl:value-of select="tag"/>
	</a>
</xsl:template>
	

</xsl:stylesheet>