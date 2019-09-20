From: Stefan Riedmueller <s.riedmueller@phytec.de>
Subject: [PATCH v2 2/2] dt-bindings: arm: fsl: Add PHYTEC i.MX6 devicetree bindings
Date: Fri, 20 Sep 2019 13:52:26 +0200
Message-ID: <1568980346-385840-2-git-send-email-s.riedmueller@phytec.de>
References: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1568980346-385840-1-git-send-email-s.riedmueller@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Fabio Estevam <festevam@gmail.com>, Andrew Smirnov <andrew.smirnov@gmail.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-imx@nxp.com, Stefan Riedmueller <s.riedmueller@phytec.de>
List-Id: devicetree@vger.kernel.org

Add devicetree bindings for i.MX6 based phyCORE-i.MX6, phyBOARD-Mira and
phyFLEX-i.MX6.

Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
---
Changes in v2:
 - Use seperate description for each board instead of squashing them into
   the standard board.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 37 ++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index c926ff6eac67..7dbb45cebb86 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -116,6 +116,21 @@ properties:
               - technologic,imx6q-ts7970
           - const: fsl,imx6q
 
+      - description: i.MX6Q PHYTEC phyBOARD-Mira
+        items:
+          - enum:
+              - phytec,imx6q-pbac06-emmc  # PHYTEC phyBOARD-Mira eMMC RDK
+              - phytec,imx6q-pbac06-nand  # PHYTEC phyBOARD-Mira NAND RDK
+          - const: phytec,imx6q-pbac06    # PHYTEC phyBOARD-Mira
+          - const: phytec,imx6qdl-pcm058  # PHYTEC phyCORE-i.MX6
+          - const: fsl,imx6q
+
+      - description: i.MX6Q PHYTEC phyFLEX-i.MX6
+        items:
+          - const: phytec,imx6q-pbab01    # PHYTEC phyFLEX carrier board
+          - const: phytec,imx6q-pfla02    # PHYTEC phyFLEX-i.MX6 Quad
+          - const: fsl,imx6q
+
       - description: i.MX6QP based Boards
         items:
           - enum:
@@ -123,6 +138,13 @@ properties:
               - fsl,imx6qp-sabresd        # i.MX6 Quad Plus SABRE Smart Device Board
           - const: fsl,imx6qp
 
+      - description: i.MX6QP PHYTEC phyBOARD-Mira
+        items:
+          - const: phytec,imx6qp-pbac06-nand
+          - const: phytec,imx6qp-pbac06   # PHYTEC phyBOARD-Mira
+          - const: phytec,imx6qdl-pcm058  # PHYTEC phyCORE-i.MX6
+          - const: fsl,imx6qp
+
       - description: i.MX6DL based Boards
         items:
           - enum:
@@ -138,6 +160,21 @@ properties:
               - ysoft,imx6dl-yapp4-ursa   # i.MX6 Solo Y Soft IOTA Ursa board
           - const: fsl,imx6dl
 
+      - description: i.MX6DL PHYTEC phyBOARD-Mira
+        items:
+          - enum:
+              - phytec,imx6dl-pbac06-emmc # PHYTEC phyBOARD-Mira eMMC RDK
+              - phytec,imx6dl-pbac06-nand # PHYTEC phyBOARD-Mira NAND RDK
+          - const: phytec,imx6dl-pbac06   # PHYTEC phyBOARD-Mira
+          - const: phytec,imx6qdl-pcm058  # PHYTEC phyCORE-i.MX6
+          - const: fsl,imx6dl
+
+      - description: i.MX6DL PHYTEC phyFLEX-i.MX6
+        items:
+          - const: phytec,imx6dl-pbab01   # PHYTEC phyFLEX carrier board
+          - const: phytec,imx6dl-pfla02   # PHYTEC phyFLEX-i.MX6 Quad
+          - const: fsl,imx6dl
+
       - description: i.MX6SL based Boards
         items:
           - enum:
-- 
2.7.4
