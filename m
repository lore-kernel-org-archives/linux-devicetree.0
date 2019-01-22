From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 4/5] dt-bindings: arm: fsl: Add devicetree binding for Oxalis
Date: Tue, 22 Jan 2019 09:51:46 +0530
Message-ID: <20190122042147.5424-5-manivannan.sadhasivam@linaro.org>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for LS1012A SoC based Oxalis board.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 20fb61006f2b..6f85965e9fb4 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -176,6 +176,7 @@ properties:
       - description: LS1012A based Boards
         items:
           - enum:
+              - ebs-systart,oxalis
               - fsl,ls1012a-rdb
               - fsl,ls1012a-frdm
               - fsl,ls1012a-qds
-- 
2.17.1
