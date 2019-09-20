From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 1/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 UL/ULL devicetree bindings
Date: Fri, 20 Sep 2019 13:52:25 +0200
Message-ID: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com, Stefan Riedmueller <s.riedmueller@phytec.de>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for i.MX6 UL/ULL based phyCORE-i.MX6 UL/ULL and
phyBOARD-Segin.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Changes in v2:
 - Use seperate description for each board instead of squashing them into
   the standard board.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b4b4e6573b5..c926ff6eac67 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -164,6 +164,15 @@ properties:
               - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
           - const: fsl,imx6ul
 
+      - description: i.MX6UL PHYTEC phyBOARD-Segin
+        items:
+          - enum:
+              - phytec,imx6ul-pbacd10-emmc
+              - phytec,imx6ul-pbacd10-nand
+          - const: phytec,imx6ul-pbacd10  # PHYTEC phyBOARD-Segin with i.MX6 UL
+          - const: phytec,imx6ul-pcl063   # PHYTEC phyCORE-i.MX 6UL
+          - const: fsl,imx6ul
+
       - description: Kontron N6310 S Board
         items:
           - const: kontron,imx6ul-n6310-s
@@ -183,6 +192,15 @@ properties:
               - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL PHYTEC phyBOARD-Segin
+        items:
+          - enum:
+              - phytec,imx6ull-pbacd10-emmc
+              - phytec,imx6ull-pbacd10-nand
+          - const: phytec,imx6ull-pbacd10 # PHYTEC phyBOARD-Segin with i.MX6 ULL
+          - const: phytec,imx6ull-pcl063  # PHYTEC phyCORE-i.MX 6ULL
+          - const: fsl,imx6ull
+
       - description: i.MX6ULZ based Boards
         items:
           - enum:
-- 
2.7.4
