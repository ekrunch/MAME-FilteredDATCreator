<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" indent="yes" />

    <!-- 1. The Identity Template: This rule copies every node (elements, text, comments, etc.) 
         and every attribute it finds. This ensures the structure of the XML is preserved by default. -->
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template>

    <!-- 2. The Exclusion Template: This rule overrides the Identity Template only for the nodes 
         we want to filter out. It matches any 'machine' element that has the 'cloneof' attribute.
         Since the template body is empty, these matched nodes are effectively removed from the output.
         This achieves the equivalent of XPath's [not(@cloneof)] by removing all that ARE clones. -->
    <xsl:template match="machine[@cloneof]"/>

</xsl:stylesheet>
