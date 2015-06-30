From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC 1/3] of: Extract of_alias_create()
Date: Tue, 30 Jun 2015 16:51:14 +0200
Message-ID: <1435675876-2159-2-git-send-email-geert+renesas@glider.be>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435675876-2159-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Extract the code to create and add an alias from of_alias_scan() into
its own function of_alias_create().

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/base.c  | 58 ++++++++++++++++++++++++++++++------------------------
 include/linux/of.h |  2 ++
 2 files changed, 34 insertions(+), 26 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d48ff7391fa77d86..390f9e2b7b65d54b 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1891,6 +1891,37 @@ static void of_alias_add(struct alias_prop *ap, struct device_node *np,
 		 ap->alias, ap->stem, ap->id, of_node_full_name(np));
 }
 
+void of_alias_create(struct property *pp,
+		     void * (*dt_alloc)(u64 size, u64 align))
+{
+	const char *start = pp->name;
+	const char *end = start + strlen(start);
+	struct device_node *np;
+	struct alias_prop *ap;
+	int id, len;
+
+	np = of_find_node_by_path(pp->value);
+	if (!np)
+		return;
+
+	/* walk the alias backwards to extract the id and work out
+	 * the 'stem' string */
+	while (isdigit(*(end-1)) && end > start)
+		end--;
+	len = end - start;
+
+	if (kstrtoint(end, 10, &id) < 0)
+		return;
+
+	/* Allocate an alias_prop with enough space for the stem */
+	ap = dt_alloc(sizeof(*ap) + len + 1, 4);
+	if (!ap)
+		return;
+	memset(ap, 0, sizeof(*ap) + len + 1);
+	ap->alias = start;
+	of_alias_add(ap, np, id, start, len);
+}
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  *
@@ -1925,38 +1956,13 @@ void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align))
 		return;
 
 	for_each_property_of_node(of_aliases, pp) {
-		const char *start = pp->name;
-		const char *end = start + strlen(start);
-		struct device_node *np;
-		struct alias_prop *ap;
-		int id, len;
-
 		/* Skip those we do not want to proceed */
 		if (!strcmp(pp->name, "name") ||
 		    !strcmp(pp->name, "phandle") ||
 		    !strcmp(pp->name, "linux,phandle"))
 			continue;
 
-		np = of_find_node_by_path(pp->value);
-		if (!np)
-			continue;
-
-		/* walk the alias backwards to extract the id and work out
-		 * the 'stem' string */
-		while (isdigit(*(end-1)) && end > start)
-			end--;
-		len = end - start;
-
-		if (kstrtoint(end, 10, &id) < 0)
-			continue;
-
-		/* Allocate an alias_prop with enough space for the stem */
-		ap = dt_alloc(sizeof(*ap) + len + 1, 4);
-		if (!ap)
-			continue;
-		memset(ap, 0, sizeof(*ap) + len + 1);
-		ap->alias = start;
-		of_alias_add(ap, np, id, start, len);
+		of_alias_create(pp, dt_alloc);
 	}
 }
 
diff --git a/include/linux/of.h b/include/linux/of.h
index c7715d0b56344fe7..0852625e4cfb3dfe 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -333,6 +333,8 @@ extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
 extern int of_count_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name);
 
+extern void of_alias_create(struct property *pp,
+			    void * (*dt_alloc)(u64 size, u64 align));
 extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
