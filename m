From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 3/6] ARM: shmobile: kzm9d: sort dts file by address
Date: Fri, 12 Sep 2014 10:51:13 +0200
Message-ID: <1410511876-9235-4-git-send-email-ulrich.hecht+renesas@gmail.com>
References: <1410511876-9235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Return-path: <linux-sh-owner@vger.kernel.org>
In-Reply-To: <1410511876-9235-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-sh-owner@vger.kernel.org
To: horms@verge.net.au, Olof Johansson <olof@lixom.net>
Cc: linux-sh@vger.kernel.org, devicetree@vger.kernel.org, magnus.damm@gmail.com, Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
---
 arch/arm/boot/dts/emev2-kzm9d.dts | 62 +++++++++++++++++++--------------------
 1 file changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/arm/boot/dts/emev2-kzm9d.dts b/arch/arm/boot/dts/emev2-kzm9d.dts
index 50ccd15..a1794cb 100644
--- a/arch/arm/boot/dts/emev2-kzm9d.dts
+++ b/arch/arm/boot/dts/emev2-kzm9d.dts
@@ -27,37 +27,6 @@
 		bootargs = "console=ttyS1,115200n81 ignore_loglevel root=/dev/nfs ip=dhcp";
 	};
 
-	reg_1p8v: regulator@0 {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-1.8V";
-		regulator-min-microvolt = <1800000>;
-		regulator-max-microvolt = <1800000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	reg_3p3v: regulator@1 {
-		compatible = "regulator-fixed";
-		regulator-name = "fixed-3.3V";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	lan9220@20000000 {
-		compatible = "smsc,lan9220", "smsc,lan9115";
-		reg = <0x20000000 0x10000>;
-		phy-mode = "mii";
-		interrupt-parent = <&gpio0>;
-		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
-		reg-io-width = <4>;
-		smsc,irq-active-high;
-		smsc,irq-push-pull;
-		vddvario-supply = <&reg_1p8v>;
-		vdd33a-supply = <&reg_3p3v>;
-	};
-
 	gpio_keys {
 		compatible = "gpio-keys";
 		#address-cells = <1>;
@@ -92,4 +61,35 @@
 			gpios = <&gpio0 17 GPIO_ACTIVE_HIGH>;
 		};
 	};
+
+	reg_1p8v: regulator@0 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	reg_3p3v: regulator@1 {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	lan9220@20000000 {
+		compatible = "smsc,lan9220", "smsc,lan9115";
+		reg = <0x20000000 0x10000>;
+		phy-mode = "mii";
+		interrupt-parent = <&gpio0>;
+		interrupts = <1 IRQ_TYPE_EDGE_RISING>;
+		reg-io-width = <4>;
+		smsc,irq-active-high;
+		smsc,irq-push-pull;
+		vddvario-supply = <&reg_1p8v>;
+		vdd33a-supply = <&reg_3p3v>;
+	};
 };
-- 
1.8.4.5

