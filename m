From: Brian Norris <computersforpeace@gmail.com>
Subject: [RFC PATCH 6/7] RFC: mtd: partitions: enable of_match_table matching
Date: Fri,  4 Dec 2015 21:19:22 -0800
Message-ID: <1449292763-129421-7-git-send-email-computersforpeace@gmail.com>
References: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449292763-129421-1-git-send-email-computersforpeace@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@free-electrons.com>, Linus Walleij <linus.walleij@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Arlott <simon@fire.lp0.eu>, Jason Gunthorpe <jgunthorpe@obsidianresearch.com>, Jonas Gorski <jogo@openwrt.org>, Brian Norris <computersforpeace@gmail.com>, devicetree@vger.kernel.org, devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Arnd Bergmann <arnd@arndb.de>
List-Id: devicetree@vger.kernel.org

Partition parsers can now provide an of_match_table to enable
flash<-->parser matching via device tree.

TODO: Doesn't yet work when parser is built as module. I can't just use
request_module() and friends, since OF matches don't tell me the name of
the driver/module. Maybe I can report uevents?

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/mtdpart.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index b3100742ddf6..91eb2df0bf1e 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -29,6 +29,7 @@
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of_mtd.h>
 #include <linux/err.h>
 #include <linux/kconfig.h>
 
@@ -728,6 +729,25 @@ static struct mtd_part_parser *mtd_part_parser_get_by_name(const char *name)
 	return __mtd_part_parser_get_by_name(name);
 }
 
+static struct mtd_part_parser *mtd_part_parser_get_by_of(struct mtd_info *mtd)
+{
+	struct mtd_part_parser *p, *ret = NULL;
+
+	spin_lock(&part_parser_lock);
+
+	list_for_each_entry(p, &part_parsers, list) {
+		if (of_mtd_match_mtd_parser(mtd, p) &&
+				try_module_get(p->owner)) {
+			ret = p;
+			break;
+		}
+	}
+
+	spin_unlock(&part_parser_lock);
+
+	return ret;
+}
+
 static inline void mtd_part_parser_put(const struct mtd_part_parser *p)
 {
 	module_put(p->owner);
@@ -847,6 +867,18 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 		if (ret < 0 && !err)
 			err = ret;
 	}
+
+	parser = mtd_part_parser_get_by_of(master);
+	if (!parser)
+		return err;
+
+	ret = mtd_part_do_parse(parser, master, pparts, data);
+	if (ret > 0)
+		return 0;
+	mtd_part_parser_put(parser);
+	if (ret < 0 && !err)
+		err = ret;
+
 	return err;
 }
 
-- 
2.6.0.rc2.230.g3dd15c0
