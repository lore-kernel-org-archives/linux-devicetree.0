From: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
Subject: [RFC 3/4] MIPS: Ingenic: Initial X1000 SoC support
Date: Wed, 27 Sep 2017 20:45:26 +0530
Message-ID: <20170927151527.25570-4-prasannatsmkumar@gmail.com>
References: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170927151527.25570-1-prasannatsmkumar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, mturquette@baylibre.com, sboyd@codeaurora.org, devicetree@vger.kernel.org, linux-mips@linux-mips.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, paul@crapouillou.net, malat@debian.org, dom.peklo@gmail.com
Cc: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
List-Id: devicetree@vger.kernel.org

Add initial Ingenic X1000 SoC support. Provide minimum necessary
information to boot kernel to an initramfs userspace.

Signed-off-by: PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
---
 arch/mips/boot/dts/ingenic/x1000.dtsi | 93 +++++++++++++++++++++++++++++++++++
 arch/mips/jz4740/Kconfig              |  6 +++
 arch/mips/jz4740/time.c               |  2 +-
 3 files changed, 100 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/boot/dts/ingenic/x1000.dtsi

diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi b/arch/mips/boot/dts/ingenic/x1000.dtsi
new file mode 100644
index 0000000..abbb9ec
--- /dev/null
+++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
@@ -0,0 +1,93 @@
+/*
+ * Copyright (C) 2016 PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>
+ *
+ * This file is licensed under the terms of the GNU General Public
+ * License version 2. This program is licensed "as is" without any
+ * warranty of any kind, whether express or implied.
+ */
+
+#include <dt-bindings/clock/x1000-cgu.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	compatible = "ingenic,x1000";
+
+	cpuintc: interrupt-controller {
+		#address-cells = <0>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		compatible = "mti,cpu-interrupt-controller";
+	};
+
+	intc: interrupt-controller@10001000 {
+		compatible = "ingenic,x1000-intc", "ingenic,jz4780-intc";
+		reg = <0x10001000 0x50>;
+
+		interrupt-controller;
+		#interrupt-cells = <1>;
+
+		interrupt-parent = <&cpuintc>;
+		interrupts = <2>;
+	};
+
+	ext: ext {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
+	rtc: rtc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
+
+	cgu: jz4780-cgu@10000000 {
+		compatible = "ingenic,x1000-cgu";
+		reg = <0x10000000 0x100>;
+
+		clocks = <&ext>, <&rtc>;
+		clock-names = "ext", "rtc";
+
+		#clock-cells = <1>;
+	};
+
+	uart0: serial@10030000 {
+		compatible = "ingenic,x1000-uart", "ingenic,jz4780-uart";
+		reg = <0x10030000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <51>;
+
+		clocks = <&ext>, <&cgu X1000_CLK_UART0>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	uart1: serial@10031000 {
+		compatible = "ingenic,x1000-uart", "ingenic,jz4780-uart";
+		reg = <0x10031000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <50>;
+
+		clocks = <&ext>, <&cgu X1000_CLK_UART1>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+
+	uart2: serial@10032000 {
+		compatible = "ingenic,x1000-uart", "ingenic,jz4780-uart";
+		reg = <0x10032000 0x100>;
+
+		interrupt-parent = <&intc>;
+		interrupts = <49>;
+
+		clocks = <&ext>, <&cgu X1000_CLK_UART2>;
+		clock-names = "baud", "module";
+
+		status = "disabled";
+	};
+};
diff --git a/arch/mips/jz4740/Kconfig b/arch/mips/jz4740/Kconfig
index 36f8201..338bc3f 100644
--- a/arch/mips/jz4740/Kconfig
+++ b/arch/mips/jz4740/Kconfig
@@ -22,3 +22,9 @@ config MACH_JZ4780
 	select MIPS_CPU_SCACHE
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_SUPPORTS_HIGHMEM
+
+config MACH_X1000
+	bool
+	select MIPS_CPU_SCACHE
+	select SYS_HAS_CPU_MIPS32_R2
+	select SYS_HAS_EARLY_PRINTK
diff --git a/arch/mips/jz4740/time.c b/arch/mips/jz4740/time.c
index bb1ad51..e28c734 100644
--- a/arch/mips/jz4740/time.c
+++ b/arch/mips/jz4740/time.c
@@ -113,7 +113,7 @@ static struct clock_event_device jz4740_clockevent = {
 #ifdef CONFIG_MACH_JZ4740
 	.irq = JZ4740_IRQ_TCU0,
 #endif
-#ifdef CONFIG_MACH_JZ4780
+#if defined CONFIG_MACH_JZ4780 || defined CONFIG_MACH_X1000
 	.irq = JZ4780_IRQ_TCU2,
 #endif
 };
-- 
2.10.0
