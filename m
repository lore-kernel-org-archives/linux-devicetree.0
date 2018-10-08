From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH v2] of: base: Fix english spelling in of_alias_get_alias_list()
Date: Mon,  8 Oct 2018 13:58:47 +0200
Message-ID: <1e4e9047636e94dc2bff62b915bd0261f334dd8a.1538999925.git.michal.simek@xilinx.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, monstr@monstr.eu, gregkh@linuxfoundation.org, geert@linux-m68k.org, rdunlap@infradead.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
List-Id: devicetree@vger.kernel.org

Fix english spelling in of_alias_get_alias_list().

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Fixes: b1078c355d76 ("of: base: Introduce of_alias_get_alias_list() to check alias IDs")
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

Changes in v2:
- Fix 2 more issues reported by Randy Dunlap
- Add fixed log sha1

Greg: Please apply it on the top of tty-next because patch is going via
your tree.

---
 drivers/of/base.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 33011b88ed3f..908de45f966b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1948,7 +1948,7 @@ int of_alias_get_id(struct device_node *np, const char *stem)
  * @matches:	Array of OF device match structures to search in
  * @stem:	Alias stem of the given device_node
  * @bitmap:	Bitmap field pointer
- * @nbits:	Maximum number of alias ID which can be recorded it bitmap
+ * @nbits:	Maximum number of alias IDs which can be recorded in bitmap
  *
  * The function travels the lookup table to record alias ids for the given
  * device match structures and alias stem.
@@ -1971,7 +1971,7 @@ int of_alias_get_alias_list(const struct of_device_id *matches,
 			 __func__, app->stem, app->id);
 
 		if (strcmp(app->stem, stem) != 0) {
-			pr_debug("%s: stem comparison doesn't passed %s\n",
+			pr_debug("%s: stem comparison didn't pass %s\n",
 				 __func__, app->stem);
 			continue;
 		}
@@ -1986,7 +1986,7 @@ int of_alias_get_alias_list(const struct of_device_id *matches,
 			pr_debug("%s: Allocated ID %d\n", __func__, app->id);
 			set_bit(app->id, bitmap);
 		}
-		/* Alias exist but it not compatible with matches */
+		/* Alias exists but is not compatible with matches */
 	}
 	mutex_unlock(&of_mutex);
 
-- 
1.9.1
