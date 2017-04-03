<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="html">

  <xsl:output method="xml"
         doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
         doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
         version="1.0"
         indent="yes"
         omit-xml-declaration="yes"
         encoding="utf-8"/>

  <xsl:param name="p_one">
    <!-- from lev2_a.xsl -->
  </xsl:param>

  <xsl:variable name="v_one">
    <!-- from lev2_a.xsl -->
    <xsl:text>v_one</xsl:text>
  </xsl:variable>

  <xsl:variable name="assume" select="lev2_a" />

  <xsl:template match="/">
    <!-- From lev2_a.xsl -->
    <html>
      <head>
        <title>Title</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
      </head>
      <body>
        <h1>Title</h1>
        <p>Content</p>
      </body>
    </html>
  </xsl:template>

  <xsl:template name="lev2_a">
  </xsl:template>

</xsl:stylesheet>
