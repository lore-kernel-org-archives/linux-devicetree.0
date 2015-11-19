From: Matthew McClintock <mmcclint@qca.qualcomm.com>
Subject: [PATCH v3 4/6] qcom: ipq4019: Add basic board/dts support for IPQ4019
 SoC
Date: Thu, 19 Nov 2015 17:19:31 -0600
Message-ID: <1447975173-29485-5-git-send-email-mmcclint@qca.qualcomm.com>
References: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1447975173-29485-1-git-send-email-mmcclint@qca.qualcomm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Andy Gross <agross@codeaurora.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Matthew McClintock <mmcclint@codeaurora.org>, Varadarajan Narayanan <varada@codeaurora.org>, linux-kernel@vger.kernel.org, qca-upstream.external@qca.qualcomm.com
List-Id: devicetree@vger.kernel.org

From: Matthew McClintock <mmcclint@codeaurora.org>

Add initial dts files and SoC support for IPQ4019

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---

v2
- add sleep_clk

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 115 ++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019.dtsi

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
new file mode 100644
index 0000000..fc73822
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -0,0 +1,115 @@
+/*
+ * Copyright (c) 2015, The Linux Foundation. All rights reserved.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 and
+ * only version 2 as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+
+#include "skeleton.dtsi"
+#include <dt-bindings/clock/qcom,gcc-ipq4019.h>
+
+/ {
+	model = "Qualcomm Technologies, Inc. IPQ4019";
+	compatible = "qcom,ipq4019";
+	interrupt-parent = <&intc>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+			clocks = <&gcc GCC_APPS_CLK_SRC>;
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+			clocks = <&gcc GCC_APPS_CLK_SRC>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+			clocks = <&gcc GCC_APPS_CLK_SRC>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
+			clocks = <&gcc GCC_APPS_CLK_SRC>;
+		};
+	};
+
+	clocks {
+		sleep_clk: sleep_clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32768>;
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+		compatible = "simple-bus";
+
+		intc: interrupt-controller@b000000 {
+			compatible = "qcom,msm-qgic2";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x0b000000 0x1000>,
+			<0x0b002000 0x1000>;
+		};
+
+		gcc: clock-controller@1800000 {
+			compatible = "qcom,gcc-ipq4019";
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			reg = <0x1800000 0x60000>;
+		};
+
+		tlmm: pinctrl@0x01000000 {
+			compatible = "qcom,ipq4019-pinctrl";
+			reg = <0x01000000 0x300000>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			interrupts = <0 208 0>;
+		};
+
+		serial@78af000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78af000 0x200>;
+			interrupts = <0 107 0>;
+			status = "disabled";
+			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+		};
+
+		serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78b0000 0x200>;
+			interrupts = <0 108 0>;
+			status = "disabled";
+			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>,
+				<&gcc GCC_BLSP1_AHB_CLK>;
+			clock-names = "core", "iface";
+		};
+	};
+};
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
