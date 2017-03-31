From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V3 2/3] mtd: add core code reading DT specified part probes
Date: Fri, 31 Mar 2017 13:40:15 +0200
Message-ID: <20170331114016.26858-2-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170331114016.26858-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Handling (creating) partitions for flash devices requires using a proper
driver that will read partition table (out of somewhere). We can't
simply try all existing drivers one by one:
1) It would increase boot time
2) The order could be a problem
3) In some corner cases parsers could misinterpret some data as a table
Due to this MTD subsystem allows drivers to specify a list of applicable
part probes.

So far physmap_of was the only driver with support for linux,part-probe
DT property. Other ones had list or probes hardcoded which wasn't making
them really flexible. It prevented using common flash drivers on
platforms that required some specific partition table access.

This commit adds support for mentioned DT property directly to the MTD
core. It's a rewritten implementation of physmap_of's code and it makes
original code obsolete. Thanks to calling it on device parse
registration (as suggested by Boris) all drivers gain support for it for
free.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 drivers/mtd/mtdcore.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 66a9dedd1062..917def28c756 100644
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
@@ -698,14 +724,19 @@ int mtd_device_parse_register(struct mtd_info *mtd, const char * const *types,
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
 
-	ret = parse_mtd_partitions(mtd, types, &parsed, parser_data);
+	ret = parse_mtd_partitions(mtd, part_probe_types, &parsed, parser_data);
 	if ((ret < 0 || parsed.nr_parts == 0) && parts && nr_parts) {
 		/* Fall back to driver-provided partitions */
 		parsed = (struct mtd_partitions){
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
