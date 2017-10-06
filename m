From: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Subject: [PATCH v2 1/7] pinctrl: change Kconfig PINCTRL variable to a menuconfig
Date: Fri,  6 Oct 2017 13:08:05 +0800
Message-ID: <1507266491-73971-2-git-send-email-preid@electromag.com.au>
References: <1507266491-73971-1-git-send-email-preid@electromag.com.au>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1507266491-73971-1-git-send-email-preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, poeschel-Xtl8qvBWbHwb1SvskN2V4Q@public.gmane.org, preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This allows PINCTRL to be selected manually to allow enabling of the
mcp23s08 i2c/spi gpio driver. Which is not platform specific.

Signed-off-by: Phil Reid <preid-qgqNFa1JUf/o2iN0hyhwsIdd74u8MsAO@public.gmane.org>
---
 drivers/pinctrl/Kconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 1778cf4..8da29e9 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -2,11 +2,10 @@
 # PINCTRL infrastructure and drivers
 #
 
-config PINCTRL
-	bool
+menuconfig PINCTRL
+	bool "Pin controllers"
 
-menu "Pin controllers"
-	depends on PINCTRL
+if PINCTRL
 
 config GENERIC_PINCTRL_GROUPS
 	bool
@@ -379,4 +378,4 @@ config PINCTRL_TB10X
 	depends on OF && ARC_PLAT_TB10X
 	select GPIOLIB
 
-endmenu
+endif
-- 
1.8.3.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
