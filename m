From: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: [PATCH 5/5] arm64: Add DT support for Juno r1 board.
Date: Wed, 13 May 2015 18:11:32 +0100
Message-ID: <1431537092-19597-6-git-send-email-Liviu.Dudau@arm.com>
References: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1431537092-19597-1-git-send-email-Liviu.Dudau@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Marc Zyngier <marc.zyngier@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, devicetree <devicetree@vger.kernel.org>, LAKML <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

This board is based on Juno r0 with updated Cortex A5x revisions
and board errata fixes. It also contains coherent ThinLinks ports
on the expansion slot that allow for an AXI master on the daughter
card to participate in a coherency domain.

Support for SoC PCIe host bridge will be added as a separate series.

Signed-off-by: Liviu Dudau <Liviu.Dudau@arm.com>
---
 arch/arm64/boot/dts/arm/Makefile    |   2 +-
 arch/arm64/boot/dts/arm/juno-r1.dts | 123 ++++++++++++++++++++++++++++++++++++
 2 files changed, 124 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/arm/juno-r1.dts

diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
index 301a0da..c5c98b9 100644
--- a/arch/arm64/boot/dts/arm/Makefile
+++ b/arch/arm64/boot/dts/arm/Makefile
@@ -1,5 +1,5 @@
 dtb-$(CONFIG_ARCH_VEXPRESS) += foundation-v8.dtb
-dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb
+dtb-$(CONFIG_ARCH_VEXPRESS) += juno.dtb juno-r1.dtb
 dtb-$(CONFIG_ARCH_VEXPRESS) += rtsm_ve-aemv8a.dtb
 
 always		:= $(dtb-y)
diff --git a/arch/arm64/boot/dts/arm/juno-r1.dts b/arch/arm64/boot/dts/arm/juno-r1.dts
new file mode 100644
index 0000000..f6bc073
--- /dev/null
+++ b/arch/arm64/boot/dts/arm/juno-r1.dts
@@ -0,0 +1,123 @@
+/*
+ * ARM Ltd. Juno Platform
+ *
+ * Copyright (c) 2015 ARM Ltd.
+ *
+ * This file is licensed under a dual GPLv2 or BSD license.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	model = "ARM Juno development board (r1)";
+	compatible = "arm,juno", "arm,vexpress";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		serial0 = &soc_uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	psci {
+		compatible = "arm,psci-0.2";
+		method = "smc";
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		A57_0: cpu@0 {
+			compatible = "arm,cortex-a57","arm,armv8";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A57_L2>;
+		};
+
+		A57_1: cpu@1 {
+			compatible = "arm,cortex-a57","arm,armv8";
+			reg = <0x0 0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A57_L2>;
+		};
+
+		A53_0: cpu@100 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x0 0x100>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_1: cpu@101 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x0 0x101>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_2: cpu@102 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x0 0x102>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A53_3: cpu@103 {
+			compatible = "arm,cortex-a53","arm,armv8";
+			reg = <0x0 0x103>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&A53_L2>;
+		};
+
+		A57_L2: l2-cache0 {
+			compatible = "cache";
+		};
+
+		A53_L2: l2-cache1 {
+			compatible = "cache";
+		};
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		/* last 16MB of the first memory area is reserved for secure world use by firmware */
+		reg = <0x00000000 0x80000000 0x0 0x7f000000>,
+		      <0x00000008 0x80000000 0x1 0x80000000>;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 02 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 06 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 22 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&A57_0>,
+				     <&A57_1>,
+				     <&A53_0>,
+				     <&A53_1>,
+				     <&A53_2>,
+				     <&A53_3>;
+	};
+
+	#include "juno-base.dtsi"
+
+};
+
+&memtimer {
+	status = "okay";
+};
-- 
2.3.6
