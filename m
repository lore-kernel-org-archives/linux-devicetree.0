From: Aleix Roca Nonell <kernelrocks@gmail.com>
Subject: [PATCH 6/6] arm64: dts: realtek: Add bpi-w2 board support and its
 RTD1296 SoC
Date: Sun, 7 Jul 2019 15:23:51 +0200
Message-ID: <20190707132351.GG13340@arks.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add basic device tree description for the Bannana Pi W2 (bpi-w2) and its
SoC. The board should be able to boot up to a ram based rootfs.

The only information available on the memreserve areas are the macro
names holing the addresses in the original source code:

 - 0x00000000 0x00100000 - apparently used to fix an undefined bug
 - 0x02600000 0x00c00000 - ION_AUDIO_HEAP
 - 0x03200000 0x0b800000 - ION_MEDIA_HEAP 1
 - 0x10000000 0x00014000 - ACPU_IDMEM
 - 0x14200000 0x09200000 - ION_MEDIA_HEAP 2

The CPUs still lack the enable-method property "rtk-spin-table" as
previously noted in [1].

[1] - commit 72a7786c0a0d65 ("ARM64: dts: Add Realtek RTD1295 and Zidoo X9S")

Signed-off-by: Aleix Roca Nonell <kernelrocks@gmail.com>
---
 arch/arm64/boot/dts/realtek/Makefile          |  1 +
 .../dts/realtek/rtd1296-bananapi-bpi-w2.dts   | 27 +++++++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi      | 77 +++++++++++++++++++
 3 files changed, 105 insertions(+)
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296-bananapi-bpi-w2.dts
 create mode 100644 arch/arm64/boot/dts/realtek/rtd1296.dtsi

diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
index 90c897ac3f7a..c1a6654e7d5b 100644
--- a/arch/arm64/boot/dts/realtek/Makefile
+++ b/arch/arm64/boot/dts/realtek/Makefile
@@ -2,3 +2,4 @@
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-mele-v9.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-probox2-ava.dtb
 dtb-$(CONFIG_ARCH_REALTEK) += rtd1295-zidoo-x9s.dtb
+dtb-$(CONFIG_ARCH_REALTEK) += rtd1296-bananapi-bpi-w2.dtb
diff --git a/arch/arm64/boot/dts/realtek/rtd1296-bananapi-bpi-w2.dts b/arch/arm64/boot/dts/realtek/rtd1296-bananapi-bpi-w2.dts
new file mode 100644
index 000000000000..1a81b9f2c3c3
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1296-bananapi-bpi-w2.dts
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/dts-v1/;
+
+#include "rtd1296.dtsi"
+
+/ {
+	model = "Banana Pi BPI-W2";
+	compatible = "bananapi,bpi-w2", "realtek,rtd1296";
+
+	chosen {
+		bootargs = "earlycon=uart8250,mmio32,0x98007800";
+	};
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0 0x80000000>; /* 2048 MB */
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/realtek/rtd1296.dtsi b/arch/arm64/boot/dts/realtek/rtd1296.dtsi
new file mode 100644
index 000000000000..f7a5f3b9698c
--- /dev/null
+++ b/arch/arm64/boot/dts/realtek/rtd1296.dtsi
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+// extension because of bug reported in realtek's source code
+/memreserve/ 0x00000000 0x00100000;
+
+/memreserve/ 0x02600000 0x00c00000;
+/memreserve/ 0x03200000 0x0b800000;
+/memreserve/ 0x10000000 0x00014000;
+/memreserve/ 0x14200000 0x09200000;
+
+#include "rtd129x.dtsi"
+
+/ {
+	compatible = "realtek,rtd1296";
+	interrupt-parent = <&gic>;
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		A53_0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x0>;
+			cpu-release-addr = <0x0 0x9801AA44>;
+			next-level-cache = <&a53_l2>;
+		};
+
+		A53_1: cpu@1 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x1>;
+			cpu-release-addr = <0x0 0x9801AA44>;
+			next-level-cache = <&a53_l2>;
+		};
+
+		A53_2: cpu@2 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x02>;
+			cpu-release-addr = <0x0 0x9801AA44>;
+			next-level-cache = <&a53_l2>;
+		};
+
+		A53_3: cpu@3 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53", "arm,armv8";
+			reg = <0x03>;
+			cpu-release-addr = <0x0 0x9801AA44>;
+			next-level-cache = <&a53_l2>;
+		};
+
+		a53_l2: l2-cache {
+			compatible = "cache";
+		};
+	};
+
+	soc@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0x98000000 0x70000>;
+		compatible = "simple-bus";
+		device_type = "soc";
+		ranges;
+	};
+
+	arch_timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <1 13 0xf08>,
+			<1 14 0xf08>,
+			<1 11 0xf08>,
+			<1 10 0xf08>;
+		clock-frequency = <27000000>;
+	};
+};
-- 
2.21.0
