<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <body>
                <h1><xsl:value-of select="//collection/description" /></h1>
                <div>
                    <xsl:for-each select="//recipe">
                        <h3><xsl:value-of select="title" /></h3>
                        <p>Date: <xsl:value-of select="date" /></p>
                        <strong>Ingredients: </strong>
                        <xsl:for-each select="ingredient">
                            <xsl:choose>
                            <xsl:when test="ingredient">
                                For - <xsl:value-of select="@name"/><xsl:text>&#9;</xsl:text>
                                <xsl:for-each select="ingredient">
                                    <ul>
                                        <li>
                                            <xsl:value-of select="@name"/><xsl:text>&#9;</xsl:text>
                                            <xsl:value-of select="@amount"/><xsl:text>&#9;</xsl:text>
                                            <xsl:value-of select="@unit"/>
                                        </li>
                                    </ul>
                                </xsl:for-each>
                                Preparation:
                                <ol>
                                    <xsl:for-each select="preparation/step">
                                        <li><xsl:value-of select="."/></li>
                                    </xsl:for-each>
                                </ol>
                            </xsl:when>
                            <xsl:otherwise>
                                <ul>
                                    <li>
                                        <xsl:value-of select="@name"/><xsl:text>&#9;</xsl:text>
                                        <xsl:value-of select="@amount"/><xsl:text>&#9;</xsl:text>
                                        <xsl:value-of select="@unit"/>
                                    </li>
                                </ul>

                            </xsl:otherwise>
                            </xsl:choose>
                        </xsl:for-each>
                        <strong>Preparation: </strong>
                        <ol>
                            <xsl:for-each select="preparation/step">
                                <li><xsl:value-of select="."/></li>
                            </xsl:for-each>
                        </ol>
                        <xsl:for-each select="comment">
                            <strong>Comment: </strong>
                            <p><xsl:value-of select="."/></p>
                        </xsl:for-each>
                        <strong>Nutrition: </strong>
                        <xsl:if test="nutrition/@calories">
                            <p>calories: <xsl:value-of select="nutrition/@calories"/></p>
                        </xsl:if>
                        <xsl:if test="nutrition/@fat">
                            <p>fat: <xsl:value-of select="nutrition/@fat"/></p>
                        </xsl:if>
                        <xsl:if test="nutrition/@carbohydrates">
                            <p>carbohydrates: <xsl:value-of select="nutrition/@carbohydrates"/></p>
                        </xsl:if>
                        <xsl:if test="nutrition/@protein">
                            <p>Protein: <xsl:value-of select="nutrition/@protein"/></p>
                        </xsl:if>
                        <xsl:if test="nutrition/@alcohol">
                            <p>Alcohol: <xsl:value-of select="nutrition/@alcohol"/></p>
                        </xsl:if>

                        <xsl:if test="related">
                            <strong>Related: </strong>
                            <p><xsl:value-of select="related"/></p>
                        </xsl:if>
                        <hr/>
                    </xsl:for-each>
                </div>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
