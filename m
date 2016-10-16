From: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Subject: [PATCH 2/3] arm64: dts: uniphier: add CPU clock and OPP table for LD11 SoC
Date: Sun, 16 Oct 2016 23:59:17 +0900
Message-ID: <1476629958-25368-3-git-send-email-yamada.masahiro@socionext.com>
References: <1476629958-25368-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1476629958-25368-1-git-send-email-yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Add a CPU clock to every CPU node and a CPU OPP table to use the
generic cpufreq driver.

Note:
clock-latency-ns (300ns) was calculated based on the CPU-gear switch
sequencer spec; it takes 12 clock cycles on the sequencer running
at 50 MHz, plus a bit additional latency.

Signed-off-by: Masahiro Yamada <yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org>
---

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 38 ++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 73e0acf..e3eb10f 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -70,14 +70,18 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x000>;
+			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0 0x001>;
+			clocks = <&sys_clk 33>;
 			enable-method = "psci";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 	};
 
@@ -86,6 +90,40 @@
 		method = "smc";
 	};
 
+	cluster0_opp: opp_table {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp@245000000 {
+			opp-hz = /bits/ 64 <245000000>;
+			clock-latency-ns = <300>;
+		};
+		opp@250000000 {
+			opp-hz = /bits/ 64 <250000000>;
+			clock-latency-ns = <300>;
+		};
+		opp@490000000 {
+			opp-hz = /bits/ 64 <490000000>;
+			clock-latency-ns = <300>;
+		};
+		opp@500000000 {
+			opp-hz = /bits/ 64 <500000000>;
+			clock-latency-ns = <300>;
+		};
+		opp@653333333 {
+			opp-hz = /bits/ 64 <653334000>;
+			clock-latency-ns = <300>;
+		};
+		opp@666666666 {
+			opp-hz = /bits/ 64 <666667000>;
+			clock-latency-ns = <300>;
+		};
+		opp@980000000 {
+			opp-hz = /bits/ 64 <980000000>;
+			clock-latency-ns = <300>;
+		};
+	};
+
 	clocks {
 		refclk: ref {
 			compatible = "fixed-clock";
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
