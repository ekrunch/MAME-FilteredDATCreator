<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>

    <!-- 1. The Identity Template: This rule copies every node (elements, text, comments, etc.) 
         and every attribute it finds, preserving the XML structure by default. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- 2. The Exclusion Template: This rule overrides the Identity Template.
         It matches any 'machine' element that:
         a) Does NOT have a 'coins' attribute on its 'input' child (not(input/@coins))
         OR
         b) The 'coins' attribute value is less than or equal to 0 (input/@coins <= 0).
         
         These machines are FILTERED OUT (suppressed), ensuring ONLY machines where 
         input/@coins is strictly greater than 0 are SELECTed (kept) in the output. -->
    <xsl:template match="machine[not(input/@coins) or input/@coins &lt;= 0]"/>

</xsl:stylesheet>

