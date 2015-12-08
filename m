From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] of/address: replace printk() with pr_debug() / pr_err()
Date: Wed,  9 Dec 2015 01:07:48 +0900
Message-ID: <1449590868-19070-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Frank Rowand <frowand.list@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@linaro.org>
List-Id: devicetree@vger.kernel.org

Trivial changes suggested by checkpatch.pl.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2:
  - Fix printk(KERN_DEBUG ...) too

 drivers/of/address.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 9582c57..65fafbb 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -23,7 +23,7 @@ static int __of_address_to_resource(struct device_node *dev,
 #ifdef DEBUG
 static void of_dump_addr(const char *s, const __be32 *addr, int na)
 {
-	printk(KERN_DEBUG "%s", s);
+	pr_debug("%s", s);
 	while (na--)
 		printk(" %08x", be32_to_cpu(*(addr++)));
 	printk("\n");
@@ -597,7 +597,7 @@ static u64 __of_translate_address(struct device_node *dev,
 		pbus = of_match_bus(parent);
 		pbus->count_cells(dev, &pna, &pns);
 		if (!OF_CHECK_COUNTS(pna, pns)) {
-			printk(KERN_ERR "prom_parse: Bad cell count for %s\n",
+			pr_err("prom_parse: Bad cell count for %s\n",
 			       of_node_full_name(dev));
 			break;
 		}
-- 
1.9.1
