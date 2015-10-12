From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v4 4/4] arm64: dts: add Hi6220's stub clock node
Date: Tue, 13 Oct 2015 00:32:15 +0800
Message-ID: <1444667535-16948-5-git-send-email-leo.yan@linaro.org>
References: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444667535-16948-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Jassi Brar <jassisinghbrar@gmail.com>, Leo Yan <leo.yan@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, Yiping Xu <xuyiping@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Enable SRAM node and stub clock node for Hi6220; furthermore
add the CPU's clock so it will be used by cpufreq-dt driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index 76560fa..912671e 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -80,6 +80,17 @@
 			device_type = "cpu";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			clocks = <&stub_clock 0>;
+			clock-latency = <0>;
+			operating-points = <
+				/* kHz */
+				1200000  0
+				960000   0
+				729000   0
+				432000   0
+				208000   0
+			>;
+			#cooling-cells = <2>; /* min followed by max */
 			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
 		};
 
@@ -167,6 +178,11 @@
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
@@ -191,6 +207,13 @@
 			#clock-cells = <1>;
 		};
 
+		stub_clock: stub_clock {
+			compatible = "hisilicon,hi6220-stub-clk";
+			hisilicon,hi6220-clk-sram = <&sram>;
+			#clock-cells = <1>;
+			mboxes = <&mailbox 1>;
+		};
+
 		uart0: uart@f8015000 {	/* console */
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x0 0xf8015000 0x0 0x1000>;
-- 
1.9.1
