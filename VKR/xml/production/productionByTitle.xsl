<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="production-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="production-number" class="number">№</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="production-title" class="title sort sorted_asc" onclick="SortByTitle('production')">Название</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="production-title" class="title sort sorted_dec" onclick="SortByTitle('production')">Название</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="production-unit" class="unit sort" onclick="SortByUnit('production')">Единица измерения</th>
                    <th id="production-value" class="value sort" onclick="SortByValue('production')">Значение</th>
                    <th id="production-date" class="date sort" onclick="SortByDate('production')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[type='Production factors']">
                <xsl:sort select="title" order="{$sortOrder}"/>
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
