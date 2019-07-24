From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH 2/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 devicetree bindings
Date: Wed, 24 Jul 2019 09:49:33 +0200
Message-ID: <1563954573-370205-2-git-send-email-s.riedmueller@phytec.de>
References: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1563954573-370205-1-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com, Stefan Riedmueller <s.riedmueller@phytec.de>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for i.MX6 based phyCORE-i.MX6, phyBOARD-Mira and
phyFLEX-i.MX6.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 40f007859092..00a037cf5c86 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -112,6 +112,13 @@ properties:
               - fsl,imx6q-sabreauto
               - fsl,imx6q-sabrelite
               - fsl,imx6q-sabresd
+              - phytec,imx6qdl-pcm058     # PHYTEC phyCORE-i.MX6
+              - phytec,imx6q-pbab01       # PHYTEC phyFLEX carrier board
+              - phytec,imx6q-pbab01-nand  # PHYTEC phyFLEX eval Kit
+              - phytec,imx6q-pbac06       # PHYTEC phyBOARD-Mira with i.MX6 Quad
+              - phytec,imx6q-pbac06-emmc  # PHYTEC phyBOARD-Mira eMMC RDK
+              - phytec,imx6q-pbac06-nand  # PHYTEC phyBOARD-Mira NAND RDK
+              - phytec,imx6q-pfla02       # PHYTEC phyFLEX-i.MX6 Quad
               - technologic,imx6q-ts4900
               - technologic,imx6q-ts7970
           - const: fsl,imx6q
@@ -121,6 +128,9 @@ properties:
           - enum:
               - fsl,imx6qp-sabreauto      # i.MX6 Quad Plus SABRE Automotive Board
               - fsl,imx6qp-sabresd        # i.MX6 Quad Plus SABRE Smart Device Board
+              - phytec,imx6qdl-pcm058     # PHYTEC phyCORE-i.MX6
+              - phytec,imx6qp-pbac06      # PHYTEC phyBOARD-Mira with i.MX6 QuadPlus
+              - phytec,imx6qp-pbac06-nand # PHYTEC phyBOARD-Mira NAND RDK
           - const: fsl,imx6qp
 
       - description: i.MX6DL based Boards
@@ -131,6 +141,13 @@ properties:
               - emtrion,emcon-mx6-avari   # emCON-MX6S or emCON-MX6DL SoM on Avari Base
               - fsl,imx6dl-sabreauto      # i.MX6 DualLite/Solo SABRE Automotive Board
               - fsl,imx6dl-sabresd        # i.MX6 DualLite SABRE Smart Device Board
+              - phytec,imx6qdl-pcm058     # PHYTEC phyCORE-i.MX6
+              - phytec,imx6dl-pbab01      # PHYTEC phyFLEX carrier board
+              - phytec,imx6dl-pbab01-nand # PHYTEC phyFLEX eval Kit
+              - phytec,imx6dl-pbac06      # PHYTEC phyBOARD-Mira with i.MX6 DL
+              - phytec,imx6dl-pbac06-emmc # PHYTEC phyBOARD-Mira eMMC RDK
+              - phytec,imx6dl-pbac06-nand # PHYTEC phyBOARD-Mira NAND RDK
+              - phytec,imx6dl-pfla02      # PHYTEC phyFLEX-i.MX6 DL
               - technologic,imx6dl-ts4900
               - technologic,imx6dl-ts7970
               - ysoft,imx6dl-yapp4-draco  # i.MX6 DualLite Y Soft IOTA Draco board
-- 
2.7.4
