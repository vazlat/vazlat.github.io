<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="noize-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="noize-number" class="number">№</th>
                    <th id="noize-title" class="title">Название</th>
                    <th id="noize-unit" class="unit">Единица измерения</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="noize-value" class="value sort sorted_asc" onclick="SortByValue('noize')">Значение</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="noize-value" class="value sort sorted_dec" onclick="SortByValue('noize')">Значение</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="noize-date" class="date sort" onclick="SortByDate('noize')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[title='Noise']">
                <xsl:sort select="value" order="{$sortOrder}"/>
                    <tr>
                        <th>
                            <xsl:value-of select="position()"/>
                        </th>
                        <td>
                            <xsl:value-of select="title"/>
                        </td>
                        <td>
                            <xsl:value-of select="unit"/>
                        </td>
                        <td>
                            <xsl:value-of select="value"/>
                        </td>
                        <td>
                            <xsl:value-of select="concat(
                            substring(date,9,2),'.',
                            substring(date,6,2),'.',
                            substring(date,1,4))"/>
                            &#160;
                            <xsl:value-of select="time"/>
                        </td>
                    </tr>
            </xsl:for-each>
            </tbody>
        </table>
    </xsl:template>
</xsl:stylesheet>
