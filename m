From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 2/3] dt-bindings: arm: fsl: Add devicetree binding for Oxalis
Date: Mon, 14 Jan 2019 15:50:52 +0530
Message-ID: <20190114102053.16013-3-manivannan.sadhasivam@linaro.org>
References: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190114102053.16013-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Oxalis board in JSON format. While adding
that, let's fix the description for LS1012A also.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index d34fe0749199..0f30142fe316 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -173,12 +173,13 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: LS1021A based Boards
+      - description: LS1012A based Boards
         items:
           - enum:
               - fsl,ls1012a-rdb
               - fsl,ls1012a-frdm
               - fsl,ls1012a-qds
+              - ebs-systart,oxalis
           - const: fsl,ls1021a
 
       - description: LS1043A based Boards
-- 
2.17.1
