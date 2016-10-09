From: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
Subject: [PATCH] ARM: dts: imx50: fix device tree pin definitions typo
Date: Sun,  9 Oct 2016 15:53:50 +0200
Message-ID: <1476021230-17374-1-git-send-email-akurz@blala.de>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Greg Ungerer <gerg-JBU5SbJe1FlAfugRpC6u6w@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Alexander Kurz <akurz-3EoFODjbY6Q@public.gmane.org>
---
 arch/arm/boot/dts/imx50-pinfunc.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/imx50-pinfunc.h b/arch/arm/boot/dts/imx50-pinfunc.h
index 97e6e7f..4386334 100644
--- a/arch/arm/boot/dts/imx50-pinfunc.h
+++ b/arch/arm/boot/dts/imx50-pinfunc.h
@@ -34,7 +34,7 @@
 #define MX50_PAD_KEY_ROW1__EIM_NANDF_CEN_1			0x02c 0x2d8 0x000 0x2 0x0
 #define MX50_PAD_KEY_ROW1__CTI_TRIGOUT_ACK7			0x02c 0x2d8 0x000 0x6 0x0
 #define MX50_PAD_KEY_ROW1__USBPHY1_RXERROR			0x02c 0x2d8 0x000 0x7 0x0
-#define MX50_PAD_KEY_COL2__KPP_COL_1				0x030 0x2dc 0x000 0x0 0x0
+#define MX50_PAD_KEY_COL2__KPP_COL_2				0x030 0x2dc 0x000 0x0 0x0
 #define MX50_PAD_KEY_COL2__GPIO4_4				0x030 0x2dc 0x000 0x1 0x0
 #define MX50_PAD_KEY_COL2__EIM_NANDF_CEN_2			0x030 0x2dc 0x000 0x2 0x0
 #define MX50_PAD_KEY_COL2__CTI_TRIGOUT6				0x030 0x2dc 0x000 0x6 0x0
@@ -44,7 +44,7 @@
 #define MX50_PAD_KEY_ROW2__EIM_NANDF_CEN_3			0x034 0x2e0 0x000 0x2 0x0
 #define MX50_PAD_KEY_ROW2__CTI_TRIGOUT7				0x034 0x2e0 0x000 0x6 0x0
 #define MX50_PAD_KEY_ROW2__USBPHY1_LINESTATE_0			0x034 0x2e0 0x000 0x7 0x0
-#define MX50_PAD_KEY_COL3__KPP_COL_2				0x038 0x2e4 0x000 0x0 0x0
+#define MX50_PAD_KEY_COL3__KPP_COL_3				0x038 0x2e4 0x000 0x0 0x0
 #define MX50_PAD_KEY_COL3__GPIO4_6				0x038 0x2e4 0x000 0x1 0x0
 #define MX50_PAD_KEY_COL3__EIM_NANDF_READY0			0x038 0x2e4 0x7b4 0x2 0x0
 #define MX50_PAD_KEY_COL3__SDMA_EXT_EVENT_0			0x038 0x2e4 0x7b8 0x6 0x0
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
