From: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 1/8] pinctrl: sh-pfc: Add PORT_GP_{10,2[01]} helper macros
Date: Wed,  9 Aug 2017 21:19:40 +0900
Message-ID: <1502281187-24068-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1502281187-24068-1-git-send-email-yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
Cc: linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This follows the style of existion PORT_GP_X macros and
will be used by a follow-up patch for the r8a77995 SoC.

Extracted from the initial r8a77995 patch in the BSP by Takeshi Kihara.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 4376397..89e77e5 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -389,9 +389,13 @@ struct sh_pfc_soc_info {
 	PORT_GP_CFG_1(bank, 8,  fn, sfx, cfg)
 #define PORT_GP_9(bank, fn, sfx)	PORT_GP_CFG_9(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_12(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_10(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_9(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg)
+#define PORT_GP_10(bank, fn, sfx)	PORT_GP_CFG_10(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_12(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_10(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 10, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
@@ -422,11 +426,19 @@ struct sh_pfc_soc_info {
 	PORT_GP_CFG_1(bank, 17, fn, sfx, cfg)
 #define PORT_GP_18(bank, fn, sfx)	PORT_GP_CFG_18(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_20(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_18(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 18, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 19, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 19, fn, sfx, cfg)
+#define PORT_GP_20(bank, fn, sfx)	PORT_GP_CFG_20(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_21(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_20(bank, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 20, fn, sfx, cfg)
+#define PORT_GP_21(bank, fn, sfx)	PORT_GP_CFG_21(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_23(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_21(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 21, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 22, fn, sfx, cfg)
 #define PORT_GP_23(bank, fn, sfx)	PORT_GP_CFG_23(bank, fn, sfx, 0)
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
