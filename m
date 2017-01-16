From: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] of: Add EXPORT_SYMBOL for of_device_compatible_match
Date: Mon, 16 Jan 2017 14:11:51 +0100
Message-ID: <1484572311-6005-1-git-send-email-narmstrong@baylibre.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add missing EXPORT_SYMBOL for of_device_compatible_match function.

Fixes: b9c13fe32faa ("dt: Add of_device_compatible_match()")
Signed-off-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d4bea3c..dfbcf17 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -523,6 +523,7 @@ int of_device_compatible_match(struct device_node *device,
 
 	return score;
 }
+EXPORT_SYMBOL(of_device_compatible_match);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
