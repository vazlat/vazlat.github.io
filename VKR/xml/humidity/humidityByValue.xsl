<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="humidity-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="humidity-number" class="number">№</th>
                    <th id="humidity-title" class="title">Name</th>
                    <th id="humidity-unit" class="unit">Unit of measurement</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="humidity-value" class="value sort sorted_asc" onclick="SortByValue('humidity')">Value</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="humidity-value" class="value sort sorted_dec" onclick="SortByValue('humidity')">Value</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="humidity-date" class="date sort" onclick="SortByDate('humidity')">Date</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[title='Relative humidity']">
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
