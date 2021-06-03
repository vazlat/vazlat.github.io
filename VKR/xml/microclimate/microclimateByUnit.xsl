<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:param name="sortOrder"/>
    <xsl:template match="/dataBase">
        <table id="microclimate-table" class="tableXml table">
            <thead>
                <tr>
                    <th id="microclimate-number" class="number">№</th>
                    <th id="microclimate-title" class="title sort" onclick="SortByTitle('microclimate')">Название</th>
                    <xsl:choose>
                        <xsl:when test="$sortOrder = 'ascending'">
                            <th id="microclimate-unit" class="unit sort sorted_asc" onclick="SortByUnit('microclimate')">Единица измерения</th>
                        </xsl:when>
                        <xsl:otherwise>
                            <th id="microclimate-unit" class="unit sort sorted_dec" onclick="SortByUnit('microclimate')">Единица измерения</th>
                        </xsl:otherwise>
                    </xsl:choose>
                    <th id="microclimate-value" class="value sort" onclick="SortByValue('microclimate')">Значение</th>
                    <th id="microclimate-date" class="date sort" onclick="SortByDate('microclimate')">Дата</th>
                </tr>
            </thead>
            <tbody>
            <xsl:for-each select="measurement/metering[type='Микроклимат']">
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
