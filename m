From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC 2/3] of: Add of_alias_destroy()
Date: Tue, 30 Jun 2015 16:51:15 +0200
Message-ID: <1435675876-2159-3-git-send-email-geert+renesas@glider.be>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435675876-2159-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a helper function to find an alias, remove it from the list of
aliases, and destroy it.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
 drivers/of/base.c  | 14 ++++++++++++++
 include/linux/of.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 390f9e2b7b65d54b..6aafee0cfb27bd5c 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1922,6 +1922,20 @@ void of_alias_create(struct property *pp,
 	of_alias_add(ap, np, id, start, len);
 }
 
+void of_alias_destroy(const char *name, void (*dt_free)(void *))
+{
+	struct alias_prop *ap;
+
+	list_for_each_entry(ap, &aliases_lookup, link) {
+		if (strcmp(ap->alias, name))
+			continue;
+
+		list_del(&ap->link);
+		dt_free(ap);
+		return;
+	}
+}
+
 /**
  * of_alias_scan - Scan all properties of the 'aliases' node
  *
diff --git a/include/linux/of.h b/include/linux/of.h
index 0852625e4cfb3dfe..1807a95a00a84a99 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -335,6 +335,7 @@ extern int of_count_phandle_with_args(const struct device_node *np,
 
 extern void of_alias_create(struct property *pp,
 			    void * (*dt_alloc)(u64 size, u64 align));
+extern void of_alias_destroy(const char *name, void (*dt_free)(void *));
 extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 extern int of_alias_get_highest_id(const char *stem);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
