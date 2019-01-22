From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/5] ARM: dts: Add devicetree compatibles for LS1021A based boards
Date: Tue, 22 Jan 2019 09:51:44 +0530
Message-ID: <20190122042147.5424-3-manivannan.sadhasivam@linaro.org>
References: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122042147.5424-1-manivannan.sadhasivam@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: shawnguo@kernel.org, leoyang.li@nxp.com, robh+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, a.tropschug@ebs-systart.com, m.bittner@ebs-systart.com, amit.kucheria@linaro.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
List-Id: devicetree@vger.kernel.org

Add missing devicetree compatibles for the following LS1021A based
boards:

ls1021a-moxa-uc-8410a.dts
ls1021a-qds.dts
ls1021a-twr.dts

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts | 1 +
 arch/arm/boot/dts/ls1021a-qds.dts           | 1 +
 arch/arm/boot/dts/ls1021a-twr.dts           | 1 +
 3 files changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
index 6a83f30029ea..ba1ddd93b8f8 100644
--- a/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
+++ b/arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dts
@@ -18,6 +18,7 @@
 
 / {
 	model = "Moxa UC-8410A";
+	compatible = "fsl,ls1021a-moxa-uc-8410a", "fsl,ls1021a";
 
 	aliases {
 		enet0_rgmii_phy = &rgmii_phy0;
diff --git a/arch/arm/boot/dts/ls1021a-qds.dts b/arch/arm/boot/dts/ls1021a-qds.dts
index 923a25760516..ca60730dda40 100644
--- a/arch/arm/boot/dts/ls1021a-qds.dts
+++ b/arch/arm/boot/dts/ls1021a-qds.dts
@@ -51,6 +51,7 @@
 
 / {
 	model = "LS1021A QDS Board";
+	compatible = "fsl,ls1021a-qds", "fsl,ls1021a";
 
 	aliases {
 		enet0_rgmii_phy = &rgmii_phy1;
diff --git a/arch/arm/boot/dts/ls1021a-twr.dts b/arch/arm/boot/dts/ls1021a-twr.dts
index 8b48c3c7cd21..97e1fb7ea932 100644
--- a/arch/arm/boot/dts/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/ls1021a-twr.dts
@@ -51,6 +51,7 @@
 
 / {
 	model = "LS1021A TWR Board";
+	compatible = "fsl,ls1021a-twr", "fsl,ls1021a";
 
 	aliases {
 		enet2_rgmii_phy = &rgmii_phy1;
-- 
2.17.1
