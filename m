From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v7 5/7] arm: add basic support for Mediatek MT6589 boards
Date: Thu,  5 Jun 2014 19:26:19 +0200
Message-ID: <1401989181-4712-6-git-send-email-matthias.bgg@gmail.com>
References: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1401989181-4712-1-git-send-email-matthias.bgg@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org
Cc: mark.rutland@arm.com, andrew@lunn.ch, linux-doc@vger.kernel.org, gregory.clement@free-electrons.com, thierry.reding@gmail.com, heiko.stuebner@bq.com, linux@arm.linux.org.uk, arnd@arndb.de, daniel.lezcano@linaro.org, linux-arm-kernel@lists.infradead.org, florian.vaussard@epfl.ch, sebastian.hesselbarth@gmail.com, devicetree@vger.kernel.org, jason@lakedaemon.net, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, marc.zyngier@arm.com, robh+dt@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, soren.brinkmann@xilinx.com, rdunlap@infradead.org, sboyd@codeaurora.org, silvio.fricke@gmail.com, galak@codeaurora.org, olof@lixom.net, maxime.ripard@free-electrons.com, jic23@kernel.org
List-Id: devicetree@vger.kernel.org

This adds a generic devicetree board file and a dtsi for boards
based on MT6589 SoCs from Mediatek.

Apart from the generic parts (gic, clocks) the only component
currently supported are the timers.

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 arch/arm/Kconfig                  |    2 +
 arch/arm/Makefile                 |    1 +
 arch/arm/boot/dts/mt6589.dtsi     |   94 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-mediatek/Kconfig    |    6 +++
 arch/arm/mach-mediatek/Makefile   |    1 +
 arch/arm/mach-mediatek/mediatek.c |   27 +++++++++++
 6 files changed, 131 insertions(+)
 create mode 100644 arch/arm/boot/dts/mt6589.dtsi
 create mode 100644 arch/arm/mach-mediatek/Kconfig
 create mode 100644 arch/arm/mach-mediatek/Makefile
 create mode 100644 arch/arm/mach-mediatek/mediatek.c

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index db3c541..0fc8acd 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -997,6 +997,8 @@ source "arch/arm/mach-mv78xx0/Kconfig"
 
 source "arch/arm/mach-imx/Kconfig"
 
+source "arch/arm/mach-mediatek/Kconfig"
+
 source "arch/arm/mach-mxs/Kconfig"
 
 source "arch/arm/mach-netx/Kconfig"
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 41c1931..8ce9774 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -170,6 +170,7 @@ machine-$(CONFIG_ARCH_MSM)		+= msm
 machine-$(CONFIG_ARCH_MV78XX0)		+= mv78xx0
 machine-$(CONFIG_ARCH_MVEBU)		+= mvebu
 machine-$(CONFIG_ARCH_MXC)		+= imx
+machine-$(CONFIG_ARCH_MEDIATEK)		+= mediatek
 machine-$(CONFIG_ARCH_MXS)		+= mxs
 machine-$(CONFIG_ARCH_NETX)		+= netx
 machine-$(CONFIG_ARCH_NOMADIK)		+= nomadik
diff --git a/arch/arm/boot/dts/mt6589.dtsi b/arch/arm/boot/dts/mt6589.dtsi
new file mode 100644
index 0000000..f1d8a8b
--- /dev/null
+++ b/arch/arm/boot/dts/mt6589.dtsi
@@ -0,0 +1,94 @@
+/*
+ * Copyright (c) 2014 MundoReader S.L.
+ * Author: Matthias Brugger <matthias.bgg@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include "skeleton.dtsi"
+
+/ {
+	compatible = "mediatek,mt6589";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+		cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x1>;
+		};
+		cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x2>;
+		};
+		cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x3>;
+		};
+
+	};
+
+	clocks {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		system_clk: dummy13m {
+			compatible = "fixed-clock";
+			clock-frequency = <13000000>;
+			#clock-cells = <0>;
+		};
+
+		rtc_clk: dummy32k {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		clock-ranges;
+		ranges;
+
+		timer: timer@10008000 {
+			compatible = "mediatek,mt6577-timer";
+			reg = <0x10008000 0x80>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&system_clk>, <&rtc_clk>;
+			clock-names = "system-clk", "rtc-clk";
+		};
+
+		gic: interrupt-controller@10212000 {
+			compatible = "arm,cortex-a15-gic";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			reg = <0x10211000 0x1000>,
+			      <0x10212000 0x1000>,
+			      <0x10214000 0x2000>,
+			      <0x10216000 0x2000>;
+		};
+	};
+};
diff --git a/arch/arm/mach-mediatek/Kconfig b/arch/arm/mach-mediatek/Kconfig
new file mode 100644
index 0000000..2c043a2
--- /dev/null
+++ b/arch/arm/mach-mediatek/Kconfig
@@ -0,0 +1,6 @@
+config ARCH_MEDIATEK
+	bool "Mediatek MT6589 SoC" if ARCH_MULTI_V7
+	select ARM_GIC
+	select MTK_TIMER
+	help
+	  Support for Mediatek Cortex-A7 Quad-Core-SoC MT6589.
diff --git a/arch/arm/mach-mediatek/Makefile b/arch/arm/mach-mediatek/Makefile
new file mode 100644
index 0000000..43e619f
--- /dev/null
+++ b/arch/arm/mach-mediatek/Makefile
@@ -0,0 +1 @@
+obj-$(CONFIG_ARCH_MEDIATEK) += mediatek.o
diff --git a/arch/arm/mach-mediatek/mediatek.c b/arch/arm/mach-mediatek/mediatek.c
new file mode 100644
index 0000000..f2acf07
--- /dev/null
+++ b/arch/arm/mach-mediatek/mediatek.c
@@ -0,0 +1,27 @@
+/*
+ * Device Tree support for Mediatek SoCs
+ *
+ * Copyright (c) 2014 MundoReader S.L.
+ * Author: Matthias Brugger <matthias.bgg@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ */
+#include <linux/init.h>
+#include <asm/mach/arch.h>
+
+static const char * const mediatek_board_dt_compat[] = {
+	"mediatek,mt6589",
+	NULL,
+};
+
+DT_MACHINE_START(MEDIATEK_DT, "Mediatek Cortex-A7 (Device Tree)")
+	.dt_compat	= mediatek_board_dt_compat,
+MACHINE_END
-- 
1.7.9.5
