From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [RFC v2 13/17] ARM64: dts: Add Actions Semi S900 and Bubblegum-96
Date: Fri, 24 Feb 2017 04:40:51 +0100
Message-ID: <20170224034055.18807-14-afaerber@suse.de>
References: <20170224034055.18807-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170224034055.18807-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mp-cs-/sSyCTpAT0ql5r2w9Jh5Rg@public.gmane.org, 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org, support-8Vy/tIz7429AfugRpC6u6w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Cc: 96boards-Ty1hIZOCd2XuufBYgWm87A@public.gmane.org
Signed-off-by: Andreas Färber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 v1 -> v2:
 * Reworded subject
 * Added memory@0 node for Bubblegum-96 (Mark)
 * Filled in reserved-memory sub-node for Bubblegum-96 (Mark)
 * Added arm-pmu interrupt-affinity property (Mark)
 * Changed second GIC reg size 0x1000 -> 0x2000 for Bubblegum-96 (Mark)
 * Updated ARCH_OWL to ARCH_ACTIONS (Arnd)
 * Renamed s900-bubblegum96.dts to s900-bubblegum-96.dts
 * Adopted "actions" vendor prefix
 * Dropped irq.h include
 * Adopted SPDX-License-Identifier (Rob)
 
 arch/arm64/boot/dts/Makefile                      |   1 +
 arch/arm64/boot/dts/actions/Makefile              |   5 +
 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts |  31 ++++++
 arch/arm64/boot/dts/actions/s900.dtsi             | 109 ++++++++++++++++++++++
 4 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/actions/Makefile
 create mode 100644 arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
 create mode 100644 arch/arm64/boot/dts/actions/s900.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 080232b..d1a6b0a 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -1,3 +1,4 @@
+dts-dirs += actions
 dts-dirs += al
 dts-dirs += allwinner
 dts-dirs += altera
diff --git a/arch/arm64/boot/dts/actions/Makefile b/arch/arm64/boot/dts/actions/Makefile
new file mode 100644
index 0000000..62922d6
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_ACTIONS) += s900-bubblegum-96.dtb
+
+always		:= $(dtb-y)
+subdir-y	:= $(dts-dirs)
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
new file mode 100644
index 0000000..a4ab7df
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/s900-bubblegum-96.dts
@@ -0,0 +1,31 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+/dts-v1/;
+
+#include "s900.dtsi"
+
+/ {
+	compatible = "ucrobotics,bubblegum-96", "actions,s900";
+	model = "Bubblegum-96";
+
+	aliases {
+		serial5 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial5:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x80000000>;
+	};
+};
+
+&uart5 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/actions/s900.dtsi b/arch/arm64/boot/dts/actions/s900.dtsi
new file mode 100644
index 0000000..75e1dea2
--- /dev/null
+++ b/arch/arm64/boot/dts/actions/s900.dtsi
@@ -0,0 +1,109 @@
+/*
+ * Copyright (c) 2017 Andreas Färber
+ *
+ * SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+ */
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "actions,s900";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		secmon@1f000000 {
+			reg = <0x0 0x1f000000 0x0 0x1000000>;
+			no-map;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	arm-pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10
+			(GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		gic: interrupt-controller@e00f1000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xe00f1000 0x0 0x1000>,
+			      <0x0 0xe00f2000 0x0 0x2000>,
+			      <0x0 0xe00f4000 0x0 0x2000>,
+			      <0x0 0xe00f6000 0x0 0x2000>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+		};
+
+		uart5: serial@e012a000 {
+			compatible = "actions,s900-uart", "actions,owl-uart";
+			reg = <0x0 0xe012a000 0x0 0x1000>;
+			interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+	};
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
