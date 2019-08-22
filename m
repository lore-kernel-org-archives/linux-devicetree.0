From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v7 3/4] dt-bindings: arm: fsl: Add Kontron i.MX6UL N6310 compatibles
Date: Thu, 22 Aug 2019 08:02:37 +0200
Message-ID: <20190822060238.3887-3-krzk@kernel.org>
References: <20190822060238.3887-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190822060238.3887-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Schrempf Frieder <frieder.schrempf@kontron.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
List-Id: devicetree@vger.kernel.org

Add the compatibles for Kontron i.MX6UL N6310 SoM and boards.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v6:
1. Split entries to pass the dtbs_check.

Changes since v5:
New patch
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 7294ac36f4c0..1f440817fc03 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -161,6 +161,20 @@ properties:
         items:
           - enum:
               - fsl,imx6ul-14x14-evk      # i.MX6 UltraLite 14x14 EVK Board
+              - kontron,imx6ul-n6310-som  # Kontron N6310 SOM
+          - const: fsl,imx6ul
+
+      - description: Kontron N6310 S Board
+        items:
+          - const: kontron,imx6ul-n6310-s
+          - const: kontron,imx6ul-n6310-som
+          - const: fsl,imx6ul
+
+      - description: Kontron N6310 S 43 Board
+        items:
+          - const: kontron,imx6ul-n6310-s-43
+          - const: kontron,imx6ul-n6310-s
+          - const: kontron,imx6ul-n6310-som
           - const: fsl,imx6ul
 
       - description: i.MX6ULL based Boards
-- 
2.17.1
