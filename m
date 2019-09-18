From: Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH] dt-bindings: display: imx: fix native-mode setting
Date: Wed, 18 Sep 2019 21:38:53 +0200
Message-ID: <20190918193853.25689-1-martin@kaiser.cx>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kaiser <martin@kaiser.cx>
List-Id: devicetree@vger.kernel.org

According to
Documentation/devicetree/bindings/display/panel/display-timing.txt,
native-mode is a property of the display-timings node.

If it's located outside of display-timings, the native-mode setting is
ignored and the first display timing is used.

We've already fixed the board definitions which got this wrong. Fix the
example in the imx framebuffer bindings as well.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
index e5a8b363d829..f4df9e83bcd2 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx-fb.txt
@@ -38,10 +38,10 @@ Example:
 
 	display0: display0 {
 		model = "Primeview-PD050VL1";
-		native-mode = <&timing_disp0>;
 		bits-per-pixel = <16>;
 		fsl,pcr = <0xf0c88080>;	/* non-standard but required */
 		display-timings {
+			native-mode = <&timing_disp0>;
 			timing_disp0: 640x480 {
 				hactive = <640>;
 				vactive = <480>;
-- 
2.11.0
