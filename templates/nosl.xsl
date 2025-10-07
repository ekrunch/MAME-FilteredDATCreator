<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes"/>

    <!-- 1. The Identity Template: This rule copies every node (elements, text, comments, etc.) 
         and every attribute it finds. This ensures the basic structure of the XML is preserved. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- 2. The Exclusion Template: This rule overrides the Identity Template.
         It matches any 'machine' element that contains a 'softwarelist' child element.
         Since the template body is empty, these matched machine nodes are filtered out (removed) from the output. -->
    <xsl:template match="machine[softwarelist]"/>

</xsl:stylesheet>
