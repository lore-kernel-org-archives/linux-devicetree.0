From: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] of: overlay: add resolver error prints
Date: Sun, 26 Jun 2016 22:11:58 +0200
Message-ID: <38852c55a0da4780b64a8248e16df73a1d54891e.1466971467.git.hramrach@gmail.com>
References: <cover.1466971467.git.hramrach@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1466971467.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
In-Reply-To: <cover.1466971467.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
References: <cover.1466971467.git.hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Applying overlay fails silently in case of an error. Add error prints.
Most notably the lack of symbols in the live tree is not reported.

Signed-off-by: Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/resolver.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/of/resolver.c b/drivers/of/resolver.c
index d313d49..5d24a4b 100644
--- a/drivers/of/resolver.c
+++ b/drivers/of/resolver.c
@@ -313,6 +313,11 @@ int of_resolve_phandles(struct device_node *resolve)
 	phandle phandle, phandle_delta;
 	int err;
 
+	if (!resolve)
+		pr_err("%s: null node\n", __func__);
+	if (resolve && !of_node_check_flag(resolve, OF_DETACHED))
+		pr_err("%s: node %s not detached\n", __func__,
+			 resolve->full_name);
 	/* the resolve node must exist, and be detached */
 	if (!resolve || !of_node_check_flag(resolve, OF_DETACHED))
 		return -EINVAL;
@@ -369,6 +374,7 @@ int of_resolve_phandles(struct device_node *resolve)
 
 	/* we need to fixup, but no root symbols... */
 	if (!root_sym) {
+		pr_err("%s: no symbols in root of device tree.\n", __func__);
 		err = -EINVAL;
 		goto out;
 	}
-- 
2.8.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
