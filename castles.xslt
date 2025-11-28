<?xml version="1.0" encoding="utf-8"?>

<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Castles Overview</title>
                <style>
                    table { border-collapse: collapse; width: 90%; margin: 20px auto; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h2 { text-align: center; }
                </style>
            </head>
            <body>
                <h2>Castles</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Attack</th>
                        <th>Defense</th>
                        <th>Benefit</th>
                    </tr>
                    <!-- Apply templates to each Castle -->
                    <xsl:apply-templates select="Castles/Castle"/>
                </table>
            </body>
        </html>
    </xsl:template>

    <!-- Template for each Castle -->
    <xsl:template match="Castle">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="Name"/></td>
            <td><xsl:value-of select="Attack"/></td>
            <td><xsl:value-of select="Defense"/></td>
            <td><xsl:value-of select="Benefit"/></td>
        </tr>
    </xsl:template>

</xsl:stylesheet>