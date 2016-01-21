<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<xsl:template match="goods">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//materials/material">
		<xsl:variable name="material_id" select="./@id"/>
		<xsl:element name="items">
			<xsl:attribute name="material">
				<xsl:value-of select="@name"/>
			</xsl:attribute>
			<xsl:for-each select="//item[@material = $material_id]">
				<xsl:element name="company">
					<xsl:attribute name="name">
						<xsl:value-of select="@name"/>
					</xsl:attribute>					
					<xsl:variable name="company_id" select="@company"/>					
					<xsl:for-each select="//company">
						<xsl:if test="@id = $company_id">				
							<xsl:attribute name="item">
								<xsl:value-of select="@name"/>
							</xsl:attribute>
						</xsl:if>
					</xsl:for-each>					
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>