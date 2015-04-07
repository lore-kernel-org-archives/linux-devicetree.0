From: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: [PATCH] of: fix of_property_read_string
Date: Tue, 7 Apr 2015 18:11:02 +0800
Message-ID: <1428401462-5907-1-git-send-email-Shengzhou.Liu@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

In of_property_read_string function, strnlen(prop->value, prop->length)
is always less or equal to prop->length, and we should allow the '=='
condition, so let's remove the original unreasonable condition.

Signed-off-by: Shengzhou Liu <Shengzhou.Liu-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
---
 drivers/of/base.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index adb8764..742ff97 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1335,8 +1335,6 @@ int of_property_read_string(struct device_node *np, const char *propname,
 		return -EINVAL;
 	if (!prop->value)
 		return -ENODATA;
-	if (strnlen(prop->value, prop->length) >= prop->length)
-		return -EILSEQ;
 	*out_string = prop->value;
 	return 0;
 }
-- 
2.1.0.27.g96db324

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
