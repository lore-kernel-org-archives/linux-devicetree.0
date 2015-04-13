From: Bintian Wang <bintian.wang@huawei.com>
Subject: [PATCH v2 6/6] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Mon, 13 Apr 2015 17:17:40 +0800
Message-ID: <1428916660-25910-7-git-send-email-bintian.wang@huawei.com>
References: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1428916660-25910-1-git-send-email-bintian.wang@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will.deacon@arm.com, devicetree@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, khilman@linaro.org, mturquette@linaro.org, rob.herring@linaro.org, zhangfei.gao@linaro.org, haojian.zhuang@linaro.org, xuwei5@hisilicon.com, jh80.chung@samsung.com, olof@lixom.net, yanhaifeng@gmail.com, sboyd@codeaurora.org, xuejiancheng@huawei.com, sledge.yanwei@huawei.com, tomeu.vizoso@collabora.com, linux@arm.linux.org.uk, guodong.xu@linaro.org, jorge.ramirez-ortiz@linaro.org, tyler.baker@linaro.org
Cc: xuyiping@hisilicon.com, wangbinghui@hisilicon.com, zhenwei.wang@hisilicon.com, victor.lixin@hisilicon.com, puck.chen@hisilicon.com, dan.zhao@hisilicon.com, huxinwei@huawei.com, bintian.wang@huawei.com, z.liuxinliang@huawei.com, heyunlei@huawei.com, kong.kongxinwei@hisilicon.com, btw@mail.itp.ac.cn, w.f@huawei.com, liguozhu@hisilicon.com
List-Id: devicetree@vger.kernel.org

Add initial dtsi file to support Hisilicon Hi6220 SoC with
support of Octal core CPUs in two clusters and each cluster
has quard Cortex-A53.

Also add dts file to support HiKey development board which
based on Hi6220 SoC.

Signed-off-by: Bintian Wang <bintian.wang@huawei.com>
Reviewed-by: Haojian Zhuang <haojian.zhuang@linaro.org>
Reviewed-by: Yiping Xu <xuyiping@hisilicon.com>
---
 arch/arm64/boot/dts/Makefile                   |   1 +
 arch/arm64/boot/dts/hisilicon/Makefile         |   5 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  28 ++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 171 +++++++++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index e0350ca..3c1c4cf 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -5,5 +5,6 @@ dts-dirs += cavium
 dts-dirs += exynos
 dts-dirs += freescale
 dts-dirs += mediatek
+dts-dirs += hisilicon
 
 subdir-y	:= $(dts-dirs)
diff --git a/arch/arm64/boot/dts/hisilicon/Makefile b/arch/arm64/boot/dts/hisilicon/Makefile
new file mode 100644
index 0000000..fa81a6e
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/Makefile
@@ -0,0 +1,5 @@
+dtb-$(CONFIG_ARCH_HISI) += hi6220-hikey.dtb
+
+always		:= $(dtb-y)
+subdir-y	:= $(dts-dirs)
+clean-files	:= *.dtb
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
new file mode 100644
index 0000000..c4b3ed8
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -0,0 +1,28 @@
+/*
+ * dts file for Hisilicon HiKey Development Board
+ *
+ * Copyright (C) 2015, Hisilicon Ltd.
+ *
+ */
+
+/dts-v1/;
+
+#include "hi6220.dtsi"
+
+/ {
+	model = "HiKey Development Board";
+	compatible = "hisilicon,hi6220-hikey";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		linux,stdout-path = &uart0;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
new file mode 100644
index 0000000..ca0f64c
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -0,0 +1,171 @@
+/*
+ * dts file for Hisilicon Hi6220 SoC
+ *
+ * Copyright (C) 2015, Hisilicon Ltd.
+ */
+
+#include <dt-bindings/clock/hi6220-clock.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
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
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+				core1 {
+					cpu = <&cpu1>;
+				};
+				core2 {
+					cpu = <&cpu2>;
+				};
+				core3 {
+					cpu = <&cpu3>;
+				};
+			};
+			cluster1 {
+				core0 {
+					cpu = <&cpu4>;
+				};
+				core1 {
+					cpu = <&cpu5>;
+				};
+				core2 {
+					cpu = <&cpu6>;
+				};
+				core3 {
+					cpu = <&cpu7>;
+				};
+			};
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@2 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x2>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@3 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x3>;
+			enable-method = "psci";
+		};
+
+		cpu4: cpu@100 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x100>;
+			enable-method = "psci";
+		};
+
+		cpu5: cpu@101 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x101>;
+			enable-method = "psci";
+		};
+
+		cpu6: cpu@102 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x102>;
+			enable-method = "psci";
+		};
+
+		cpu7: cpu@103 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x103>;
+			enable-method = "psci";
+		};
+	};
+
+	gic: interrupt-controller@f6801000 {
+		compatible = "arm,gic-400";
+		reg = <0x0 0xf6801000 0 0x1000>, /* GICD */
+		      <0x0 0xf6802000 0 0x2000>, /* GICC */
+		      <0x0 0xf6804000 0 0x2000>, /* GICH */
+		      <0x0 0xf6806000 0 0x2000>; /* GICV */
+		#address-cells = <0>;
+		#interrupt-cells = <3>;
+		interrupt-controller;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_HIGH)>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ao_ctrl: ao_ctrl {
+			compatible = "hisilicon,aoctrl", "syscon";
+			reg = <0x0 0xf7800000 0x0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		sys_ctrl: sys_ctrl {
+			compatible = "hisilicon,sysctrl", "syscon";
+			reg = <0x0 0xf7030000 0x0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		media_ctrl: media_ctrl {
+			compatible = "hisilicon,mediactrl", "syscon";
+			reg = <0x0 0xf4410000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pm_ctrl: pm_ctrl {
+			compatible = "hisilicon,pmctrl", "syscon";
+			reg = <0x0 0xf7032000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		uart0: uart@f8015000 {	/* console */
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf8015000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ao_ctrl HI6220_UART0_PCLK>, <&ao_ctrl HI6220_UART0_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+	};
+};
-- 
1.9.1
