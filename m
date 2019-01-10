From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 2/3] dt-bindings: arm: fsl: Add devicetree binding for Oxalis
Date: Thu, 10 Jan 2019 13:38:20 +0530
Message-ID: <20190110080821.30280-3-manivannan.sadhasivam@linaro.org>
References: <20190110080821.30280-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190110080821.30280-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add devicetree binding for Oxalis SoM board from EBS-SYSTART GmbH.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.txt b/Documentation/devicetree/bindings/arm/fsl.txt
index 7fbc42484001..b3bc70665a47 100644
--- a/Documentation/devicetree/bindings/arm/fsl.txt
+++ b/Documentation/devicetree/bindings/arm/fsl.txt
@@ -172,6 +172,10 @@ LS1012A ARMv8 based QDS Board
 Required root node properties:
     - compatible = "fsl,ls1012a-qds", "fsl,ls1012a";
 
+LS1012A ARMv8 based Oxalis Board
+Required root node properties:
+    - compatible = "ebs-systart,oxalis", "fsl,ls1012a";
+
 LS1043A SoC
 Required root node properties:
     - compatible = "fsl,ls1043a";
-- 
2.17.1
