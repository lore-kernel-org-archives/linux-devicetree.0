From: Andrew-sh.Cheng <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] Add cpufreq DTS node to the mt8183 and mt8183-evb.
Date: Mon, 29 Apr 2019 19:17:54 +0800
Message-ID: <1556536674-27068-2-git-send-email-andrew-sh.cheng@mediatek.com>
References: <1556536674-27068-1-git-send-email-andrew-sh.cheng@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1556536674-27068-1-git-send-email-andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, "Andrew-sh.Cheng" <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: "Andrew-sh.Cheng" <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Feature: cpufreq
Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
---
This patch is based on v5.1-rc1 and these patches:
https://patchwork.kernel.org/patch/10893519/
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts |  35 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi    | 244 ++++++++++++++++++++++++++++
 2 files changed, 279 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 465cdab..b8057fb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -175,6 +175,41 @@
 	};
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu0 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu1 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu2 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu3 {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
+&cpu4 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu5 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu6 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
+
+&cpu7 {
+	proc-supply = <&mt6358_vproc11_reg>;
+};
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index b36e37f..78d1ccf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -15,6 +15,218 @@
 	interrupt-parent = <&sysirq>;
 	#address-cells = <2>;
 	#size-cells = <2>;
+	cluster0_opp: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <650000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <675000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <700000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <725000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <750000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <775000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <800000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <825000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <850000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <862500>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <881250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <900000>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <925000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <950000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <975000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1000000>;
+		};	};
+
+	cluster1_opp: opp_table2 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <793000000>;
+			opp-microvolt = <650000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <910000000>;
+			opp-microvolt = <675000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <1014000000>;
+			opp-microvolt = <700000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <1131000000>;
+			opp-microvolt = <725000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <1248000000>;
+			opp-microvolt = <750000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <1326000000>;
+			opp-microvolt = <775000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <1417000000>;
+			opp-microvolt = <800000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <1508000000>;
+			opp-microvolt = <825000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <1586000000>;
+			opp-microvolt = <850000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <1625000000>;
+			opp-microvolt = <862500>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <1677000000>;
+			opp-microvolt = <881250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <1716000000>;
+			opp-microvolt = <900000>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1781000000>;
+			opp-microvolt = <925000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1846000000>;
+			opp-microvolt = <950000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1924000000>;
+			opp-microvolt = <975000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1989000000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
+	cluster2_opp: opp_table3 {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp00 {
+			opp-hz = /bits/ 64 <273000000>;
+			opp-microvolt = <650000>;
+		};
+		opp01 {
+			opp-hz = /bits/ 64 <338000000>;
+			opp-microvolt = <675000>;
+		};
+		opp02 {
+			opp-hz = /bits/ 64 <403000000>;
+			opp-microvolt = <700000>;
+		};
+		opp03 {
+			opp-hz = /bits/ 64 <463000000>;
+			opp-microvolt = <725000>;
+		};
+		opp04 {
+			opp-hz = /bits/ 64 <546000000>;
+			opp-microvolt = <750000>;
+		};
+		opp05 {
+			opp-hz = /bits/ 64 <624000000>;
+			opp-microvolt = <775000>;
+		};
+		opp06 {
+			opp-hz = /bits/ 64 <689000000>;
+			opp-microvolt = <800000>;
+		};
+		opp07 {
+			opp-hz = /bits/ 64 <767000000>;
+			opp-microvolt = <825000>;
+		};
+		opp08 {
+			opp-hz = /bits/ 64 <845000000>;
+			opp-microvolt = <850000>;
+		};
+		opp09 {
+			opp-hz = /bits/ 64 <871000000>;
+			opp-microvolt = <862500>;
+		};
+		opp10 {
+			opp-hz = /bits/ 64 <923000000>;
+			opp-microvolt = <881250>;
+		};
+		opp11 {
+			opp-hz = /bits/ 64 <962000000>;
+			opp-microvolt = <900000>;
+		};
+		opp12 {
+			opp-hz = /bits/ 64 <1027000000>;
+			opp-microvolt = <925000>;
+		};
+		opp13 {
+			opp-hz = /bits/ 64 <1092000000>;
+			opp-microvolt = <950000>;
+		};
+		opp14 {
+			opp-hz = /bits/ 64 <1144000000>;
+			opp-microvolt = <975000>;
+		};
+		opp15 {
+			opp-hz = /bits/ 64 <1196000000>;
+			opp-microvolt = <1000000>;
+		};
+	};
+
+	cci: cci {
+		compatible = "mediatek,mt8183-cci";
+		clocks = <&apmixedsys CLK_APMIXED_CCIPLL>;
+		clock-names = "cci_clock";
+		operating-points-v2 = <&cluster2_opp>;
+	};
 
 	cpus {
 		#address-cells = <1>;
@@ -57,6 +269,10 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x000>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu1: cpu@1 {
@@ -64,6 +280,10 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x001>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu2: cpu@2 {
@@ -71,6 +291,10 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x002>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu3: cpu@3 {
@@ -78,6 +302,10 @@
 			compatible = "arm,cortex-a53";
 			reg = <0x003>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP0_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster0_opp>;
 		};
 
 		cpu4: cpu@100 {
@@ -85,6 +313,10 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x100>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu5: cpu@101 {
@@ -92,6 +324,10 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x101>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu6: cpu@102 {
@@ -99,6 +335,10 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x102>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 
 		cpu7: cpu@103 {
@@ -106,6 +346,10 @@
 			compatible = "arm,cortex-a73";
 			reg = <0x103>;
 			enable-method = "psci";
+			clocks = <&mcucfg CLK_MCU_MP2_SEL>,
+				<&topckgen CLK_TOP_ARMPLL_DIV_PLL1>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cluster1_opp>;
 		};
 	};
 
-- 
1.8.1.1.dirty
