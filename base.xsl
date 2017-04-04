<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet
   version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   xmlns="http://www.w3.org/1999/xhtml"
   xmlns:html="http://www.w3.org/1999/xhtml"
   exclude-result-prefixes="html">

  <xsl:import href="lev1_a.xsl" />
  <xsl:import href="lev1_b.xsl" />

  <xsl:output method="xml"
         doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN"
         doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd"
         version="1.0"
         indent="yes"
         omit-xml-declaration="yes"
         encoding="utf-8"/>

  <xsl:variable name="assume" select="base" />

  <xsl:template match="/">
    <html>
      <head>
        <title>Title</title>
        <link rel="stylesheet" href="styles.css" type="text/css" />
      </head>
      <body>
        <h1>Title</h1>
        <p>Content</p>
        This is some unenclosed (ignoring &lt;body&gt;) text,
        over multiple lines, to test how it is cloned using
        clone_element_omit_comments().
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
