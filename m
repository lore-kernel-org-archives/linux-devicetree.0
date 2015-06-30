From: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Subject: [PATCH/RFC 3/3] of/dynamic: Update list of aliases on aliases changes
Date: Tue, 30 Jun 2015 16:51:16 +0200
Message-ID: <1435675876-2159-4-git-send-email-geert+renesas@glider.be>
References: <1435675876-2159-1-git-send-email-geert+renesas@glider.be>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435675876-2159-1-git-send-email-geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently the list of aliases is not updated when an overlay that
modifies /aliases is added or removed. This breaks drivers (e.g. serial)
that rely on of_alias_get_id().

Update the list of aliases when a property of the /aliases node is
added, removed, or updated.

Signed-off-by: Geert Uytterhoeven <geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org>
---
  - Should the OF core handle this itself, by registering a notifier
    using of_reconfig_notifier_register()?
  - Adding or destroying the /aliases node itself should be handled,
    too.
  - Is it safe to deallocate struct alias_prop using kfree()? It may
    have been allocated using early_init_dt_alloc_memory_arch() /
    memblock_alloc(). What's the alternative? Leaking memory?
---
 drivers/of/dynamic.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 1901f8870591fe30..65dfb26f879c3a9a 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -502,6 +502,16 @@ static void __of_changeset_entry_invert(struct of_changeset_entry *ce,
 	}
 }
 
+static void *alias_alloc(u64 size, u64 align)
+{
+	return kzalloc(size, GFP_KERNEL);
+}
+
+static void alias_free(void *p)
+{
+	kfree(p);
+}
+
 static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool revert)
 {
 	struct of_reconfig_data rd;
@@ -513,6 +523,20 @@ static void __of_changeset_entry_notify(struct of_changeset_entry *ce, bool reve
 		ce = &ce_inverted;
 	}
 
+	if (ce->np == of_aliases) {
+		switch (ce->action) {
+		case OF_RECONFIG_ADD_PROPERTY:
+			of_alias_create(ce->prop, alias_alloc);
+			break;
+		case OF_RECONFIG_REMOVE_PROPERTY:
+			of_alias_destroy(ce->prop->name, alias_free);
+			break;
+		case OF_RECONFIG_UPDATE_PROPERTY:
+			of_alias_destroy(ce->old_prop->name, alias_free);
+			of_alias_create(ce->prop, alias_alloc);
+			break;
+		}
+	}
 	switch (ce->action) {
 	case OF_RECONFIG_ATTACH_NODE:
 	case OF_RECONFIG_DETACH_NODE:
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
