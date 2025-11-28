<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="html" indent="yes"/>

    <!-- Root template -->
    <xsl:template match="/">
        <html>
            <head>
                <title>Cards Overview</title>
                <style>
                    table { border-collapse: collapse; width: 90%; margin: 20px auto; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: left; }
                    th { background-color: #f2f2f2; }
                    h2 { text-align: center; }
                </style>
            </head>
            <body>
                <h2>Benefit Cards</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Troop Gains</th>
                    </tr>
                    <xsl:apply-templates select="Cards/BenefitCard"/>
                </table>

                <h2>Defect Cards</h2>
                <table>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Troop Losses</th>
                    </tr>
                    <xsl:apply-templates select="Cards/DefectCard"/>
                </table>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="BenefitCard">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="Name"/></td>
            <td><xsl:value-of select="Description"/></td>
            <td>
                <xsl:apply-templates select="TroopGain"/>
            </td>
        </tr>
    </xsl:template>


    <xsl:template match="DefectCard">
        <tr>
            <td><xsl:value-of select="@id"/></td>
            <td><xsl:value-of select="Name"/></td>
            <td><xsl:value-of select="Description"/></td>
            <td>
                <xsl:apply-templates select="TroopLoss"/>
            </td>
        </tr>
    </xsl:template>

 
    <xsl:template match="TroopGain">
        <xsl:value-of select="@type"/>: <xsl:value-of select="@quantity"/>
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

    
    <xsl:template match="TroopLoss">
        <xsl:value-of select="@type"/>: <xsl:value-of select="@quantity"/>
        <xsl:if test="position() != last()">, </xsl:if>
    </xsl:template>

</xsl:stylesheet>