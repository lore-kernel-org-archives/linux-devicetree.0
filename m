From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 2/8] ARM: dts: imx25: mbimxsd25: native-mode is part of display-timings
Date: Thu,  1 Aug 2019 17:46:22 +0200
Message-ID: <20190801154628.1624-3-martin@kaiser.cx>
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
 arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts
index ad2f7e879831..80a7f96de4c6 100644
--- a/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts
+++ b/arch/arm/boot/dts/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dts
@@ -14,8 +14,8 @@
 		bits-per-pixel = <16>;
 		fsl,pcr = <0xfa208b80>;
 		bus-width = <18>;
-		native-mode = <&dvi_svga_timings>;
 		display-timings {
+			native-mode = <&dvi_svga_timings>;
 			dvi_svga_timings: 800x600 {
 				clock-frequency = <40000000>;
 				hactive = <800>;
-- 
2.11.0
