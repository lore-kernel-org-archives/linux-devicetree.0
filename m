From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/5] dt-bindings: arm: fsl: Fix bindings for LS1012A and LS1021A based boards
Date: Tue, 22 Jan 2019 09:51:43 +0530
Message-ID: <20190122042147.5424-2-manivannan.sadhasivam@linaro.org>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Fix devicetree bindings for Freescale LS1012A and LS1021A SoC based boards.

Fixes: a1a38e1f4d1d ("dt-bindings: arm: Convert FSL board/soc bindings to json-schema")
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d34fe0749199..20fb61006f2b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -173,12 +173,20 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: LS1021A based Boards
+      - description: LS1012A based Boards
         items:
           - enum:
               - fsl,ls1012a-rdb
               - fsl,ls1012a-frdm
               - fsl,ls1012a-qds
+          - const: fsl,ls1012a
+
+      - description: LS1021A based Boards
+        items:
+          - enum:
+              - fsl,ls1021a-moxa-uc-8410a
+              - fsl,ls1021a-qds
+              - fsl,ls1021a-twr
           - const: fsl,ls1021a
 
       - description: LS1043A based Boards
-- 
2.17.1
