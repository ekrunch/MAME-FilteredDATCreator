<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- 1. The Identity Template: This rule copies every node (elements, text, comments, etc.) 
         and every attribute it finds, preserving the XML structure by default. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- 2. The Exclusion Template: This rule overrides the Identity Template.
         It matches any 'machine' element that:
         
         a) Does NOT have a 'driver' child element with a status attribute equal to "good" 
            (not(driver[@status = 'good'])) 
         OR
         b) Has the 'cloneof' attribute set (@cloneof).
         
         These machines are FILTERED OUT (suppressed), ensuring ONLY parent machines 
         with a good driver status are SELECTed (kept) in the output. -->
    <xsl:template match="machine[not(driver[@status = 'good']) or @cloneof]"/>

</xsl:stylesheet>

