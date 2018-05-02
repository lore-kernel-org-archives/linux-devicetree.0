From: Manu Gautam <mgautam@codeaurora.org>
Subject: [PATCH v5 6/7] dt-bindings: phy-qcom-usb2: Add support to override tuning values
Date: Thu,  3 May 2018 02:36:13 +0530
Message-ID: <1525295174-15995-7-git-send-email-mgautam@codeaurora.org>
References: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1525295174-15995-1-git-send-email-mgautam@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>, robh@kernel.org, sboyd@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, evgreen@chromium.org, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
List-Id: devicetree@vger.kernel.org

To improve eye diagram for PHYs on different boards of same SOC,
some parameters may need to be changed. Provide device tree
properties to override these from board specific device tree
files. While at it, replace "qcom,qusb2-v2-phy" with compatible
string for USB2 PHY on sdm845 which was earlier added for
sdm845 only.

Signed-off-by: Manu Gautam <mgautam@codeaurora.org>
---
 .../devicetree/bindings/phy/qcom-qusb2-phy.txt     | 23 +++++++++++++-
 include/dt-bindings/phy/phy-qcom-qusb2.h           | 37 ++++++++++++++++++++++
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/phy/phy-qcom-qusb2.h

diff --git a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
index 42c9742..03025d9 100644
--- a/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
+++ b/Documentation/devicetree/bindings/phy/qcom-qusb2-phy.txt
@@ -6,7 +6,7 @@ QUSB2 controller supports LS/FS/HS usb connectivity on Qualcomm chipsets.
 Required properties:
  - compatible: compatible list, contains
 	       "qcom,msm8996-qusb2-phy" for 14nm PHY on msm8996,
-	       "qcom,qusb2-v2-phy" for QUSB2 V2 PHY.
+	       "qcom,sdm845-qusb2-phy" for 10nm PHY on sdm845.
 
  - reg: offset and length of the PHY register set.
  - #phy-cells: must be 0.
@@ -27,6 +27,27 @@ Optional properties:
 		tuning parameter value for qusb2 phy.
 
  - qcom,tcsr-syscon: Phandle to TCSR syscon register region.
+ - qcom,imp-res-offset-value: It is a 6 bit value that specifies offset to be
+		added to PHY refgen RESCODE via IMP_CTRL1 register. It is a PHY
+		tuning parameter that may vary for different boards of same SOC.
+		This property is applicable to only QUSB2 v2 PHY (sdm845).
+ - qcom,hstx-trim-value: It is a 4 bit value that specifies tuning for HSTX
+		output current.
+		Possible range is - 15mA to 24mA (stepsize of 600 uA).
+		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		Default value is 22.2mA for sdm845.
+ - qcom,preemphasis-level: It is a 2 bit value that specifies pre-emphasis level.
+		Possible range is 0 to 15% (stepsize of 5%).
+		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		Default value is 10% for sdm845.
+- qcom,preemphasis-width: It is a 1 bit value that specifies how long the HSTX
+		pre-emphasis (specified using qcom,preemphasis-level) must be in
+		effect. Duration could be half-bit of full-bit.
+		See dt-bindings/phy/phy-qcom-qusb2.h for applicable values.
+		This property is applicable to only QUSB2 v2 PHY (sdm845).
+		Default value is full-bit width for sdm845.
 
 Example:
 	hsusb_phy: phy@7411000 {
diff --git a/include/dt-bindings/phy/phy-qcom-qusb2.h b/include/dt-bindings/phy/phy-qcom-qusb2.h
new file mode 100644
index 0000000..aea814a
--- /dev/null
+++ b/include/dt-bindings/phy/phy-qcom-qusb2.h
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_QCOM_PHY_QUSB2_H_
+#define _DT_BINDINGS_QCOM_PHY_QUSB2_H_
+
+/* PHY HSTX TRIM bit values (24mA to 15mA) */
+#define QUSB2_V2_HSTX_TRIM_24_0_MA		0x0
+#define QUSB2_V2_HSTX_TRIM_23_4_MA		0x1
+#define QUSB2_V2_HSTX_TRIM_22_8_MA		0x2
+#define QUSB2_V2_HSTX_TRIM_22_2_MA		0x3
+#define QUSB2_V2_HSTX_TRIM_21_6_MA		0x4
+#define QUSB2_V2_HSTX_TRIM_21_0_MA		0x5
+#define QUSB2_V2_HSTX_TRIM_20_4_MA		0x6
+#define QUSB2_V2_HSTX_TRIM_19_8_MA		0x7
+#define QUSB2_V2_HSTX_TRIM_19_2_MA		0x8
+#define QUSB2_V2_HSTX_TRIM_18_6_MA		0x9
+#define QUSB2_V2_HSTX_TRIM_18_0_MA		0xa
+#define QUSB2_V2_HSTX_TRIM_17_4_MA		0xb
+#define QUSB2_V2_HSTX_TRIM_16_8_MA		0xc
+#define QUSB2_V2_HSTX_TRIM_16_2_MA		0xd
+#define QUSB2_V2_HSTX_TRIM_15_6_MA		0xe
+#define QUSB2_V2_HSTX_TRIM_15_0_MA		0xf
+
+/* PHY PREEMPHASIS bit values */
+#define QUSB2_V2_PREEMPHASIS_NONE		0
+#define QUSB2_V2_PREEMPHASIS_5_PERCENT		1
+#define QUSB2_V2_PREEMPHASIS_10_PERCENT		2
+#define QUSB2_V2_PREEMPHASIS_15_PERCENT		3
+
+/* PHY PREEMPHASIS-WIDTH bit values */
+#define QUSB2_V2_PREEMPHASIS_WIDTH_FULL_BIT	0
+#define QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT	1
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
