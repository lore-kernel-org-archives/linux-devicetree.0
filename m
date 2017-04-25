From: frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: [PATCH v2 4/4] of: detect invalid phandle in overlay
Date: Mon, 24 Apr 2017 23:20:10 -0700
Message-ID: <1493101210-11745-5-git-send-email-frowand.list@gmail.com>
References: <1493101210-11745-1-git-send-email-frowand.list@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1493101210-11745-1-git-send-email-frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, stephen.boyd-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

Overlays are not allowed to modify phandle values of previously existing
nodes because there is no information available to allow fixup up
properties that use the previously existing phandle.

Signed-off-by: Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>
---
 drivers/of/overlay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index ca0b85f5deb1..20ab49d2f7a4 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -130,6 +130,10 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 	/* NOTE: Multiple mods of created nodes not supported */
 	tchild = of_get_child_by_name(target, cname);
 	if (tchild != NULL) {
+		/* new overlay phandle value conflicts with existing value */
+		if (child->phandle)
+			return -EINVAL;
+
 		/* apply overlay recursively */
 		ret = of_overlay_apply_one(ov, tchild, child);
 		of_node_put(tchild);
-- 
Frank Rowand <frank.rowand-7U/KSKJipcs@public.gmane.org>

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
