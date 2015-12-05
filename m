From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 4/7] mtd: add of_match_mtd_parser() and of_mtd_match_mtd_parser() helpers
Date: Fri,  4 Dec 2015 21:19:20 -0800
Message-ID: <1449292763-129421-5-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Arlott <simon@fire.lp0.eu>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonas Gorski <jogo@openwrt.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Like the corresponding OF-based device/driver matching infrascture,
let's begin to support a mtd/partition-parser matching infrastructure.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/of/of_mtd.c            | 33 +++++++++++++++++++++++++++++++++
 include/linux/mtd/partitions.h |  2 ++
 include/linux/of_mtd.h         | 13 +++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/drivers/of/of_mtd.c b/drivers/of/of_mtd.c
index b7361ed70537..169d7500af5d 100644
--- a/drivers/of/of_mtd.c
+++ b/drivers/of/of_mtd.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/of_mtd.h>
 #include <linux/mtd/nand.h>
+#include <linux/mtd/partitions.h>
 #include <linux/export.h>
 
 /**
@@ -117,3 +118,35 @@ bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return of_property_read_bool(np, "nand-on-flash-bbt");
 }
 EXPORT_SYMBOL_GPL(of_get_nand_on_flash_bbt);
+
+static const struct of_device_id *of_match_mtd_parser(
+		struct mtd_part_parser *parser, struct device_node *np)
+{
+	if (!parser || !np)
+		return NULL;
+
+	return of_match_node(parser->of_match_table, np);
+}
+
+static struct device_node *mtd_get_partitions_of_node(struct mtd_info *master)
+{
+	struct device_node *np = mtd_get_of_node(master);
+
+	if (!np)
+		return NULL;
+
+	return of_get_child_by_name(np, "partitions");
+}
+
+bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
+			     struct mtd_part_parser *parser)
+{
+	struct device_node *np = mtd_get_partitions_of_node(mtd);
+	bool ret;
+
+	ret = of_match_mtd_parser(parser, np) != NULL;
+	of_node_put(np);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(of_mtd_match_mtd_parser);
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 70736e1e6c8f..2e68ef561a40 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -51,6 +51,7 @@ struct mtd_partition {
 
 struct mtd_info;
 struct device_node;
+struct of_device_id;
 
 /**
  * struct mtd_part_parser_data - used to pass data to MTD partition parsers.
@@ -69,6 +70,7 @@ struct mtd_part_parser {
 	struct list_head list;
 	struct module *owner;
 	const char *name;
+	const struct of_device_id *of_match_table;
 	int (*parse_fn)(struct mtd_info *, const struct mtd_partition **,
 			struct mtd_part_parser_data *);
 	void (*cleanup)(const struct mtd_partition *pparts, int nr_parts);
diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index e266caa36402..781362d0be0c 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -9,6 +9,10 @@
 #ifndef __LINUX_OF_MTD_H
 #define __LINUX_OF_MTD_H
 
+#include <linux/mtd/mtd.h>
+
+struct mtd_part_parser;
+
 #ifdef CONFIG_OF_MTD
 
 #include <linux/of.h>
@@ -18,6 +22,9 @@ int of_get_nand_ecc_strength(struct device_node *np);
 int of_get_nand_bus_width(struct device_node *np);
 bool of_get_nand_on_flash_bbt(struct device_node *np);
 
+bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
+			     struct mtd_part_parser *parser);
+
 #else /* CONFIG_OF_MTD */
 
 static inline int of_get_nand_ecc_mode(struct device_node *np)
@@ -45,6 +52,12 @@ static inline bool of_get_nand_on_flash_bbt(struct device_node *np)
 	return false;
 }
 
+static inline bool of_mtd_match_mtd_parser(struct mtd_info *mtd,
+					   struct mtd_part_parser *parser)
+{
+	return false;
+}
+
 #endif /* CONFIG_OF_MTD */
 
 #endif /* __LINUX_OF_MTD_H */
-- 
2.6.0.rc2.230.g3dd15c0
