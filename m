From: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v3 5/5] arm64: dts: add Hi6220's stub clock node
Date: Mon,  3 Aug 2015 09:13:38 +0800
Message-ID: <1438564418-15948-6-git-send-email-leo.yan@linaro.org>
References: <1438564418-15948-1-git-send-email-leo.yan@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438564418-15948-1-git-send-email-leo.yan@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Wei Xu <xuwei5@hisilicon.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Bintian Wang <bintian.wang@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, Guodong Xu <guodong.xu@linaro.org>, Jian Zhang <zhangjian001@hisilicon.com>, Zhenwei Wang <Zhenwei.wang@hisilicon.com>, Haoju Mo <mohaoju@hisilicon.com>, Dan Zhao <dan.zhao@hisilicon.com>, sunzhaosheng@hisilicon.com, victor.lixin@hisilicon.com
Cc: Leo Yan <leo.yan@linaro.org>
List-Id: devicetree@vger.kernel.org

Enable SRAM node and stub clock node for Hi6220; furthermore
add the CPU's clock so it will be used by cpufreq-dt driver.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
index b42a9b7..94b8310 100644
--- a/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
+++ b/arch/arm64/boot/dts/hisilicon/hi6220.dtsi
@@ -57,6 +57,17 @@
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
 		};
 
 		cpu1: cpu@1 {
@@ -136,6 +147,11 @@
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
@@ -160,6 +176,13 @@
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
