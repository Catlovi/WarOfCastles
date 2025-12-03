<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Villages Overview</title>
                <style>
                    table { border-collapse: collapse; width: 90%; margin: 20px auto; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h2 { text-align: center; }
                </style>
            </head>
            <body>
                <h2>Villages and Troop Production</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Troop Production</th>
                    </tr>
                    <!-- Apply templates to each Village -->
                    <xsl:apply-templates select="Villages/Village"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each Village -->
    <xsl:template match="Village">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="Name"/></td>
            <td>
                <!-- Apply templates to each Troop -->
                <xsl:apply-templates select="TroopProduction/Troop"/>
            </td>
        </tr>
    </xsl:template>

    <!-- Template for each Troop -->
    <xsl:template match="Troop">
        <xsl:value-of select="@type"/>: <xsl:value-of select="@quantity"/>
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

</xsl:stylesheet>