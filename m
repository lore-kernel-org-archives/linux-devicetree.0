From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v6 4/4] arm64: dts: add Hi6220's stub clock node
Date: Tue,  2 Feb 2016 18:09:42 +0800
Message-ID: <1454407782-24674-5-git-send-email-leo.yan@linaro.org>
References: <1454407782-24674-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1454407782-24674-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Yiping Xu <xuyiping@hisilicon.com>, Wei Xu <xuwei5@hisilicon.com>, Bintian Wang <bintian.wang@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>, Chen Feng <puck.chen@hisilicon.com>, Tyler Baker <tyler.baker@linaro.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Haojian Zhuang <haojian.zhuang@linaro.org>
List-Id: devicetree@vger.kernel.org

Enable SRAM node and stub clock node for Hi6220, which uses mailbox
channel 1 for CPU's frequency change.

Furthermore, add the CPU clock phandle in CPU's node and using
operating-points-v2 to register operating points. So can be used by
cpufreq-dt driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 56 +++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 23c79e1..f588be9 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -81,6 +81,11 @@
 			device_type = "cpu";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&stub_clock 0>;
+			operating-points-v2 = <&cpu_opp_table>;
+			cooling-min-level = <4>;
+			cooling-max-level = <0>;
+			#cooling-cells = <2>; /* min followed by max */
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -89,6 +94,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -97,6 +103,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -105,6 +112,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -113,6 +121,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -121,6 +130,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -129,6 +139,7 @@
 			device_type = "cpu";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -137,10 +148,42 @@
 			device_type = "cpu";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			operating-points-v2 = <&cpu_opp_table>;
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 	};
 
+	cpu_opp_table: cpu_opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp00 {
+			opp-hz = /bits/ 64 <208000000>;
+			opp-microvolt = <1040000>;
+			clock-latency-ns = <500000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <432000000>;
+			opp-microvolt = <1040000>;
+			clock-latency-ns = <500000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <729000000>;
+			opp-microvolt = <1090000>;
+			clock-latency-ns = <500000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <960000000>;
+			opp-microvolt = <1180000>;
+			clock-latency-ns = <500000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <1330000>;
+			clock-latency-ns = <500000>;
+		};
+	};
+
 	gic: interrupt-controller@f6801000 {
 		compatible = "arm,gic-400";
 		reg = <0x0 0xf6801000 0 0x1000>, /* GICD */
@@ -168,6 +211,11 @@
 		#size-cells = <2>;
 		ranges;
 
+		sram: sram@fff80000 {
+			compatible = "hisilicon,hi6220-sramctrl", "syscon";
+			reg = <0x0 0xfff80000 0x0 0x12000>;
+		};
+
 		ao_ctrl: ao_ctrl@f7800000 {
 			compatible = "hisilicon,hi6220-aoctrl", "syscon";
 			reg = <0x0 0xf7800000 0x0 0x2000>;
@@ -193,6 +241,14 @@
 			#clock-cells = <1>;
 		};
 
+		stub_clock: stub_clock {
+			compatible = "hisilicon,hi6220-stub-clk";
+			hisilicon,hi6220-clk-sram = <&sram>;
+			#clock-cells = <1>;
+			mbox-names = "mbox-tx";
+			mboxes = <&mailbox 1 0 11>;
+		};
+
 		uart0: uart@f8015000 {	/* console */
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
-- 
1.9.1
