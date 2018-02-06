From: <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 06/16] arm64: dts: mt7622: add cpufreq related device nodes
Date: Tue, 6 Feb 2018 17:52:55 +0800
Message-ID: <fc5bdf53b92bd7a96e94b714d8d13deebca95c28.1517910489.git.sean.wang@mediatek.com>
References: <cover.1517910489.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <cover.1517910489.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-mediatek-bounces+glpam-linux-mediatek=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>

Add clocks, regulators and opp information into cpu nodes.
In addition, the power supply for cpu nodes is deployed on
mt7622-rfb1 board.

Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Viresh Kumar <viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 12 +++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 49 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 4615af6..bbf4d03 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -20,6 +20,18 @@
 		bootargs = "console=ttyS0,115200n1";
 	};
 
+	cpus {
+		cpu@0 {
+			proc-supply = <&mt6380_vcpu_reg>;
+			sram-supply = <&mt6380_vm_reg>;
+		};
+
+		cpu@1 {
+			proc-supply = <&mt6380_vcpu_reg>;
+			sram-supply = <&mt6380_vm_reg>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys-polled";
 		poll-interval = <100>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index c387c4c..65eb417 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -18,6 +18,50 @@
 	#address-cells = <2>;
 	#size-cells = <2>;
 
+	cpu_opp_table: opp-table {
+		compatible = "operating-points-v2";
+		opp-shared;
+		opp-300000000 {
+			opp-hz = /bits/ 64 <30000000>;
+			opp-microvolt = <950000>;
+		};
+
+		opp-437500000 {
+			opp-hz = /bits/ 64 <437500000>;
+			opp-microvolt = <1000000>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1050000>;
+		};
+
+		opp-812500000 {
+			opp-hz = /bits/ 64 <812500000>;
+			opp-microvolt = <1100000>;
+		};
+
+		opp-1025000000 {
+			opp-hz = /bits/ 64 <1025000000>;
+			opp-microvolt = <1150000>;
+		};
+
+		opp-1137500000 {
+			opp-hz = /bits/ 64 <1137500000>;
+			opp-microvolt = <1200000>;
+		};
+
+		opp-1262500000 {
+			opp-hz = /bits/ 64 <1262500000>;
+			opp-microvolt = <1250000>;
+		};
+
+		opp-1350000000 {
+			opp-hz = /bits/ 64 <1350000000>;
+			opp-microvolt = <1310000>;
+		};
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -26,6 +70,10 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x0>;
+			clocks = <&infracfg CLK_INFRA_MUX1_SEL>,
+				 <&apmixedsys CLK_APMIXED_MAIN_CORE_EN>;
+			clock-names = "cpu", "intermediate";
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
 		};
@@ -34,6 +82,7 @@
 			device_type = "cpu";
 			compatible = "arm,cortex-a53", "arm,armv8";
 			reg = <0x0 0x1>;
+			operating-points-v2 = <&cpu_opp_table>;
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
 		};
-- 
2.7.4
