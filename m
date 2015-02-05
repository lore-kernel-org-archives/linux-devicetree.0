From: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 3/3] arm64: dts: Add dts files for Hisilicon Hi6220 SoC
Date: Thu, 5 Feb 2015 17:24:37 +0800
Message-ID: <1423128277-10297-4-git-send-email-bintian.wang@huawei.com>
References: <1423128277-10297-1-git-send-email-bintian.wang@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423128277-10297-1-git-send-email-bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, rob.herring-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, zhangfei.gao-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, yanhaifeng-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, xuejiancheng-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, sledge.yanwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, guodong.xu-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, wangbinghui-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, zhenwei.wang-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, victor.lixin-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, puck.chen-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, dan.zhao-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, huxinwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, z.liuxinliang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, heyunlei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, kong.kongxinwei-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org, btw-aAikPa0K0u50tdys+9eLAQ@public.gmane.org, w.f-hv44wF8Li93QT0dZR+AlfA@public.gmane.org, liguozhu-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add initial dtsi file to support Hisilicon Hi6220 SoC with
support of Octal core CPUs in two clusters and each cluster
has quard Cortex-A53.

We now use the "spin-table" method for SMP, and it will be
changed to PSCI later.

Also add dts file to support HiKey development board which
based on Hi6220 SoC and document the devicetree bindings.

These dts files will be changed later and more nodes will be
added to describe other devices.

Signed-off-by: Bintian Wang <bintian.wang-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Reviewed-by: Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Yiping Xu <xuyiping-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>
---
 .../bindings/arm/hisilicon/hisilicon.txt           |   33 ++++
 arch/arm64/boot/dts/Makefile                       |    1 +
 arch/arm64/boot/dts/hisilicon/Makefile             |    5 +
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts     |   31 +++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  204 ++++++++++++++++++++
 5 files changed, 274 insertions(+)
 create mode 100644 arch/arm64/boot/dts/hisilicon/Makefile
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dts
 create mode 100644 arch/arm64/boot/dts/hisilicon/hi6220.dtsi

diff --git a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
index f717c7b..5eb6b41 100644
--- a/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
+++ b/Documentation/devicetree/bindings/arm/hisilicon/hisilicon.txt
@@ -9,6 +9,9 @@ HiP04 D01 Board
 Required root node properties:
 	- compatible = "hisilicon,hip04-d01";
 
+HiKey Board
+Required root node properties:
+	- compatible = "hisilicon,hi6220-hikey";
 
 Hisilicon system controller
 
@@ -62,6 +65,36 @@ Example:
 	};
 
 -----------------------------------------------------------------------
+Hisilicon Power Always ON domain controller
+
+Required properties:
+- compatible : "hisilicon,aoctrl"
+- reg : Register address and size
+
+Some clock registers are defined in power always on system controller,
+especially in Hi6220 SoC which is used for mobile platform.
+
+-----------------------------------------------------------------------
+Hisilicon Media domain controller
+
+Required properties:
+- compatible : "hisilicon,mediactrl"
+- reg : Register address and size
+
+Some clock registers of media module are defined in media system
+controller, especially in Hi6220 SoC which is used for mobile platform.
+
+-----------------------------------------------------------------------
+Hisilicon Power Management domain controller
+
+Required properties:
+- compatible : "hisilicon,pmctrl"
+- reg : Register address and size
+
+Some clock registers and PMU registers are defined in power management
+controller, especially in Hin6220 SoC which is used for mobile platform.
+
+-----------------------------------------------------------------------
 Fabric:
 
 Required Properties:
diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index c62b0f4..bffd6b7 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -2,5 +2,6 @@ dts-dirs += amd
 dts-dirs += apm
 dts-dirs += arm
 dts-dirs += cavium
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
index 0000000..a94da84
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
+/memreserve/ 0x0740f000 0x1000;
+
+#include "hi6220.dtsi"
+
+/ {
+	model = "HiKey Development Board";
+	compatible = "hisilicon,hi6220-hikey";
+	#address-cells = <2>;
+	#size-cells = <2>;
+	interrupt-parent = <&gic>;
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen { };
+
+	memory@7400000 {
+		device_type = "memory";
+		reg = <0x0 0x07400000 0x0 0x38c00000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
new file mode 100644
index 0000000..53ba9cf
--- /dev/null
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -0,0 +1,204 @@
+/*
+ * dts file for Hisilicon Hi6220 SoC
+ *
+ * Copyright (C) 2015, Hisilicon Ltd.
+ */
+
+#include <dt-bindings/clock/hi6220-clock.h>
+
+/ {
+	cpu-map {
+		cluster0 {
+			core0 {
+				cpu = <&cpu0>;
+			};
+			core1 {
+				cpu = <&cpu1>;
+			};
+			core2 {
+				cpu = <&cpu2>;
+			};
+			core3 {
+				cpu = <&cpu3>;
+			};
+		};
+		cluster1 {
+			core0 {
+				cpu = <&cpu4>;
+			};
+			core1 {
+				cpu = <&cpu5>;
+			};
+			core2 {
+				cpu = <&cpu6>;
+			};
+			core3 {
+				cpu = <&cpu7>;
+			};
+		};
+	};
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@000 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x0>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu1: cpu@001 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x1>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu2: cpu@002 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x2>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu3: cpu@003 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x3>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu4: cpu@100 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x100>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu5: cpu@101 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x101>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu6: cpu@102 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x102>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+		cpu7: cpu@103 {
+			compatible = "arm,cortex-a53", "arm,armv8";
+			device_type = "cpu";
+			reg = <0x0 0x103>;
+			enable-method = "spin-table";
+			cpu-release-addr = <0x0 0x740fff8>;
+			clock-latency = <0>;
+		};
+	};
+
+	gic: interrupt-controller@f6800000 {
+		compatible = "arm,gic-400", "arm,cortex-a15-gic";
+		reg = <0x0 0xf6801000 0x0 0x1000>, /* GICD */
+		      <0x0 0xf6802000 0x0 0x2000>, /* GICC */
+		      <0x0 0xf6804000 0x0 0x2000>, /* GICH */
+		      <0x0 0xf6806000 0x0 0x2000>; /* GICV */
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupt-controller;
+	};
+
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupt-parent = <&gic>;
+		interrupts = <1 13 0xff08>,
+			     <1 14 0xff08>,
+			     <1 11 0xff08>,
+			     <1 10 0xff08>;
+		clock-frequency = <1200000>;
+	};
+
+	soc {
+		compatible = "simple-bus";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		interrupt-parent = <&gic>;
+		ranges;
+
+		ao_ctrl: ao_ctrl {
+			compatible = "hisilicon,aoctrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0xf7800000 0x0 0x2000>;
+			ranges = <0 0x0 0xf7800000 0x2000>;
+
+			clock_ao: clock0@0 {
+				compatible = "hisilicon,hi6220-clock-ao";
+				reg = <0 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		sys_ctrl: sys_ctrl {
+			compatible = "hisilicon,sysctrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0xf7030000 0x0 0x2000>;
+			ranges = <0 0x0 0xf7030000 0x2000>;
+
+			clock_sys: clock1@0 {
+				compatible = "hisilicon,hi6220-clock-sys";
+				reg = <0 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		media_ctrl: media_ctrl {
+			compatible = "hisilicon,mediactrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0xf4410000 0x0 0x1000>;
+			ranges = <0 0x0 0xf4410000 0x1000>;
+
+			clock_media: clock2@0 {
+				compatible = "hisilicon,hi6220-clock-media";
+				reg = <0 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		pm_ctrl: pm_ctrl {
+			compatible = "hisilicon,pmctrl", "syscon";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x0 0xf7032000 0x0 0x1000>;
+			ranges = <0 0x0 0xf7032000 0x1000>;
+
+			clock_power: clock3@0 {
+				compatible = "hisilicon,hi6220-clock-power";
+				reg = <0 0x1000>;
+				#clock-cells = <1>;
+			};
+		};
+
+		uart0: uart@f8015000 {	/* console */
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xf8015000 0x0 0x1000>;
+			interrupts = <0 36 4>;
+			clocks = <&clock_ao HI6220_UART0_PCLK>, <&clock_ao HI6220_UART0_PCLK>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+	};
+};
-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
