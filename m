From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 6/6] arm64: dts: marvell: add gpio support for Armada 7K/8K
Date: Fri, 19 May 2017 18:09:25 +0200
Message-ID: <c9e9208894902eb43cecd8809ea8c08e9bcdd814.1495210061.git-series.gregory.clement@free-electrons.com>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
In-Reply-To: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Enable gpio support for CP and AP on the Marvell Armada 7K/8K SoCs.

The Armada 8K has two CP110 blocks, each having two GPIO controllers.
However, in each CP110 block, one of the GPIO controller cannot be
used: in the master CP110, only the second GPIO controller can be used,
while on the slave CP110, only the first GPIO controller can be used.

On the other side, the Armada 7K has only one CP110, but both its GPIO
controllers can be used.

For this reason, the GPIO controllers are marked as "disabled" in the
armada-cp110-master.dtsi and armada-cp110-slave.dtsi files, and only
enabled in the per-SoC dtsi files.

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm64/boot/dts/marvell/armada-70x0.dtsi         | 15 +++++++++-
 arch/arm64/boot/dts/marvell/armada-80x0.dtsi         | 16 +++++++++-
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi        | 10 ++++++-
 arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi | 21 ++++++++++++-
 arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi  | 22 +++++++++++++-
 5 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
index f6c22665d091..860b6ae9dcc5 100644
--- a/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-70x0.dtsi
@@ -46,6 +46,21 @@
 
 #include "armada-cp110-master.dtsi"
 
+/ {
+	aliases {
+		gpio1 = &cpm_gpio1;
+		gpio2 = &cpm_gpio2;
+	};
+};
+
+&cpm_gpio1 {
+	status = "okay";
+};
+
+&cpm_gpio2 {
+	status = "okay";
+};
+
 &cpm_syscon0 {
 	cpm_pinctrl: pinctrl {
 		compatible = "marvell,armada-7k-pinctrl";
diff --git a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
index 93d1de03b39a..666ebe96ba0d 100644
--- a/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-80x0.dtsi
@@ -47,6 +47,22 @@
 #include "armada-cp110-master.dtsi"
 #include "armada-cp110-slave.dtsi"
 
+/ {
+	aliases {
+		gpio1 = &cps_gpio1;
+		gpio2 = &cpm_gpio2;
+	};
+};
+
+/* The 80x0 has two CP blocks, but uses only one block from each. */
+&cps_gpio1 {
+	status = "okay";
+};
+
+&cpm_gpio2 {
+	status = "okay";
+};
+
 &cpm_syscon0 {
 	cpm_pinctrl: pinctrl {
 		compatible = "marvell,armada-8k-cpm-pinctrl";
diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
index 4a1b6e0a604a..64608658de5a 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -57,6 +57,7 @@
 	aliases {
 		serial0 = &uart0;
 		serial1 = &uart1;
+		gpio0 = &ap_gpio;
 	};
 
 	psci {
@@ -252,6 +253,15 @@
 				ap_pinctrl: pinctrl {
 					compatible = "marvell,ap806-pinctrl";
 				};
+
+				ap_gpio: gpio {
+					compatible = "marvell,armada-8k-gpio";
+					offset = <0x1040>;
+					ngpios = <19>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&ap_pinctrl 0 0 19>;
+				};
 			};
 		};
 	};
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
index 96a4ff75b3b0..f88618185d58 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-master.dtsi
@@ -104,6 +104,27 @@
 					compatible = "marvell,cp110-clock";
 					#clock-cells = <2>;
 				};
+
+				cpm_gpio1: gpio@100 {
+					compatible = "marvell,armada-8k-gpio";
+					offset = <0x100>;
+					ngpios = <32>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&cpm_pinctrl 0 0 32>;
+					status = "disabled";
+
+				};
+
+				cpm_gpio2: gpio@140 {
+					compatible = "marvell,armada-8k-gpio";
+					offset = <0x140>;
+					ngpios = <31>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&cpm_pinctrl 0 32 31>;
+					status = "disabled";
+				};
 			};
 
 			cpm_rtc: rtc@284000 {
diff --git a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
index 48a658aa5b32..f3a6e6742442 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110-slave.dtsi
@@ -111,6 +111,28 @@
 					compatible = "marvell,cp110-clock";
 					#clock-cells = <2>;
 				};
+
+				cps_gpio1: gpio@100 {
+					compatible = "marvell,armada-8k-gpio";
+					offset = <0x100>;
+					ngpios = <32>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&cps_pinctrl 0 0 32>;
+					status = "disabled";
+
+				};
+
+				cps_gpio2: gpio@140 {
+					compatible = "marvell,armada-8k-gpio";
+					offset = <0x140>;
+					ngpios = <31>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					gpio-ranges = <&cps_pinctrl 0 32 31>;
+					status = "disabled";
+				};
+
 			};
 
 			cps_sata0: sata@540000 {
-- 
git-series 0.9.1
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
