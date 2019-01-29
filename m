From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 07/13] ARM: dts: lpc32xx: phy3250: remove regulators umbrella
 device node
Date: Tue, 29 Jan 2019 21:20:43 +0200
Message-ID: <20190129192049.11223-8-vz@mleia.com>
References: <20190129192049.11223-1-vz@mleia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190129192049.11223-1-vz@mleia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The originally added 'regulators' device node has a number of flaws,
to name a few its children has unit addresses but no reg properties,
the regulators are not captured by a device driver due to a missing
'simple-bus' compatible, the regulator names are selected by killing
either alphabetical order or device node grouping property.

The change removes 'regulators' device node and renames the regulators
and labels.

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/lpc3250-phy3250.dts | 63 +++++++++++++--------------
 1 file changed, 31 insertions(+), 32 deletions(-)

diff --git a/arch/arm/boot/dts/lpc3250-phy3250.dts b/arch/arm/boot/dts/lpc3250-phy3250.dts
index ffcf78631b22..d2dad2b541ff 100644
--- a/arch/arm/boot/dts/lpc3250-phy3250.dts
+++ b/arch/arm/boot/dts/lpc3250-phy3250.dts
@@ -25,37 +25,6 @@
 		reg = <0x80000000 0x4000000>;
 	};
 
-	regulators {
-		backlight_reg: regulator@0 {
-			compatible = "regulator-fixed";
-			regulator-name = "backlight_reg";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&gpio 5 4 0>;
-			enable-active-high;
-			regulator-boot-on;
-		};
-
-		lcd_reg: regulator@1 {
-			compatible = "regulator-fixed";
-			regulator-name = "lcd_reg";
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			gpio = <&gpio 5 0 0>;
-			enable-active-high;
-			regulator-boot-on;
-		};
-
-		sd_reg: regulator@2 {
-			compatible = "regulator-fixed";
-			regulator-name = "sd_reg";
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			gpio = <&gpio 5 5 0>;
-			enable-active-high;
-		};
-	};
-
 	leds {
 		compatible = "gpio-leds";
 
@@ -69,6 +38,36 @@
 			linux,default-trigger = "heartbeat";
 		};
 	};
+
+	reg_backlight: regulator-backlight {
+		compatible = "regulator-fixed";
+		regulator-name = "backlight";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio 5 4 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	reg_lcd: regulator-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio 5 0 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	reg_sd: regulator-sd {
+		compatible = "regulator-fixed";
+		regulator-name = "sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio 5 5 0>;
+		enable-active-high;
+		regulator-boot-on;
+	};
 };
 
 &clcd {
@@ -130,7 +129,7 @@
 	cd-gpios = <&gpio 3 1 0>;
 	cd-inverted;
 	bus-width = <4>;
-	vmmc-supply = <&sd_reg>;
+	vmmc-supply = <&reg_sd>;
 	status = "okay";
 };
 
-- 
2.20.1
