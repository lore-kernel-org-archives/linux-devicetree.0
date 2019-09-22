From: Alexandre GRIVEAUX <agriveaux@deutnet.info>
Subject: [PATCH 2/4] MIPS: CI20: DTS: Add IW8103 Wifi + bluetooth
Date: Sun, 22 Sep 2019 22:12:37 +0200
Message-ID: <2ab4eb8e7f2c1de24228dd9216cd42e8dd2007a4.1569181001.git.agriveaux@deutnet.info>
References: <cover.1569181001.git.agriveaux@deutnet.info>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <cover.1569181001.git.agriveaux@deutnet.info>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org, paul.burton@mips.com, jhogan@kernel.org, agriveaux@deutnet.info
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add IW8103 Wifi + bluetooth module to device tree and related power domain.

Signed-off-by: Alexandre GRIVEAUX <agriveaux@deutnet.info>
---
 arch/mips/boot/dts/ingenic/ci20.dts | 39 +++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/mips/boot/dts/ingenic/ci20.dts b/arch/mips/boot/dts/ingenic/ci20.dts
index 4a77fa30a9cd..c62c36ae94c2 100644
--- a/arch/mips/boot/dts/ingenic/ci20.dts
+++ b/arch/mips/boot/dts/ingenic/ci20.dts
@@ -31,6 +31,13 @@
 		gpio = <&gpb 25 GPIO_ACTIVE_LOW>;
 		enable-active-high;
 	};
+
+	wlan0_power: fixedregulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "wlan0_power";
+		gpio = <&gpb 19 GPIO_ACTIVE_LOW>;
+		enable-active-high;
+	};
 };
 
 &ext {
@@ -54,9 +61,18 @@
 
 	bus-width = <4>;
 	max-frequency = <50000000>;
+	non-removable;
 
 	pinctrl-names = "default";
 	pinctrl-0 = <&pins_mmc1>;
+
+	brcmf: wifi@1 {
+/*		reg = <4>;*/
+		compatible = "brcm,bcm4330-fmac";
+		vcc-supply = <&wlan0_power>;
+		device-wakeup-gpios = <&gpd 9 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpf 7 GPIO_ACTIVE_LOW>;
+	};
 };
 
 &uart0 {
@@ -73,6 +89,23 @@
 	pinctrl-0 = <&pins_uart1>;
 };
 
+&uart2 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pins_uart2>;
+	uart-has-rtscts;
+
+	bluetooth {
+		compatible = "brcm,bcm4330-bt";
+		reset-gpios = <&gpf 8 GPIO_ACTIVE_HIGH>;
+		vcc-supply = <&wlan0_power>;
+		device-wakeup-gpios = <&gpf 5 GPIO_ACTIVE_HIGH>;
+		host-wakeup-gpios = <&gpf 6 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpf 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &uart3 {
 	status = "okay";
 
@@ -314,6 +347,12 @@
 		bias-disable;
 	};
 
+	pins_uart2: uart2 {
+		function = "uart2";
+		groups = "uart2-data", "uart2-hwflow";
+		bias-disable;
+	};
+
 	pins_uart3: uart3 {
 		function = "uart3";
 		groups = "uart3-data", "uart3-hwflow";
-- 
2.20.1
