From: Varadarajan Narayanan <varada@codeaurora.org>
Subject: [PATCH v4] qcom: ipq4019: Add basic board/dts support for IPQ4019 SoC
Date: Thu, 27 Aug 2015 11:01:38 +0530
Message-ID: <20150827053138.GA24234@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-arm-msm-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add initial dts files and SoC support for IPQ4019

Signed-off-by: Varadarajan Narayanan <varada@codeaurora.org>
---
All,
	Missed linux-arm-msm mailing list last time and
	incorrectly versioned the patch as v5.
	Kindly excuse.

Changes in v2:
  - Added devicetree bindings documentation

Changes in v3:
  - Split 'gcnt' into a separate patch
  - Added the new entries to Makefiles, Kconfig & board.c in sorted order
  - Used "qcom,ipq40xx" instead of "qcom,ipq40xx-r3pc" in board.c

Changes in v4:
  - Removed r3pc dts
  - Removed timer frequency

 arch/arm/boot/dts/qcom-ipq4019.dtsi | 72 +++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom-ipq4019.dtsi

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
new file mode 100644
index 0000000..668cc84
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -0,0 +1,72 @@
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
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
+		};
+
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+		};
+
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
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
+		serial@78b0000 {
+			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
+			reg = <0x78b0000 0x200>;
+			interrupts = <0 108 0>;
+			status = "disabled";
+		};
+	};
+};
-- 
1.8.2.1
