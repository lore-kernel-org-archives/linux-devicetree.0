From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V9 2/4] mtd: rename "ofpart" parser to "fixed-partitions" as it fits it better
Date: Tue, 30 Jan 2018 21:10:57 +0100
Message-ID: <20180130201059.4424-3-zajec5@gmail.com>
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

Type "ofpart" means that OF should be used to get partitioning info and
this driver supports "fixed-partitions" binding only. Renaming it should
lead to less confusion especially when parsers for new compatibility
strings start to appear.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
V9: First appearance of this commit
---
 drivers/mtd/mtdpart.c |  4 ++--
 drivers/mtd/ofpart.c  | 11 ++++++-----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index d40ec525ceff..a29bbcf79691 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -864,7 +864,7 @@ static int mtd_part_of_parse(struct mtd_info *master,
 			     struct mtd_partitions *pparts)
 {
 	struct mtd_part_parser *parser;
-	const char *fixed = "ofpart";
+	const char *fixed = "fixed-partitions";
 	int ret, err = 0;
 
 	/*
@@ -872,7 +872,7 @@ static int mtd_part_of_parse(struct mtd_info *master,
 	 */
 
 	/*
-	 * For backward compatibility we have to try the "ofpart"
+	 * For backward compatibility we have to try the "fixed-partitions"
 	 * parser. It supports old DT format with partitions specified as a
 	 * direct subnodes of a flash device DT node without any compatibility
 	 * specified we could match.
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 6bdf4e525677..9f497315e65d 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -25,9 +25,9 @@ static bool node_has_compatible(struct device_node *pp)
 	return of_get_property(pp, "compatible", NULL);
 }
 
-static int parse_ofpart_partitions(struct mtd_info *master,
-				   const struct mtd_partition **pparts,
-				   struct mtd_part_parser_data *data)
+static int parse_fixed_partitions(struct mtd_info *master,
+				  const struct mtd_partition **pparts,
+				  struct mtd_part_parser_data *data)
 {
 	struct mtd_partition *parts;
 	struct device_node *mtd_node;
@@ -141,8 +141,8 @@ static int parse_ofpart_partitions(struct mtd_info *master,
 }
 
 static struct mtd_part_parser ofpart_parser = {
-	.parse_fn = parse_ofpart_partitions,
-	.name = "ofpart",
+	.parse_fn = parse_fixed_partitions,
+	.name = "fixed-partitions",
 };
 
 static int parse_ofoldpart_partitions(struct mtd_info *master,
@@ -229,4 +229,5 @@ MODULE_AUTHOR("Vitaly Wool, David Gibson");
  * with the same name. Since we provide the ofoldpart parser, we should have
  * the corresponding alias.
  */
+MODULE_ALIAS("fixed-partitions");
 MODULE_ALIAS("ofoldpart");
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
