<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="all-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="all-number" class="number">№</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="all-title" class="title sort sorted_asc" onclick="SortByTitle('all')">Название</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="all-title" class="title sort sorted_dec" onclick="SortByTitle('all')">Название</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="all-unit" class="unit sort" onclick="SortByUnit('all')">Единица измерения</th>
                    <th id="all-value" class="value sort" onclick="SortByValue('all')">Значение</th>
                    <th id="all-date" class="date sort" onclick="SortByDate('all')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering">
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
