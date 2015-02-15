From: "Matwey V. Kornilov" <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
Subject: [PATCH] of: Add prompt for OF_OVERLAY config
Date: Sun, 15 Feb 2015 18:22:47 +0300
Message-ID: <1424013767-25522-1-git-send-email-matwey@sai.msu.ru>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Matwey V. Kornilov" <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Matwey V. Kornilov <matwey-TTlVxmypnbovJsYlp49lxw@public.gmane.org>
---
 drivers/of/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index b5e0c87..fdca685 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -85,7 +85,7 @@ config OF_RESOLVE
 	bool
 
 config OF_OVERLAY
-	bool
+	bool "Device Tree overlays"
 	depends on OF
 	select OF_DYNAMIC
 	select OF_RESOLVE
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
