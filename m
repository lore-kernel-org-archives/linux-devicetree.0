From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 5/8] ARM: dts: imx27-phytec-phycore-rdk: native-mode is part of display-timings
Date: Thu,  1 Aug 2019 17:46:25 +0200
Message-ID: <20190801154628.1624-6-martin@kaiser.cx>
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
 arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
index 5606f417e9e8..bf883e45576a 100644
--- a/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
+++ b/arch/arm/boot/dts/imx27-phytec-phycore-rdk.dts
@@ -14,11 +14,11 @@
 
 	display0: LQ035Q7 {
 		model = "Sharp-LQ035Q7";
-		native-mode = <&timing0>;
 		bits-per-pixel = <16>;
 		fsl,pcr = <0xf00080c0>;
 
 		display-timings {
+			native-mode = <&timing0>;
 			timing0: 240x320 {
 				clock-frequency = <5500000>;
 				hactive = <240>;
-- 
2.11.0
