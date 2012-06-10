From: Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/4] dt: fsl-imx-esdhc.txt: Fix gpio number assignment
Date: Sun, 10 Jun 2012 14:24:07 -0300
Message-ID: <1339349050-3105-1-git-send-email-festevam@gmail.com>
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: grant.likely@secretlab.ca
Cc: rob.herring@calxeda.com, shawn.guo@linaro.org, rob@landley.net, kernel@pengutronix.de, devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, Fabio Estevam <fabio.estevam@freescale.com>
List-Id: devicetree@vger.kernel.org

From: Fabio Estevam <fabio.estevam@freescale.com>

Fix gpio number assignment, so that it can match the number stated in the comment.

Cc: 
Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 .../devicetree/bindings/mmc/fsl-imx-esdhc.txt      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
index c7e404b..fea541e 100644
--- a/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
+++ b/Documentation/devicetree/bindings/mmc/fsl-imx-esdhc.txt
@@ -29,6 +29,6 @@ esdhc@70008000 {
 	compatible = "fsl,imx51-esdhc";
 	reg = <0x70008000 0x4000>;
 	interrupts = <2>;
-	cd-gpios = <&gpio0 6 0>; /* GPIO1_6 */
-	wp-gpios = <&gpio0 5 0>; /* GPIO1_5 */
+	cd-gpios = <&gpio1 6 0>; /* GPIO1_6 */
+	wp-gpios = <&gpio1 5 0>; /* GPIO1_5 */
 };
-- 
1.7.1

