Return-Path: <SRS0=aylg=FT=cogentembedded.com=sergei.shtylyov@kernel.org>
Subject: [PATCH 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_25() helper macro
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
References: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
Message-ID: <26e823ef-759f-16e7-f3da-ac6ce7c01ad3@cogentembedded.com>
Date: Sun, 25 Feb 2018 21:13:02 +0300
MIME-Version: 1.0
In-Reply-To: <e32c511f-89cd-254b-8a53-face984abe75@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
List-ID: <devicetree@vger.kernel.org>

They follow the style of the existing PORT_GP_CFG_<n>() macros and
will be used by a follow-up patch for the R8A77980 SoC.

Based on the original (and large) patch by Vladimir Barinov.

Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
 drivers/pinctrl/sh-pfc/sh_pfc.h |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

Index: renesas/drivers/pinctrl/sh-pfc/sh_pfc.h
===================================================================
--- renesas.orig/drivers/pinctrl/sh-pfc/sh_pfc.h
+++ renesas/drivers/pinctrl/sh-pfc/sh_pfc.h
@@ -470,9 +470,13 @@ extern const struct sh_pfc_soc_info shx3
 	PORT_GP_CFG_1(bank, 23, fn, sfx, cfg)
 #define PORT_GP_24(bank, fn, sfx)	PORT_GP_CFG_24(bank, fn, sfx, 0)
 
-#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+#define PORT_GP_CFG_25(bank, fn, sfx, cfg)				\
 	PORT_GP_CFG_24(bank, fn, sfx, cfg),				\
-	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg),				\
+	PORT_GP_CFG_1(bank, 24, fn, sfx, cfg)
+#define PORT_GP_25(bank, fn, sfx)	PORT_GP_CFG_25(bank, fn, sfx, 0)
+
+#define PORT_GP_CFG_26(bank, fn, sfx, cfg)				\
+	PORT_GP_CFG_25(bank, fn, sfx, cfg),				\
 	PORT_GP_CFG_1(bank, 25, fn, sfx, cfg)
 #define PORT_GP_26(bank, fn, sfx)	PORT_GP_CFG_26(bank, fn, sfx, 0)
 
