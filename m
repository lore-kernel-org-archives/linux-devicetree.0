From: Geert Uytterhoeven <geert+renesas-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
Subject: [PATCH] of/Kconfig: Spelling s/one/once/
Date: Tue, 24 Dec 2013 21:06:01 +0100
Message-ID: <1387915561-17284-1-git-send-email-geert+renesas@linux-m68k.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jiri Kosina <trivial-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Geert Uytterhoeven <geert+renesas-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Geert Uytterhoeven <geert+renesas-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>
---
 drivers/of/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
index de6f8990246f..c6973f101a3e 100644
--- a/drivers/of/Kconfig
+++ b/drivers/of/Kconfig
@@ -20,7 +20,7 @@ config OF_SELFTEST
 	depends on OF_IRQ
 	help
 	  This option builds in test cases for the device tree infrastructure
-	  that are executed one at boot time, and the results dumped to the
+	  that are executed once at boot time, and the results dumped to the
 	  console.
 
 	  If unsure, say N here, but this option is safe to enable.
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
