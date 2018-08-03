From: Sricharan R <sricharan@codeaurora.org>
Subject: [PATCH 4/5] arm: dts: qcom: Add ipq8064-ap161.dts
Date: Fri,  3 Aug 2018 19:40:18 +0530
Message-ID: <1533305419-29152-5-git-send-email-sricharan@codeaurora.org>
References: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1533305419-29152-1-git-send-email-sricharan@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: sricharan@codeaurora.org
List-Id: devicetree@vger.kernel.org

Add a new board dts for ipq8064-ap161.

Signed-off-by: Sricharan R <sricharan@codeaurora.org>
---
 Documentation/devicetree/bindings/arm/qcom.txt | 2 ++
 arch/arm/boot/dts/Makefile                     | 1 +
 arch/arm/boot/dts/qcom-ipq8064-ap161.dts       | 7 +++++++
 3 files changed, 10 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq8064-ap161.dts

diff --git a/Documentation/devicetree/bindings/arm/qcom.txt b/Documentation/devicetree/bindings/arm/qcom.txt
index ee532e7..2325135 100644
--- a/Documentation/devicetree/bindings/arm/qcom.txt
+++ b/Documentation/devicetree/bindings/arm/qcom.txt
@@ -15,6 +15,7 @@ The 'SoC' and 'board' elements are required. All other elements are optional.
 
 The 'SoC' element must be one of the following strings:
 
+	ipq8064
 	apq8016
 	apq8074
 	apq8084
@@ -30,6 +31,7 @@ The 'SoC' element must be one of the following strings:
 
 The 'board' element must be one of the following strings:
 
+	ap
 	cdp
 	liquid
 	dragonboard
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 37a3de7..233661a 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -772,6 +772,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c1.dtb \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
+	qcom-ipq8064-ap161.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8974-fairphone-fp2.dtb \
diff --git a/arch/arm/boot/dts/qcom-ipq8064-ap161.dts b/arch/arm/boot/dts/qcom-ipq8064-ap161.dts
new file mode 100644
index 0000000..aab5174
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq8064-ap161.dts
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "qcom-ipq8064-v1.0.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ8064/AP-161";
+	compatible = "qcom,ipq8064-ap161";
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
