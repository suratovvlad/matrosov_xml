<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" encoding="utf-8" indent="yes"/>
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
					
					<xsl:variable name="author_id" select="@author"/>
					
					<xsl:for-each select="//authors/author">
						<xsl:if test="@id = $author_id">				
							<xsl:attribute name="name">
								<xsl:value-of select="@name"/>
							</xsl:attribute>
						</xsl:if>
					</xsl:for-each>
					
				</xsl:element>
			</xsl:for-each>
		</xsl:element>
	</xsl:template>
</xsl:stylesheet>