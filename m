From: YiPing Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
Subject: [PATCH] of: remove redundant memset in overlay
Date: Sat, 7 Jan 2017 19:04:27 +0800
Message-ID: <1483787067-108430-1-git-send-email-xuyiping@hisilicon.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: XuYing <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>

memset in of_build_overlay_info is redundant, the ovinfo has been
zeroed in of_fill_overlay_info when error.

Signed-off-by: YiPing Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 drivers/of/overlay.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 0d4cda7..4b1b6b3 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -314,7 +314,6 @@ static int of_build_overlay_info(struct of_overlay *ov,
 
 	cnt = 0;
 	for_each_child_of_node(tree, node) {
-		memset(&ovinfo[cnt], 0, sizeof(*ovinfo));
 		err = of_fill_overlay_info(ov, node, &ovinfo[cnt]);
 		if (err == 0)
 			cnt++;
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
