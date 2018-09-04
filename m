From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3 4/8] arm64: dts: qcom: msm8998: Add pmi8998 file
Date: Mon,  3 Sep 2018 22:01:19 -0700
Message-ID: <20180904050123.26601-5-bjorn.andersson@linaro.org>
References: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180904050123.26601-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add new dtsi file for the PMI8998, with its gpios and include all three
PMICs in the MSM8998 MTP dts.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- New patch

 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi |  3 ++
 arch/arm64/boot/dts/qcom/pmi8998.dtsi     | 40 +++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/pmi8998.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index 202aa1a5cf27..b4276da1fb0d 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -2,6 +2,9 @@
 /* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
 
 #include "msm8998.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
+#include "pm8005.dtsi"
 
 / {
 	aliases {
diff --git a/arch/arm64/boot/dts/qcom/pmi8998.dtsi b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
new file mode 100644
index 000000000000..da3285e216e2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmi8998.dtsi
@@ -0,0 +1,40 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmi8998_lsid0: pmic@2 {
+		compatible = "qcom,pmi8998", "qcom,spmi-pmic";
+		reg = <0x2 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmi8998_gpio: gpios@c000 {
+			compatible = "qcom,pmi8998-gpio", "qcom,spmi-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
+				     <0 0xc1 0 IRQ_TYPE_NONE>,
+				     <0 0xc2 0 IRQ_TYPE_NONE>,
+				     <0 0xc3 0 IRQ_TYPE_NONE>,
+				     <0 0xc4 0 IRQ_TYPE_NONE>,
+				     <0 0xc5 0 IRQ_TYPE_NONE>,
+				     <0 0xc6 0 IRQ_TYPE_NONE>,
+				     <0 0xc7 0 IRQ_TYPE_NONE>,
+				     <0 0xc8 0 IRQ_TYPE_NONE>,
+				     <0 0xc9 0 IRQ_TYPE_NONE>,
+				     <0 0xca 0 IRQ_TYPE_NONE>,
+				     <0 0xcb 0 IRQ_TYPE_NONE>,
+				     <0 0xcc 0 IRQ_TYPE_NONE>,
+				     <0 0xcd 0 IRQ_TYPE_NONE>;
+		};
+	};
+
+	pmi8998_lsid1: pmic@3 {
+		compatible = "qcom,pmi8998", "qcom,spmi-pmic";
+		reg = <0x3 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
-- 
2.18.0
