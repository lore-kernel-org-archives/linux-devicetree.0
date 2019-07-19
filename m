From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: arm: Document i.MX8QXP AI_ML board binding
Date: Fri, 19 Jul 2019 12:39:25 +0530
Message-ID: <20190719070926.29114-3-manivannan.sadhasivam@linaro.org>
References: <20190719070926.29114-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190719070926.29114-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, s.hauer@pengutronix.de, robh+dt@kernel.org
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Darshak.Patel@einfochips.com, kinjan.patel@einfochips.com, prajose.john@einfochips.com, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Document devicetree binding of i.MX8QXP AI_ML board from Einfochips.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 407138ebc0d0..8e9209a75478 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -180,6 +180,7 @@ properties:
       - description: i.MX8QXP based Boards
         items:
           - enum:
+              - einfochips,imx8qxp-ai_ml  # i.MX8QXP AI_ML Board
               - fsl,imx8qxp-mek           # i.MX8QXP MEK Board
           - const: fsl,imx8qxp
 
-- 
2.17.1
