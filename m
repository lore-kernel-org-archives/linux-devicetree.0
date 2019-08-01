From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 7/8] ARM: dts: apf27dev: native-mode is part of display-timings
Date: Thu,  1 Aug 2019 17:46:27 +0200
Message-ID: <20190801154628.1624-8-martin@kaiser.cx>
References: <20190801154628.1624-1-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190801154628.1624-1-martin@kaiser.cx>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

Move the native-mode property inside the display-timings node.

According to
Documentation/devicetree/bindings/display/panel/display-timing.txt.
native-mode is a property of the display-timings node.

If it's located outside of display-timings, the native-mode setting is
ignored and the first display timing is used (which is a problem only if
someone adds another display timing).

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 arch/arm/boot/dts/imx27-apf27dev.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx27-apf27dev.dts b/arch/arm/boot/dts/imx27-apf27dev.dts
index 087c6e237af0..6f1e8ce9e76e 100644
--- a/arch/arm/boot/dts/imx27-apf27dev.dts
+++ b/arch/arm/boot/dts/imx27-apf27dev.dts
@@ -12,10 +12,10 @@
 
 	display: display {
 		model = "Chimei-LW700AT9003";
-		native-mode = <&timing0>;
 		bits-per-pixel = <16>;  /* non-standard but required */
 		fsl,pcr = <0xfae80083>;	/* non-standard but required */
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: 800x480 {
 				clock-frequency = <33000033>;
 				hactive = <800>;
-- 
2.11.0
