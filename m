From: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
Subject: [PATCH v2] mtd: part: add generic parsing of linux,part-probe
Date: Sun, 24 May 2015 20:38:34 +0200
Message-ID: <1432492714-12598-1-git-send-email-hauke@hauke-m.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, rjui-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This moves the linux,part-probe device tree parsing code from
physmap_of.c to mtdpart.c. Now all drivers can use this feature by just
providing a reference to their device tree node in struct
mtd_part_parser_data.

Signed-off-by: Hauke Mehrtens <hauke-5/S+JYg5SzeELgA04lAiVw@public.gmane.org>
---

changes since
v1:
 * add documentation for linux,part-probe
 * fix spacing
 * add documentation for of_get_probes()

 Documentation/devicetree/bindings/mtd/nand.txt | 16 ++++++++++
 drivers/mtd/maps/physmap_of.c                  | 40 +-----------------------
 drivers/mtd/mtdpart.c                          | 43 ++++++++++++++++++++++++++
 3 files changed, 60 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/nand.txt b/Documentation/devicetree/bindings/mtd/nand.txt
index b53f92e..028eb1854 100644
--- a/Documentation/devicetree/bindings/mtd/nand.txt
+++ b/Documentation/devicetree/bindings/mtd/nand.txt
@@ -12,6 +12,22 @@
 - nand-ecc-step-size: integer representing the number of data bytes
 		      that are covered by a single ECC step.
 
+- linux,part-probe: list of name as strings of the partition parser
+		    which should be used to parse the partition table.
+		    They will be tried in the specified ordering and
+		    the next one will be used if the previous one
+		    failed.
+
+		    Example: linux,part-probe = "cmdlinepart", "ofpart";
+
+		    This is also the default value, which will be used
+		    if this attribute is not specified. It could be
+		    that the flash driver in use overwrote the default
+		    value and uses some other default.
+
+		    Possible values are: bcm47xxpart, afs, ar7part,
+		    ofoldpart, ofpart, bcm63xxpart, RedBoot, cmdlinepart
+
 The ECC strength and ECC step size properties define the correction capability
 of a controller. Together, they say a controller can correct "{strength} bit
 errors per {size} bytes".
diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 774b32f..fd3750f 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -112,45 +112,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 static const char * const part_probe_types_def[] = {
 	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
 
-static const char * const *of_get_probes(struct device_node *dp)
-{
-	const char *cp;
-	int cplen;
-	unsigned int l;
-	unsigned int count;
-	const char **res;
-
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
-		return part_probe_types_def;
-
-	count = 0;
-	for (l = 0; l != cplen; l++)
-		if (cp[l] == 0)
-			count++;
-
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
-	count = 0;
-	while (cplen > 0) {
-		res[count] = cp;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-		count++;
-	}
-	return res;
-}
-
-static void of_free_probes(const char * const *probes)
-{
-	if (probes != part_probe_types_def)
-		kfree(probes);
-}
-
 static const struct of_device_id of_flash_match[];
 static int of_flash_probe(struct platform_device *dev)
 {
-	const char * const *part_probe_types;
 	const struct of_device_id *match;
 	struct device_node *dp = dev->dev.of_node;
 	struct resource res;
@@ -310,10 +274,8 @@ static int of_flash_probe(struct platform_device *dev)
 		goto err_out;
 
 	ppdata.of_node = dp;
-	part_probe_types = of_get_probes(dp);
-	mtd_device_parse_register(info->cmtd, part_probe_types, &ppdata,
+	mtd_device_parse_register(info->cmtd, part_probe_types_def, &ppdata,
 			NULL, 0);
-	of_free_probes(part_probe_types);
 
 	kfree(mtd_list);
 
diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
index cafdb88..63118e2 100644
--- a/drivers/mtd/mtdpart.c
+++ b/drivers/mtd/mtdpart.c
@@ -29,6 +29,7 @@
 #include <linux/kmod.h>
 #include <linux/mtd/mtd.h>
 #include <linux/mtd/partitions.h>
+#include <linux/of.h>
 #include <linux/err.h>
 #include <linux/kconfig.h>
 
@@ -719,6 +720,40 @@ void deregister_mtd_parser(struct mtd_part_parser *p)
 EXPORT_SYMBOL_GPL(deregister_mtd_parser);
 
 /*
+ * Parses the linux,part-probe device tree property.
+ * When a non null value is returned it has to be freed with kfree() by
+ * the caller.
+ */
+static const char * const *of_get_probes(struct device_node *dp)
+{
+	const char *cp;
+	int cplen;
+	unsigned int l;
+	unsigned int count;
+	const char **res;
+
+	cp = of_get_property(dp, "linux,part-probe", &cplen);
+	if (cp == NULL)
+		return NULL;
+
+	count = 0;
+	for (l = 0; l != cplen; l++)
+		if (cp[l] == 0)
+			count++;
+
+	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
+	count = 0;
+	while (cplen > 0) {
+		res[count] = cp;
+		l = strlen(cp) + 1;
+		cp += l;
+		cplen -= l;
+		count++;
+	}
+	return res;
+}
+
+/*
  * Do not forget to update 'parse_mtd_partitions()' kerneldoc comment if you
  * are changing this array!
  */
@@ -754,6 +789,13 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 {
 	struct mtd_part_parser *parser;
 	int ret = 0;
+	const char *const *types_of = NULL;
+
+	if (data && data->of_node) {
+		types_of = of_get_probes(data->of_node);
+		if (types_of != NULL)
+			types = types_of;
+	}
 
 	if (!types)
 		types = default_mtd_part_types;
@@ -772,6 +814,7 @@ int parse_mtd_partitions(struct mtd_info *master, const char *const *types,
 			break;
 		}
 	}
+	kfree(types_of);
 	return ret;
 }
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
