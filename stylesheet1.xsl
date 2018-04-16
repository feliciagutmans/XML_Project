<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xs"
    version="2.0">
    
<xsl:template match="/poems">
<html>
<head>    
    <title><xsl:value-of select="title"/></title>
</head>
<body> 
    <xsl:for-each select="poem">
        <xsl:apply-templates select="title"/>
        <xsl:apply-templates select="author"/>
        <xsl:apply-templates select="stanza"/>
        <br></br><br></br>
    </xsl:for-each>    
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
    <xsl:value-of select="."/><br/>
</xsl:template>
    
</xsl:stylesheet>    

    <!--<xsl:for-each select="poem"> 
        <xsl:value-of select="title"/> <br/> <br/>
        <xsl:value-of select="author"/> <br/>
        <xsl:value-of select="stanza attribute::no"/> <br/>
        <xsl:value-of select="stanza"/> <br/> -->