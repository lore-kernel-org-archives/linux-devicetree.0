From: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [RFC PATCH 5/7] mtd: partitions: factor out "match by name" handling
Date: Fri,  4 Dec 2015 21:19:21 -0800
Message-ID: <1449292763-129421-6-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Return-path: <devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-spec-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>, Simon Arlott <simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Jonas Gorski <jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-spec-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This code structure is going to be imitated for a match-by-device-node
implementation, so let's factor out a few functions to make this easier.

Signed-off-by: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mtd/mtdpart.c | 67 +++++++++++++++++++++++++++++++++++++++------------
 1 file changed, 52 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index 10bf304027dd..b3100742ddf6 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -687,23 +687,47 @@ int add_mtd_partitions(struct mtd_info *master,
 static DEFINE_SPINLOCK(part_parser_lock);
 static LIST_HEAD(part_parsers);
 
-static struct mtd_part_parser *mtd_part_parser_get(const char *name)
+static bool mtd_part_parser_match_name(struct mtd_part_parser *p,
+				       const char *name)
+{
+	return !strcmp(p->name, name);
+}
+
+static struct mtd_part_parser *__mtd_part_parser_get_by_name(const char *name)
 {
 	struct mtd_part_parser *p, *ret = NULL;
 
 	spin_lock(&part_parser_lock);
 
-	list_for_each_entry(p, &part_parsers, list)
-		if (!strcmp(p->name, name) && try_module_get(p->owner)) {
+	list_for_each_entry(p, &part_parsers, list) {
+		if (mtd_part_parser_match_name(p, name) &&
+				try_module_get(p->owner)) {
 			ret = p;
 			break;
 		}
+	}
 
 	spin_unlock(&part_parser_lock);
 
 	return ret;
 }
 
+static struct mtd_part_parser *mtd_part_parser_get_by_name(const char *name)
+{
+	struct mtd_part_parser *p;
+
+	/* Get parser, if already loaded */
+	p = __mtd_part_parser_get_by_name(name);
+	if (p)
+		return p;
+
+	if (request_module("%s", name))
+		return NULL;
+
+	/* Try again */
+	return __mtd_part_parser_get_by_name(name);
+}
+
 static inline void mtd_part_parser_put(const struct mtd_part_parser *p)
 {
 	module_put(p->owner);
@@ -752,6 +776,27 @@ static const char * const default_mtd_part_types[] = {
 	NULL
 };
 
+static int mtd_part_do_parse(struct mtd_part_parser *parser,
+			     struct mtd_info *master,
+			     struct mtd_partitions *pparts,
+			     struct mtd_part_parser_data *data)
+{
+	int ret;
+
+	ret = (*parser->parse_fn)(master, &pparts->parts, data);
+	pr_debug("%s: parser %s: %i\n", master->name, parser->name, ret);
+	if (ret <= 0)
+		return ret;
+
+	pr_notice("%d %s partitions found on MTD device %s\n",
+		  ret, parser->name, master->name);
+
+	pparts->nr_parts = ret;
+	pparts->parser = parser;
+
+	return ret;
+}
+
 /**
  * parse_mtd_partitions - parse MTD partitions
  * @master: the master partition (describes whole MTD device)
@@ -785,23 +830,15 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 
 	for ( ; *types; types++) {
 		pr_debug("%s: parsing partitions %s\n", master->name, *types);
-		parser = mtd_part_parser_get(*types);
-		if (!parser && !request_module("%s", *types))
-			parser = mtd_part_parser_get(*types);
+		parser = mtd_part_parser_get_by_name(*types);
 		pr_debug("%s: got parser %s\n", master->name,
 			 parser ? parser->name : NULL);
 		if (!parser)
 			continue;
-		ret = (*parser->parse_fn)(master, &pparts->parts, data);
-		pr_debug("%s: parser %s: %i\n",
-			 master->name, parser->name, ret);
-		if (ret > 0) {
-			printk(KERN_NOTICE "%d %s partitions found on MTD device %s\n",
-			       ret, parser->name, master->name);
-			pparts->nr_parts = ret;
-			pparts->parser = parser;
+		ret = mtd_part_do_parse(parser, master, pparts, data);
+		/* Found partitions! */
+		if (ret > 0)
 			return 0;
-		}
 		mtd_part_parser_put(parser);
 		/*
 		 * Stash the first error we see; only report it if no parser
-- 
2.6.0.rc2.230.g3dd15c0
