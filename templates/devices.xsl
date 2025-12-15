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
         
         a) Does NOT have the 'isdevice' attribute set to 'yes' (not(@isdevice = 'yes')).
         
         These machines are FILTERED OUT (suppressed), ensuring ONLY machine elements 
         that are explicitly marked as Devices are SELECTed (kept) in the output. -->
    <xsl:template match="machine[not(@isdevice = 'yes')]"/>

</xsl:stylesheet>

