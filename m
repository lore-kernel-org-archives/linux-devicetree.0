From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 1/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 UL/ULL devicetree bindings
Date: Wed, 24 Jul 2019 09:49:32 +0200
Message-ID: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com, Stefan Riedmueller <s.riedmueller@phytec.de>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for i.MX6 UL/ULL based phyCORE-i.MX6 UL/ULL and
phyBOARD-Segin.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0..40f007859092 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -161,12 +161,20 @@ properties:
         items:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
+              - phytec,imx6ul-pbacd10     # PHYTEC phyBOARD-Segin with i.MX6 UL
+              - phytec,imx6ul-pbacd10-emmc  # PHYTEC phyBOARD-Segin eMMC Kit
+              - phytec,imx6ul-pbacd10-nand  # PHYTEC phyBOARD-Segin NAND Kit
+              - phytec,imx6ul-pcl063      # PHYTEC phyCORE-i.MX 6UL
           - const: fsl,imx6ul
 
       - description: i.MX6ULL based Boards
         items:
           - enum:
               - fsl,imx6ull-14x14-evk     # i.MX6 UltraLiteLite 14x14 EVK Board
+              - phytec,imx6ull-pbacd10    # PHYTEC phyBOARD-Segin with i.MX6 ULL
+              - phytec,imx6ull-pbacd10-emmc # PHYTEC phyBOARD-Segin eMMC Kit
+              - phytec,imx6ull-pbacd10-nand # PHYTEC phyBOARD-Segin NAND Kit
+              - phytec,imx6ull-pcl063     # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
       - description: i.MX6ULZ based Boards
-- 
2.7.4
