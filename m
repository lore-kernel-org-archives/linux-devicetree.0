From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] mtd: physmap_of: use OF helpers for reading strings
Date: Thu, 30 Mar 2017 17:58:53 +0200
Message-ID: <20170330155853.30349-1-zajec5@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Marek Vasut <marek.vasut-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Richard Weinberger <richard-/L3Ra7n9ekc@public.gmane.org>, Cyrille Pitchen <cyrille.pitchen-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

From: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>

OF core code provides helpers for counting strings and reading them so
use them instead of doing this manually. This simplifies the code a bit.

Signed-off-by: Rafał Miłecki <rafal-g1n6cQUeyibVItvQsEIGlw@public.gmane.org>
---
 drivers/mtd/maps/physmap_of.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 14e8909c9955..62fa6836f218 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -116,32 +116,22 @@ static const char * const part_probe_types_def[] = {
 
 static const char * const *of_get_probes(struct device_node *dp)
 {
-	const char *cp;
-	int cplen;
-	unsigned int l;
-	unsigned int count;
 	const char **res;
+	int count;
 
-	cp = of_get_property(dp, "linux,part-probe", &cplen);
-	if (cp == NULL)
+	count = of_property_count_strings(dp, "linux,part-probe");
+	if (count < 0)
 		return part_probe_types_def;
 
-	count = 0;
-	for (l = 0; l != cplen; l++)
-		if (cp[l] == 0)
-			count++;
-
-	res = kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
+	res = kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
 	if (!res)
 		return NULL;
-	count = 0;
-	while (cplen > 0) {
-		res[count] = cp;
-		l = strlen(cp) + 1;
-		cp += l;
-		cplen -= l;
-		count++;
-	}
+
+	count = of_property_read_string_array(dp, "linux,part-probe", res,
+					      count);
+	if (count < 0)
+		return NULL;
+
 	return res;
 }
 
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
