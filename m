From: Anson.Huang@nxp.com
Subject: [PATCH V2 1/3] dt-bindings: arm: imx: Add the soc binding for i.MX8MN
Date: Mon,  3 Jun 2019 09:27:45 +0800
Message-ID: <20190603012747.38921-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, andrew.smirnov@gmail.com, manivannan.sadhasivam@linaro.org, marex@denx.de, ping.bai@nxp.com, u.kleine-koenig@pengutronix.de, leoyang.li@nxp.com, l.stach@pengutronix.de, aisheng.dong@nxp.com, bhaskar.upadhaya@nxp.com, pankaj.bansal@nxp.com, vabhav.sharma@nxp.com, pramod.kumar_1@nxp.com, leonard.crestez@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

This patch adds the soc & board binding for i.MX8MN.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
---
No changes.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 407138e..b1a5231 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -171,6 +171,12 @@ properties:
           - const: compulab,cl-som-imx7
           - const: fsl,imx7d
 
+      - description: i.MX8MN based Boards
+        items:
+          - enum:
+              - fsl,imx8mn-ddr4-evk            # i.MX8MN DDR4 EVK Board
+          - const: fsl,imx8mn
+
       - description: i.MX8MM based Boards
         items:
           - enum:
-- 
2.7.4
