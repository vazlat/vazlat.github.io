<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:ms="urn:schemas-microsoft-com:xslt">
    <xsl:template match="/">
        <div class="container-fluid">
        <div class="row cardRow">
        <xsl:for-each select="dataBase/measurement/metering">
            <xsl:sort select="date" order="descending"/>
            <xsl:sort select="time" order="descending"/>
            <div class="card col-lg-2 col-md-3">
                <div class="card-body">
                    <h5 class="card-title"><xsl:value-of select="title"/></h5>
                    <div class="card-text">
                        <div class="">Value: <xsl:value-of select="value"/><xsl:value-of select="unit"/></div>
                        <div class="">
                            <xsl:value-of select="concat(
                            substring(date,9,2),'.',
                            substring(date,6,2),'.',
                            substring(date,1,4))"/>
                            <xsl:text> </xsl:text>
                            <xsl:value-of select="time"/>
                        </div>
                        <xsl:variable name="vTitle" select="title"/>
                        <xsl:variable name="vConst" select="//dataBase/consts/const[title=$vTitle]"/>

                        <xsl:choose>
                            <xsl:when test="substring(date, 6, 2) &gt;= 3 and substring(date, 6, 2) &lt;= 8">
                                <!-- Если теплое время года -->
                                <xsl:choose>
                                    <xsl:when test="value &gt; $vConst/warm/optimal/max or value &lt; $vConst/warm/optimal/min">
                                        <!-- Не оптимально -->
                                        <xsl:choose>
                                            <xsl:when test="value &gt; $vConst/warm/permissible/max">
                                                <!-- Выше нормы -->
                                                <div class="recommend text-danger">
                                                    The value is higher than the permissible
                                                    <xsl:text>&#13;&#10;</xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="title = 'Air temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the air conditioner
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Surface temperature'">
                                                            <!-- Выше нормы -->
                                                            Unplug the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Relative humidity'">
                                                            <!-- Выше нормы -->
                                                            Turn on the dehumidifier
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Noise'">
                                                            <!-- Выше нормы -->
                                                            Reduce noise
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Illumination'">
                                                            <!-- Выше нормы -->
                                                            Reduce the light level
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="value &lt; $vConst/warm/permissible/min">
                                                <!-- Ниже нормы -->
                                                <div class="recommend text-danger">
                                                    Value below acceptable
                                                    <xsl:text>&#13;&#10;</xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="title = 'Air temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Surface temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Relative humidity'">
                                                            <!-- Выше нормы -->
                                                            Turn on the humidifier
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Illumination'">
                                                            <!-- Выше нормы -->
                                                            Increase the light level
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </div>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!-- Допустимое значение -->
                                                <div class="recommend text-warning">
                                                    The value in the limits of the permissible
                                                </div>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- Оптимальное значение -->
                                        <div class="recommend text-success">Value is optimal</div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:otherwise>
                                <!-- Если холодное время года -->
                                <xsl:choose>
                                    <xsl:when test="value &gt; $vConst/cold/optimal/max or value &lt; $vConst/cold/optimal/min">
                                        <!-- Не оптимально -->
                                        <xsl:choose>
                                            <xsl:when test="value &gt; $vConst/cold/permissible/max or value &lt; $vConst/cold/permissible/min">
                                                <!-- Выше нормы -->
                                                <div class="recommend text-danger">
                                                    The value is higher than the permissible
                                                    <xsl:text>&#13;&#10;</xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="title = 'Air temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the air conditioner
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Surface temperature'">
                                                            <!-- Выше нормы -->
                                                            Unplug the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Relative humidity'">
                                                            <!-- Выше нормы -->
                                                            Turn on the dehumidifier
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Noise'">
                                                            <!-- Выше нормы -->
                                                            Reduce noise
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Illumination'">
                                                            <!-- Выше нормы -->
                                                            Reduce the light level
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </div>
                                            </xsl:when>
                                            <xsl:when test="value &lt; $vConst/cold/permissible/min">
                                                <!-- Ниже нормы -->
                                                <div class="recommend text-danger">
                                                    Value below acceptable
                                                    <xsl:text>&#13;&#10;</xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="title = 'Air temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Surface temperature'">
                                                            <!-- Выше нормы -->
                                                            Turn on the heater
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Relative humidity'">
                                                            <!-- Выше нормы -->
                                                            Turn on the humidifier
                                                        </xsl:when>
                                                        <xsl:when test="title = 'Illumination'">
                                                            <!-- Выше нормы -->
                                                            Increase the light level
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </div>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <!-- Допустимое значение -->
                                                <div class="recommend text-warning">The value in the limits of the permissible</div>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <!-- Оптимальное значение -->
                                        <div class="recommend text-success">Value is optimal</div>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:otherwise>
                        </xsl:choose>
                    </div>
                </div>
            </div>
        </xsl:for-each>
        </div>
        </div>
    </xsl:template>
</xsl:stylesheet>
