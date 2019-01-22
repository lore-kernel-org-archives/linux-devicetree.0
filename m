From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/5] dt-bindings: vendor-prefixes: Add EBS-SYSTART GmbH Vendor Prefix
Date: Tue, 22 Jan 2019 09:51:45 +0530
Message-ID: <20190122042147.5424-4-manivannan.sadhasivam@linaro.org>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add vendor prefix for EBS-SYSTART GmbH.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.txt b/Documentation/devicetree/bindings/vendor-prefixes.txt
index 389508584f48..38693105b5c6 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.txt
+++ b/Documentation/devicetree/bindings/vendor-prefixes.txt
@@ -108,6 +108,7 @@ dongwoon	Dongwoon Anatech
 dptechnics	DPTechnics
 dragino	Dragino Technology Co., Limited
 ea	Embedded Artists AB
+ebs-systart EBS-SYSTART GmbH
 ebv	EBV Elektronik
 eckelmann	Eckelmann AG
 edt	Emerging Display Technologies
-- 
2.17.1
