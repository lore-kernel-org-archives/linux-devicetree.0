From: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 2/2] of: resolver: Fix checkpatch warnings
Date: Sun, 27 Nov 2016 12:20:58 -0800
Message-ID: <1480278058-19688-2-git-send-email-moritz.fischer@ettus.com>
References: <1480278058-19688-1-git-send-email-moritz.fischer@ettus.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1480278058-19688-1-git-send-email-moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, mdf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Fix two line over 80 character warnings that checkpatch spit out:

Before:
total: 0 errors, 2 warnings, 374 lines checked
drivers/of/resolver.c has style problems, please review.

After:
total: 0 errors, 0 warnings, 376 lines checked

Signed-off-by: Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>
---
Hi,

this one just silences two checkpatch warnings that I ran
into when running checkpatch against my patches.

There's a bunch of 'CHECK' level things in this file that
I could address in a follow up patch if desired.

Cheers,

Moritz
---

 drivers/of/resolver.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index 5f51a4a..71f98dc 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -311,7 +311,8 @@ int of_resolve_phandles(struct device_node *overlay)
 		if (!of_node_cmp(local_fixups->name, "__local_fixups__"))
 			break;
 
-	err = adjust_local_phandle_references(local_fixups, overlay, phandle_delta);
+	err = adjust_local_phandle_references(local_fixups, overlay,
+					      phandle_delta);
 	if (err) {
 		pr_err("overlay phandle fixup failed: %d\n", err);
 		return err;
@@ -356,7 +357,8 @@ int of_resolve_phandles(struct device_node *overlay)
 		phandle = refnode->phandle;
 		of_node_put(refnode);
 
-		err = update_usages_of_a_phandle_reference(overlay, prop, phandle);
+		err = update_usages_of_a_phandle_reference(overlay, prop,
+							   phandle);
 		if (err)
 			break;
 	}
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
