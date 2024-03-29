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
                    <th id="production-title" class="title sort" onclick="SortByTitle('production')">Name</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="production-unit" class="unit sort sorted_asc" onclick="SortByUnit('production')">Unit of measurement</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="production-unit" class="unit sort sorted_dec" onclick="SortByUnit('production')">Unit of measurement</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="production-value" class="value sort" onclick="SortByValue('production')">Value</th>
                    <th id="production-date" class="date sort" onclick="SortByDate('production')">Date</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[type='Production factors']">
                <xsl:sort select="unit" order="{$sortOrder}"/>
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
