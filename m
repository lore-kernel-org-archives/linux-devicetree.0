Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 1/6] pinctrl: sh-pfc: Add PORT_GP_11 helper macro
Date: Fri, 11 May 2018 12:22:22 +0900
Message-Id: <1526008947-26667-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1526008947-26667-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, Takeshi Kihara <takeshi.kihara.df@renesas.com>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
List-ID: <devicetree@vger.kernel.org>

From: Takeshi Kihara <takeshi.kihara.df@renesas.com>

This follows the style of existion PORT_GP_X macros and
will be used by a follow-up patch for the r8a77990 SoC.

Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pinctrl/sh-pfc/sh_pfc.h | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
index 7fad897..b1a9957 100644
--- a/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -415,9 +415,13 @@ struct sh_pfc_soc_info {
 	PORT_GP_CFG_1(bank, 9,  fn, sfx, cfg)
 #define PORT_GP_10(bank, fn, sfx)	PORT_GP_CFG_10(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_12(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_11(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_10(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 10, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 10,  fn, sfx, cfg)
+#define PORT_GP_11(bank, fn, sfx)	PORT_GP_CFG_11(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_12(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_11(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 11, fn, sfx, cfg)
 #define PORT_GP_12(bank, fn, sfx)	PORT_GP_CFG_12(bank, fn, sfx, 0)
 
-- 
1.9.1
