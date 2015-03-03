From: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] of/overlay: Remove unused variable
Date: Tue, 3 Mar 2015 10:04:45 -0300
Message-ID: <1425387885-7936-1-git-send-email-fabio.estevam@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Commit 3e7f7626fd49a ("of/overlay: Do not generate duplicate nodes") removed
the only use of the 'grandchild' variable, which leads to the following build
warning:

drivers/of/overlay.c: In function 'of_overlay_apply_single_device_node':
drivers/of/overlay.c:89:31: warning: unused variable 'grandchild' [-Wunused-variable]
  struct device_node *tchild, *grandchild;
                               ^

Remove this unused variable.

Signed-off-by: Fabio Estevam <fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/overlay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/overlay.c b/drivers/of/overlay.c
index 4066648..dee9270 100644
--- a/drivers/of/overlay.c
+++ b/drivers/of/overlay.c
@@ -86,7 +86,7 @@ static int of_overlay_apply_single_device_node(struct of_overlay *ov,
 		struct device_node *target, struct device_node *child)
 {
 	const char *cname;
-	struct device_node *tchild, *grandchild;
+	struct device_node *tchild;
 	int ret = 0;
 
 	cname = kbasename(child->full_name);
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
