From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 1/3] of: overlay: Do not generate duplicate nodes
Date: Tue, 16 Dec 2014 19:45:25 +0200
Message-ID: <1418751927-18088-2-git-send-email-pantelis.antoniou@konsulko.com>
References: <1418751927-18088-1-git-send-email-pantelis.antoniou@konsulko.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1418751927-18088-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

During the course of the rewrites a bug sneaked in when dealing
with children nodes of overlays, which ends up duplicating
sub nodes.

Simply remove the duplicate traversal of child nodes to fix.

Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 drivers/of/overlay.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index ea63fbd2..352b4f2 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -114,17 +114,6 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		ret = of_overlay_apply_one(ov, tchild, child);
 		if (ret)
 			return ret;
-
-		/* The properties are already copied, now do the child nodes */
-		for_each_child_of_node(child, grandchild) {
-			ret = of_overlay_apply_single_device_node(ov, tchild, grandchild);
-			if (ret) {
-				pr_err("%s: Failed to apply single node @%s/%s\n",
-					__func__, tchild->full_name,
-					grandchild->name);
-				return ret;
-			}
-		}
 	}
 
 	return ret;
-- 
1.7.12

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
