From: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
Subject: [PATCH 1/2] of: overlay: fix memory leak related to duplicated property
Date: Fri, 13 Oct 2017 09:53:10 +0800
Message-ID: <1507859591-2337-1-git-send-email-alan.1.wang@nokia-sbell.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Function of_changeset_add_property or of_changeset_update_property may
fails. In this case the property just allocated is never deallocated.

Signed-off-by: alawang <alan.1.wang-FTnzSCDXTkYjo0HpFSRKWA@public.gmane.org>
---
 drivers/of/overlay.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 8ecfee3..af3b9a1 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -162,6 +162,7 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 		bool is_symbols_node)
 {
 	struct property *propn = NULL, *tprop;
+	int ret = 0;
 
 	/* NOTE: Multiple changes of single properties not supported */
 	tprop = of_find_property(target, prop->name, NULL);
@@ -186,10 +187,16 @@ static int of_overlay_apply_single_property(struct of_overlay *ov,
 
 	/* not found? add */
 	if (tprop == NULL)
-		return of_changeset_add_property(&ov->cset, target, propn);
-
-	/* found? update */
-	return of_changeset_update_property(&ov->cset, target, propn);
+		ret = of_changeset_add_property(&ov->cset, target, propn);
+	else /* found? update */
+		ret = of_changeset_update_property(&ov->cset, target, propn);
+
+	if (ret) {
+		kfree(propn->name);
+		kfree(propn->value);
+		kfree(propn);
+	}
+	return ret;
 }
 
 static int of_overlay_apply_single_device_node(struct of_overlay *ov,
-- 
2.6.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
