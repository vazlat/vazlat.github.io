<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="tempSurface-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="tempSurface-number" class="number">№</th>
                    <th id="tempSurface-title" class="title">Название</th>
                    <th id="tempSurface-unit" class="unit">Единица измерения</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="tempSurface-value" class="value sort sorted_asc" onclick="SortByValue('tempSurface')">Значение</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="tempSurface-value" class="value sort sorted_dec" onclick="SortByValue('tempSurface')">Значение</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="tempSurface-date" class="date sort" onclick="SortByDate('tempSurface')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[title='Темпе­ратура поверх­ностей']">
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
