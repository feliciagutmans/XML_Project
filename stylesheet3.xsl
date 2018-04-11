<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    <xsl:template match="poem">
        <html>
            <head>    
                <title><xsl:value-of select="title"/></title>
            </head>
            <body> 
                <xsl:apply-templates select="title"/>
                <xsl:apply-templates select="author"/>
                <xsl:apply-templates select="stanza"/>
             <!--   <xsl:apply-templates select="direct-address/@you"/> -->
            </body>   
        </html>    
    </xsl:template>
    
    <xsl:template match="title">  
        <div align="center"><h1><xsl:value-of select="."/></h1></div>
    </xsl:template>
    
    <xsl:template match="author">
        <div align="center"><h2>By <xsl:value-of select="."/></h2></div>
    </xsl:template>
    
    <xsl:template match="stanza">
        <p align="center"><xsl:apply-templates select="line"/></p> 
    </xsl:template>
    
    <xsl:template match="line">
        <xsl:if test="position() mod 2 = 0">&#160;&#160;</xsl:if>
        <xsl:value-of select="colloquial"/><br/>
    </xsl:template>
    
    <xsl:template match="colloquial">
        <p><xsl:value-of select="colloquial"/></p>
   <!-- <xsl:value-of select="direct-address/@you"></xsl:value-of><br/> -->
    </xsl:template>
        
    <xsl:template match="direct-address">
    <p><xsl:value-of select="direct-address/@imperative"/></p>
    </xsl:template>
  
</xsl:stylesheet>  



<!--
    <xsl:template match="direct-address">
    <p><xsl:value-of select="direct-address/@imperative"/></p>
    </xsl:template>
    
    template match="direct-address">
    
        <xsl:copy>
            <xsl:attribute name="n">
                <xsl:number from="poem" level="any"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </xsl:copy>
     
        <xsl:for-each select="direct-address">
        <xsl:attribute name="{@you}">
            <xsl:value-of select="poem"/>
        </xsl:attribute>
        </xsl:for-each>
         -->