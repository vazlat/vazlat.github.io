<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="tempAir-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="tempAir-number" class="number">№</th>
                    <th id="tempAir-title" class="title">Название</th>
                    <th id="tempAir-unit" class="unit">Единица измерения</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="tempAir-value" class="value sort sorted_asc" onclick="SortByValue('tempAir')">Значение</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="tempAir-value" class="value sort sorted_dec" onclick="SortByValue('tempAir')">Значение</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="tempAir-date" class="date sort" onclick="SortByDate('tempAir')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[title='Air temperature']">
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
