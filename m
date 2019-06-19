From: Anson.Huang@nxp.com
Subject: [PATCH V4 1/4] dt-bindings: arm: imx: Add the soc binding for i.MX8MN
Date: Wed, 19 Jun 2019 10:21:42 +0800
Message-ID: <20190619022145.42398-1-Anson.Huang@nxp.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, andrew.smirnov@gmail.com, manivannan.sadhasivam@linaro.org, j.neuschaefer@gmx.net, u.kleine-koenig@pengutronix.de, leoyang.li@nxp.com, aisheng.dong@nxp.com, l.stach@pengutronix.de, vabhav.sharma@nxp.com, bhaskar.upadhaya@nxp.com, ping.bai@nxp.com, pramod.kumar_1@nxp.com, leonard.crestez@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Linux-imx@nxp.com
List-Id: devicetree@vger.kernel.org

From: Anson Huang <Anson.Huang@nxp.com>

This patch adds the soc & board binding for i.MX8MN.

Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
No change.
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 407138e..b35abb1 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -177,6 +177,12 @@ properties:
               - fsl,imx8mm-evk            # i.MX8MM EVK Board
           - const: fsl,imx8mm
 
+      - description: i.MX8MN based Boards
+        items:
+          - enum:
+              - fsl,imx8mn-ddr4-evk            # i.MX8MN DDR4 EVK Board
+          - const: fsl,imx8mn
+
       - description: i.MX8QXP based Boards
         items:
           - enum:
-- 
2.7.4
