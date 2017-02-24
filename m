From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH v2 10/17] ARM: dts: Add Actions Semi S500 and LeMaker Guitar
Date: Fri, 24 Feb 2017 04:40:48 +0100
Message-ID: <20170224034055.18807-11-afaerber@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170224034055.18807-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v1 -> v2:
 * Reworded subject
 * Updated ARCH_OWL to ARCH_ACTIONS (Arnd)
 * Adopted "actions" vendor prefix
 * Dropped irq.h include
 * Added memory@0 node for Guitar SoM
 * Dropped bogus uart3 clock-frequency
 * Added device_type for CPU nodes
 * Fixed UART reg size
 * Adopted SPDX-License-Identifier (Rob)
 * Added remaining UART nodes
 * Added timer node
 
 arch/arm/boot/dts/Makefile                 |   2 +
 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts |  26 ++++++
 arch/arm/boot/dts/s500-guitar.dtsi         |  20 +++++
 arch/arm/boot/dts/s500.dtsi                | 135 +++++++++++++++++++++++++++++
 4 files changed, 183 insertions(+)
 create mode 100644 arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
 create mode 100644 arch/arm/boot/dts/s500-guitar.dtsi
 create mode 100644 arch/arm/boot/dts/s500.dtsi

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 0118084..578a20b 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -638,6 +638,8 @@ dtb-$(CONFIG_ARCH_ORION5X) += \
 	orion5x-maxtor-shared-storage-2.dtb \
 	orion5x-netgear-wnr854t.dtb \
 	orion5x-rd88f5182-nas.dtb
+dtb-$(CONFIG_ARCH_ACTIONS) += \
+	s500-guitar-bb-rev-b.dtb
 dtb-$(CONFIG_ARCH_PRIMA2) += \
 	prima2-evb.dtb
 dtb-$(CONFIG_ARCH_OXNAS) += \
diff --git a/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts b/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
new file mode 100644
index 0000000..834b71d
--- /dev/null
+++ b/arch/arm/boot/dts/s500-guitar-bb-rev-b.dts
@@ -0,0 +1,26 @@
+/*
+ * Copyright (c) 2016-2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include "s500-guitar.dtsi"
+
+/ {
+	compatible = "lemaker,guitar-bb-rev-b", "lemaker,guitar", "actions,s500";
+	model = "LeMaker Guitar Base Board rev. B";
+
+	aliases {
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial3:115200n8";
+	};
+};
+
+&uart3 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/s500-guitar.dtsi b/arch/arm/boot/dts/s500-guitar.dtsi
new file mode 100644
index 0000000..ef0e7e3
--- /dev/null
+++ b/arch/arm/boot/dts/s500-guitar.dtsi
@@ -0,0 +1,20 @@
+/*
+ * LeMaker Guitar SoM
+ *
+ * Copyright (c) 2016-2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#include "s500.dtsi"
+
+/ {
+	compatible = "lemaker,guitar", "actions,s500";
+
+	/delete-node/ memory;
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/s500.dtsi b/arch/arm/boot/dts/s500.dtsi
new file mode 100644
index 0000000..149bb7a
--- /dev/null
+++ b/arch/arm/boot/dts/s500.dtsi
@@ -0,0 +1,135 @@
+/*
+ * Actions Semi S500 SoC
+ *
+ * Copyright (c) 2016-2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#include "skeleton.dtsi"
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "actions,s500";
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0x0>;
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0x1>;
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0x2>;
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a9";
+			reg = <0x3>;
+		};
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a9-pmu";
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gic: interrupt-controller@b0021000 {
+			compatible = "arm,cortex-a9-gic";
+			reg = <0xb0021000 0x1000>,
+			      <0xb0020100 0x0100>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		l2: cache-controller@b0022000 {
+			compatible = "arm,pl310-cache";
+			reg = <0xb0022000 0x1000>;
+			cache-unified;
+			cache-level = <2>;
+			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
+			arm,tag-latency = <3 3 2>;
+			arm,data-latency = <5 3 3>;
+		};
+
+		uart0: serial@b0120000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb0120000 0x2000>;
+			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart1: serial@b0122000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb0122000 0x2000>;
+			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart2: serial@b0124000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb0126000 0x2000>;
+			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart3: serial@b0126000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb0126000 0x2000>;
+			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart4: serial@b0128000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb0128000 0x2000>;
+			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart5: serial@b012a000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb012a000 0x2000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart6: serial@b012c000 {
+			compatible = "actions,s500-uart", "actions,owl-uart";
+			reg = <0xb012c000 0x2000>;
+			interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		timer@b0168000 {
+			compatible = "actions,owl-timer";
+			reg = <0xb0168000 0x100>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+			             <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+		};
+	};
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
