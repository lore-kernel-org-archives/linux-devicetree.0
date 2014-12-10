From: Eddie Huang <eddie.huang@mediatek.com>
Subject: [PATCH 3/4] arm64: dts: Add mediatek MT8173 SoC and evaluation board
 dts and Makefile
Date: Wed, 10 Dec 2014 18:50:01 +0800
Message-ID: <1418208602-35584-4-git-send-email-eddie.huang@mediatek.com>
References: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1418208602-35584-1-git-send-email-eddie.huang@mediatek.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jason Cooper <jason@lakedaemon.net>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Mark Brown <broonie@linaro.org>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Sascha Hauer <kernel@pengutronix.de>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "Joe.C" <yingjoe.chen@mediatek.com>, Thomas Gleixner <tglx@linutronix.de>, Eddie Huang <eddie.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org, yh.chen@mediatek.com
List-Id: devicetree@vger.kernel.org

Add device tree support for MT8173 SoC and evalutaion board based on it.

Signed-off-by: Eddie Huang <eddie.huang@mediatek.com>
---
 arch/arm64/boot/dts/Makefile       |   1 +
 arch/arm64/boot/dts/mt8173-evb.dts |  31 +++++++
 arch/arm64/boot/dts/mt8173.dtsi    | 164 +++++++++++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mt8173-evb.dts
 create mode 100644 arch/arm64/boot/dts/mt8173.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index f8001a6..db7661e 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,3 +1,4 @@
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8173-evb.dtb
 dtb-$(CONFIG_ARCH_THUNDER) += thunder-88xx.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb foundation-v8.dtb
 dtb-$(CONFIG_ARCH_XGENE) += apm-mustang.dtb
diff --git a/arch/arm64/boot/dts/mt8173-evb.dts b/arch/arm64/boot/dts/mt8173-evb.dts
new file mode 100644
index 0000000..adf26dd
--- /dev/null
+++ b/arch/arm64/boot/dts/mt8173-evb.dts
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Eddie Huang <eddie.huang@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+/dts-v1/;
+#include "mt8173.dtsi"
+
+/ {
+	model = "mediatek,mt8173-evb";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	memory {
+		reg = <0 0x40000000 0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/mt8173.dtsi b/arch/arm64/boot/dts/mt8173.dtsi
new file mode 100644
index 0000000..1286801
--- /dev/null
+++ b/arch/arm64/boot/dts/mt8173.dtsi
@@ -0,0 +1,164 @@
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Author: Eddie Huang <eddie.huang@mediatek.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "mediatek,mt8173";
+	interrupt-parent = <&sysirq>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu0>;
+			};
+			core1 {
+				cpu = <&cpu1>;
+			};
+		};
+
+		cluster1 {
+			core0 {
+				cpu = <&cpu2>;
+			};
+			core1 {
+				cpu = <&cpu3>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x000>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0x001>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x100>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a57";
+			reg = <0x101>;
+			enable-method = "psci";
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	clocks {
+		clk26m: clk26m {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <26000000>;
+		};
+
+		clk32k: clk32k {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <32000>;
+		};
+
+		uart_clk: dummy26m {
+			compatible = "fixed-clock";
+			clock-frequency = <26000000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <1 13 0x8>,
+			     <1 14 0x8>,
+			     <1 11 0x8>,
+			     <1 10 0x8>;
+		clock-frequency = <13000000>;
+	};
+
+	soc {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		compatible = "simple-bus";
+		ranges;
+
+		sysirq: intpol-controller@10200620 {
+			compatible = "mediatek,mt8173-sysirq", "mediatek,mt6577-sysirq";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			reg = <0 0x10200620 0 0x20>;
+		};
+
+		gic: interrupt-controller@10220000 {
+			compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
+			#interrupt-cells = <3>;
+			interrupt-parent = <&gic>;
+			interrupt-controller;
+			reg = <0 0x10221000 0 0x1000>,
+			      <0 0x10222000 0 0x1000>,
+			      <0 0x10200620 0 0x1000>;
+		};
+
+		uart0: serial@11002000 {
+			compatible = "mediatek,mt8173-uart","mediatek,mt6577-uart";
+			reg = <0 0x11002000 0 0x400>;
+			interrupts = <0 83 8>;
+			clocks = <&uart_clk>;
+		};
+
+		uart1: serial@11003000 {
+			compatible = "mediatek,mt8173-uart","mediatek,mt6577-uart";
+			reg = <0 0x11003000 0 0x400>;
+			interrupts = <0 84 8>;
+			clocks = <&uart_clk>;
+		};
+
+		uart2: serial@11004000 {
+			compatible = "mediatek,mt8173-uart","mediatek,mt6577-uart";
+			reg = <0 0x11004000 0 0x400>;
+			interrupts = <0 85 8>;
+			clocks = <&uart_clk>;
+		};
+
+		uart3: serial@11005000 {
+			compatible = "mediatek,mt8173-uart","mediatek,mt6577-uart";
+			reg = <0 0x11005000 0 0x400>;
+			interrupts = <0 86 8>;
+			clocks = <&uart_clk>;
+		};
+	};
+
+};
+
-- 
1.8.1.1.dirty
