<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/library">
		<html>
			<head>
				<title> Project II: XML Database </title>
				<link rel="stylesheet" type="text/css" href="libraryext.css" />
				<h1>My Media Library</h1>
			</head>
			<body>
				<table id="media-library" border="1" width="75%">
					<tr>
						<th><h2>Media</h2></th>
						<th><h2>Genre</h2></th>
						<th><h2>Series</h2></th>
						<th><h2>Title of Work</h2></th>
						<th><h2>Key Personnel</h2></th>
						<th><h2>Synopsis</h2></th>
						<th><h2>Extra Information</h2></th>
						<th><h2>Publisher</h2></th>
						<th><h2>Release Date</h2></th>
					</tr>
					<xsl:for-each select="media">
					<tr>
						<td><xsl:value-of select="mediatype" /></td>
						<td><xsl:value-of select="genretype" /></td>
						<td><xsl:value-of select="series" /></td>
						<td align="right"><xsl:value-of select="title" /></td>
					<td>
					<xsl:for-each select="keypersonnel">
							<ul>
							<xsl:for-each select="person">
								<li><strong><xsl:value-of select="role" /></strong>
										<xsl:value-of select="name" /></li>
							</xsl:for-each>
							</ul>
					</xsl:for-each>
					</td>
					<td align="justify">
					<xsl:for-each select="synopsis">
						<xsl:if test="summary">
							<xsl:value-of select="summary"/>
						</xsl:if>
						<ol>
						<xsl:if test="tracklist">
						<xsl:for-each select="tracklist/track">
						<li>
						<xsl:value-of select="."/>
						</li>
						</xsl:for-each>
						</xsl:if>
						</ol>
					</xsl:for-each>
					</td>
					<td>
					<xsl:for-each select="extra">
						<xsl:if test ="book-extra">
							<ul>
								<li><xsl:value-of select="book-extra/pages"/> pages</li>
								<li>Book <strong><xsl:value-of select="book-extra/currentbook"/></strong> of <strong><xsl:value-of select="book-extra/totalinseries"/></strong></li>
							</ul>
						</xsl:if>
						<xsl:if test="dvd-extra">
							<ul>
								<li><strong>Rating: </strong><xsl:value-of select="dvd-extra/rating" /></li>
								<li><strong>Runtime: </strong><xsl:value-of select="dvd-extra/runtime"/> minutes </li>
							</ul>
						</xsl:if>
						<xsl:if test="cd-extra">
							<ul>
								<li><strong>Total Tracks: </strong> <xsl:value-of select="cd-extra/totaltracks"/></li>
								<li><strong>Studio Album: </strong><xsl:value-of select="cd-extra/albumnumber"/></li>
							</ul>
						</xsl:if>
					</xsl:for-each>
					</td>
					<td><xsl:value-of select="pub"/></td>
					<td align="center"><xsl:value-of select="pubdate" /></td>
					</tr>
					</xsl:for-each>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
