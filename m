From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V9 1/4] mtd: partitions: add special treating for the "ofpart" parser type
Date: Tue, 30 Jan 2018 21:10:56 +0100
Message-ID: <20180130201059.4424-2-zajec5@gmail.com>
References: <20180130201059.4424-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180130201059.4424-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-yU5RGvR974pGWvitb5QawA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, John Crispin <john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

In order to properly support compatibility strings as described in the
bindings/mtd/partition.txt "ofpart" type should be treated as an
indication for looking into OF. MTD should check "compatible" property
and search for a matching parser rather than blindly trying a one for
the "fixed-partitions".

This also means that existing parser should get renamed into a more
meaningful one.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V9: First appearance of this commit
---
 drivers/mtd/mtdpart.c | 61 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 76cd21d1171b..d40ec525ceff 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -860,6 +860,38 @@ static int mtd_part_do_parse(struct mtd_part_parser *parser,
 	return ret;
 }
 
+static int mtd_part_of_parse(struct mtd_info *master,
+			     struct mtd_partitions *pparts)
+{
+	struct mtd_part_parser *parser;
+	const char *fixed = "ofpart";
+	int ret, err = 0;
+
+	/*
+	 * TODO: Check "compatible" DT property and look for a matching parser.
+	 */
+
+	/*
+	 * For backward compatibility we have to try the "ofpart"
+	 * parser. It supports old DT format with partitions specified as a
+	 * direct subnodes of a flash device DT node without any compatibility
+	 * specified we could match.
+	 */
+	parser = mtd_part_parser_get(fixed);
+	if (!parser && !request_module("%s", fixed))
+		parser = mtd_part_parser_get(fixed);
+	if (parser) {
+		ret = mtd_part_do_parse(parser, master, pparts, NULL);
+		if (ret > 0)
+			return ret;
+		mtd_part_parser_put(parser);
+		if (ret < 0 && !err)
+			err = ret;
+	}
+
+	return err;
+}
+
 /**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
@@ -892,19 +924,30 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		types = default_mtd_part_types;
 
 	for ( ; *types; types++) {
-		pr_debug("%s: parsing partitions %s\n", master->name, *types);
-		parser = mtd_part_parser_get(*types);
-		if (!parser && !request_module("%s", *types))
+		/*
+		 * ofpart is a special type that means OF partitioning info
+		 * should be used. It requires a bit different logic so it is
+		 * handled in a separated function.
+		 */
+		if (!strcmp(*types, "ofpart")) {
+			ret = mtd_part_of_parse(master, pparts);
+		} else {
+			pr_debug("%s: parsing partitions %s\n", master->name,
+				 *types);
 			parser = mtd_part_parser_get(*types);
-		pr_debug("%s: got parser %s\n", master->name,
-			 parser ? parser->name : NULL);
-		if (!parser)
-			continue;
-		ret = mtd_part_do_parse(parser, master, pparts, data);
+			if (!parser && !request_module("%s", *types))
+				parser = mtd_part_parser_get(*types);
+			pr_debug("%s: got parser %s\n", master->name,
+				parser ? parser->name : NULL);
+			if (!parser)
+				continue;
+			ret = mtd_part_do_parse(parser, master, pparts, data);
+			if (ret <= 0)
+				mtd_part_parser_put(parser);
+		}
 		/* Found partitions! */
 		if (ret > 0)
 			return 0;
-		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
 		 * succeeds
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
