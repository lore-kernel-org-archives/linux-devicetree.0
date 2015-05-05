From: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 5/5] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Tue, 5 May 2015 20:06:39 +0800
Message-ID: <1430827599-11560-6-git-send-email-bintian.wang@huawei.com>
References: <1430827599-11560-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1430827599-11560-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, jorge.ramirez-ortiz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, khilman-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org
Cc: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add initial dtsi file to support Hisilicon Hi6220 SoC with
support of Octal core CPUs in two clusters and each cluster
has quard Cortex-A53.

Also add dts file to support HiKey development board which
based on Hi6220 SoC.

Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 arch/arm64/boot/dts/Makefile                   |   1 +
 arch/arm64/boot/dts/hisilicon/Makefile         |   5 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts |  31 +++++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      | 172 +++++++++++++++++++++++++
 4 files changed, 209 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index ad26a75..38913be 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -4,6 +4,7 @@ dts-dirs += arm
 dts-dirs += cavium
 dts-dirs += exynos
 dts-dirs += freescale
+dts-dirs += hisilicon
 dts-dirs += mediatek
 dts-dirs += qcom
 dts-dirs += sprd
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
index 0000000..e36a539
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
@@ -0,0 +1,31 @@
+/*
+ * dts file for Hisilicon HiKey Development Board
+ *
+ * Copyright (C) 2015, Hisilicon Ltd.
+ *
+ */
+
+/dts-v1/;
+
+/*Reserved 1MB memory for MCU*/
+/memreserve/ 0x05e00000 0x00100000;
+
+#include "hi6220.dtsi"
+
+/ {
+	model = "HiKey Development Board";
+	compatible = "hisilicon,hi6220-hikey", "hisilicon,hi6220";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
new file mode 100644
index 0000000..e774865
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -0,0 +1,172 @@
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
+	compatible = "hisilicon,hi6220";
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
+			compatible = "hisilicon,hi6220-aoctrl", "syscon";
+			reg = <0x0 0xf7800000 0x0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		sys_ctrl: sys_ctrl {
+			compatible = "hisilicon,hi6220-sysctrl", "syscon";
+			reg = <0x0 0xf7030000 0x0 0x2000>;
+			#clock-cells = <1>;
+		};
+
+		media_ctrl: media_ctrl {
+			compatible = "hisilicon,hi6220-mediactrl", "syscon";
+			reg = <0x0 0xf4410000 0x0 0x1000>;
+			#clock-cells = <1>;
+		};
+
+		pm_ctrl: pm_ctrl {
+			compatible = "hisilicon,hi6220-pmctrl", "syscon";
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
