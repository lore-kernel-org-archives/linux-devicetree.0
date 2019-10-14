From: Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 3/4] ARM: mstar: Add infinity series dtsi
Date: Mon, 14 Oct 2019 15:15:58 +0900
Message-ID: <20191014061617.10296-3-daniel@0x0f.com>
References: <20191014061617.10296-1-daniel@0x0f.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191014061617.10296-1-daniel@0x0f.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: daniel@0x0f.com, Daniel Palmer <daniel@thingy.jp>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Maxime Ripard <mripard@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Icenowy Zheng <icenowy@aosc.io>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, "Paul E. McKenney" <paulmck@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>, Paul Burton <paul.burton@mips.com>, Andrew
List-Id: devicetree@vger.kernel.org

Adds initial dtsis for the infinity SoC family and a dtsi for
the infinity3 based msc313e part.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 MAINTAINERS                              |  1 +
 arch/arm/boot/dts/Makefile               |  3 +
 arch/arm/boot/dts/infinity.dtsi          | 71 ++++++++++++++++++++++++
 arch/arm/boot/dts/infinity3-msc313e.dtsi | 14 +++++
 arch/arm/boot/dts/infinity3.dtsi         | 11 ++++
 5 files changed, 100 insertions(+)
 create mode 100644 arch/arm/boot/dts/infinity.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3-msc313e.dtsi
 create mode 100644 arch/arm/boot/dts/infinity3.dtsi

diff --git a/MAINTAINERS b/MAINTAINERS
index e35c3eb2b680..8045563ac76f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1986,6 +1986,7 @@ M:	Daniel Palmer <daniel@thingy.jp>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 F:	Documentation/devicetree/bindings/arm/mstar.yaml
 F:	arch/arm/mach-mstar/
+F:	arch/arm/boot/dts/infinity*.dtsi
 S:	Maintained
 
 ARM/NEC MOBILEPRO 900/c MACHINE SUPPORT
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index b21b3a64641a..bf0aa53d3a13 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1303,3 +1303,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
 	aspeed-bmc-quanta-q71l.dtb
+dtb-$(CONFIG_ARCH_MSTAR) += \
+	infinity3-msc313e-breadbee.dtb
+
diff --git a/arch/arm/boot/dts/infinity.dtsi b/arch/arm/boot/dts/infinity.dtsi
new file mode 100644
index 000000000000..101582f277ff
--- /dev/null
+++ b/arch/arm/boot/dts/infinity.dtsi
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a7";
+			reg = <0x0>;
+		};
+	};
+
+	arch_timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(2)
+				| IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <6000000>;
+	};
+
+	pmu {
+		compatible = "arm,cortex-a7-pmu";
+		interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gic: interrupt-controller@0x16001000 {
+			compatible = "arm,cortex-a7-gic";
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			interrupt-controller;
+			reg = <0x16001000 0x1000>,
+			      <0x16002000 0x1000>;
+		};
+
+		pm_uart: uart@1f221000 {
+			compatible = "ns16550a";
+			reg = <0x1f221000 0x100>;
+			reg-shift = <3>;
+			clock-frequency = <172000000>;
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/infinity3-msc313e.dtsi b/arch/arm/boot/dts/infinity3-msc313e.dtsi
new file mode 100644
index 000000000000..d0c53153faad
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3-msc313e.dtsi
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity3.dtsi"
+
+/ {
+	memory {
+		device_type = "memory";
+		reg = <0x20000000 0x4000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/infinity3.dtsi b/arch/arm/boot/dts/infinity3.dtsi
new file mode 100644
index 000000000000..bea22cf62373
--- /dev/null
+++ b/arch/arm/boot/dts/infinity3.dtsi
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019 thingy.jp.
+ * Author: Daniel Palmer <daniel@thingy.jp>
+ */
+
+#include "infinity.dtsi"
+
+/ {
+};
+
-- 
2.23.0
