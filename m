From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH V5 3/3] mtd: physmap_of: drop duplicated support for linux, part-probe property
Date: Mon, 17 Apr 2017 21:47:46 +0200
Message-ID: <20170417194746.10697-3-zajec5@gmail.com>
References: <20170417182853.24281-1-zajec5@gmail.com>
 <20170417194746.10697-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170417194746.10697-1-zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

Now support for linux,part-probe has been added to the MTD core there is
no need to duplicate support for it in physmap_of.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
Acked-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 drivers/mtd/maps/physmap_of.c | 46 +------------------------------------------
 1 file changed, 1 insertion(+), 45 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 14e8909c9955..49dbb7235848 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -114,47 +114,9 @@ static struct mtd_info *obsolete_probe(struct platform_device *dev,
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
-	if (!res)
-		return NULL;
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
@@ -320,14 +282,8 @@ static int of_flash_probe(struct platform_device *dev)
 
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
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
