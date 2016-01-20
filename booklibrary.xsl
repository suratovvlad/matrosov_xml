<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
	<!--<xsl:key name="AUTHOR_ID" match="author" use="@id" />-->
	<xsl:template match="books">
		<xsl:copy>
			<xsl:apply-templates/>
		</xsl:copy>
	</xsl:template>
	<xsl:template match="//item">
    </xsl:template>
	<xsl:template match="//authors">
    </xsl:template>    
	<xsl:template match="//halls/hall">
		<xsl:variable name="hall_id" select="./@number"/>
		<!--new element hall-->
		<xsl:element name="hall">
			<xsl:attribute name="number">
				<xsl:value-of select="@number"/>
			</xsl:attribute>
			<xsl:for-each select="//item[@hall = $hall_id]">
				<xsl:element name="author">
					<xsl:attribute name="title">
						<xsl:value-of select="@title"/>
					</xsl:attribute>
					
					<xsl:variable name="author_id" select="@id"/>
					
					<xsl:attribute name="name">
						<xsl:copy>
						<xsl:for-each select="//authors/author[@id = $author_id]">
							<xsl:value-of select="//authors/author/@name"/>
						</xsl:for-each>
						</xsl:copy>
					</xsl:attribute>
					
					
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>