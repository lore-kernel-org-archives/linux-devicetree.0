From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V2 1/2] mtd: move code reading DT specified part probes to the core
Date: Fri, 31 Mar 2017 11:30:12 +0200
Message-ID: <20170331093013.29123-1-zajec5@gmail.com>
References: <20170330215332.32699-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170330215332.32699-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Handling (creating) partitions for flash devices requires using a proper
driver that will read partition table (out of somewhere). We can't
simply try all existing drivers one by one, so MTD subsystem allows
drivers to specify a list of applicable part probes.

So far physmap_of was the only driver with support for linux,part-probe
DT property. Other ones had list or probes hardcoded which wasn't making
them really flexible. It prevented using common flash drivers on
platforms that required some specific partition table access.

This commit moves support for mentioned DT property to the MTD core
file. Thanks to calling it on device parse registration (as suggested by
Boris) all drivers gain support for it for free.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 drivers/mtd/maps/physmap_of.c | 36 +-----------------------------------
 drivers/mtd/mtdcore.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 62fa6836f218..49dbb7235848 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -114,37 +114,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
 static const char * const part_probe_types_def[] = {
 	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
 
-static const char * const *of_get_probes(struct device_node *dp)
-{
-	const char **res;
-	int count;
-
-	count = of_property_count_strings(dp, "linux,part-probe");
-	if (count < 0)
-		return part_probe_types_def;
-
-	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
-	if (!res)
-		return NULL;
-
-	count = of_property_read_string_array(dp, "linux,part-probe", res,
-					      count);
-	if (count < 0)
-		return NULL;
-
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
@@ -310,14 +282,8 @@ static int of_flash_probe(struct platform_device *dev)
 
 	info->cmtd->dev.parent = &dev->dev;
 	mtd_set_of_node(info->cmtd, dp);
-	part_probe_types = of_get_probes(dp);
-	if (!part_probe_types) {
-		err = -ENOMEM;
-		goto err_out;
-	}
-	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
+	mtd_device_parse_register(info->cmtd, part_probe_types_def, NULL,
 			NULL, 0);
-	of_free_probes(part_probe_types);
 
 	kfree(mtd_list);
 
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66a9dedd1062..a7ab0a24ba1e 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -664,6 +664,32 @@ static void mtd_set_dev_defaults(struct mtd_info *mtd)
 	}
 }
 
+static const char * const *mtd_of_get_probes(struct device_node *np)
+{
+	const char **res;
+	int count;
+
+	count = of_property_count_strings(np, "linux,part-probe");
+	if (count < 0)
+		return NULL;
+
+	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
+	if (!res)
+		return NULL;
+
+	count = of_property_read_string_array(np, "linux,part-probe", res,
+					      count);
+	if (count < 0)
+		return NULL;
+
+	return res;
+}
+
+static inline void mtd_of_free_probes(const char * const *probes)
+{
+	kfree(probes);
+}
+
 /**
  * mtd_device_parse_register - parse partitions and register an MTD device.
  *
@@ -698,11 +724,16 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 			      const struct mtd_partition *parts,
 			      int nr_parts)
 {
+	const char * const *part_probe_types;
 	struct mtd_partitions parsed;
 	int ret;
 
 	mtd_set_dev_defaults(mtd);
 
+	part_probe_types = mtd_of_get_probes(mtd_get_of_node(mtd));
+	if (!part_probe_types)
+		part_probe_types = types;
+
 	memset(&parsed, 0, sizeof(parsed));
 
 	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
@@ -720,6 +751,9 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
 		memset(&parsed, 0, sizeof(parsed));
 	}
 
+	if (part_probe_types != types)
+		mtd_of_free_probes(part_probe_types);
+
 	ret = mtd_add_device_partitions(mtd, &parsed);
 	if (ret)
 		goto out;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
