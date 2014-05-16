From: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v2 2/3] ARM: dts: kirkwood: add kirkwood-km_common DTSI files
Date: Fri, 16 May 2014 10:49:02 +0200
Message-ID: <1400230143-15620-3-git-send-email-valentin.longchamp@keymile.com>
References: <1400230143-15620-1-git-send-email-valentin.longchamp@keymile.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400230143-15620-1-git-send-email-valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linux ARM Kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Linux device trees <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This file allows to factor the common parts between the various Keymile
Kirkwood Designs.

kirkwood-km_common configures the peripherals that are currently
common to all our Kirkwood designs: PCIe, pinctrl, bitbang I2C, NAND
Flash controller.

The kirkwood-km_kirkwood file is then changed to include this common
file.

Signed-off-by: Valentin Longchamp <valentin.longchamp-SkAbAL50j+5BDgjK7y7TUQ@public.gmane.org>

---

Changes in v2:
- introduce kirkwood-km_common.dtsi to allow factoring some nodes
  between boards

 arch/arm/boot/dts/kirkwood-km_common.dtsi  | 48 ++++++++++++++++++++++++++++++
 arch/arm/boot/dts/kirkwood-km_kirkwood.dts | 38 +----------------------
 2 files changed, 49 insertions(+), 37 deletions(-)
 create mode 100644 arch/arm/boot/dts/kirkwood-km_common.dtsi

diff --git a/arch/arm/boot/dts/kirkwood-km_common.dtsi b/arch/arm/boot/dts/kirkwood-km_common.dtsi
new file mode 100644
index 0000000..b241135
--- /dev/null
+++ b/arch/arm/boot/dts/kirkwood-km_common.dtsi
@@ -0,0 +1,48 @@
+/ {
+	chosen {
+		bootargs = "console=ttyS0,115200n8 earlyprintk";
+		stdout-path = &uart0;
+	};
+
+	mbus {
+		pcie-controller {
+			status = "okay";
+
+			pcie@1,0 {
+				status = "okay";
+			};
+		};
+	};
+
+	ocp@f1000000 {
+		pinctrl: pin-controller@10000 {
+			pinctrl-0 = < &pmx_i2c_gpio_sda &pmx_i2c_gpio_scl >;
+			pinctrl-names = "default";
+
+			pmx_i2c_gpio_sda: pmx-gpio-sda {
+				marvell,pins = "mpp8";
+				marvell,function = "gpio";
+			};
+			pmx_i2c_gpio_scl: pmx-gpio-scl {
+				marvell,pins = "mpp9";
+				marvell,function = "gpio";
+			};
+		};
+
+		serial@12000 {
+			status = "ok";
+		};
+	};
+
+	i2c@0 {
+		compatible = "i2c-gpio";
+		gpios = < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
+			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
+		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
+	};
+};
+
+&nand {
+	status = "okay";
+	chip-delay = <25>;
+};
diff --git a/arch/arm/boot/dts/kirkwood-km_kirkwood.dts b/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
index 61139bf..235bf38 100644
--- a/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
+++ b/arch/arm/boot/dts/kirkwood-km_kirkwood.dts
@@ -2,6 +2,7 @@
 
 #include "kirkwood.dtsi"
 #include "kirkwood-98dx4122.dtsi"
+#include "kirkwood-km_common.dtsi"
 
 / {
 	model = "Keymile Kirkwood Reference Design";
@@ -11,43 +12,6 @@
 		device_type = "memory";
 		reg = <0x00000000 0x08000000>;
 	};
-
-	chosen {
-		bootargs = "console=ttyS0,115200n8 earlyprintk";
-		stdout-path = &uart0;
-	};
-
-	ocp@f1000000 {
-		pinctrl: pin-controller@10000 {
-			pinctrl-0 = < &pmx_i2c_gpio_sda &pmx_i2c_gpio_scl >;
-			pinctrl-names = "default";
-
-			pmx_i2c_gpio_sda: pmx-gpio-sda {
-				marvell,pins = "mpp8";
-				marvell,function = "gpio";
-			};
-			pmx_i2c_gpio_scl: pmx-gpio-scl {
-				marvell,pins = "mpp9";
-				marvell,function = "gpio";
-			};
-		};
-
-		serial@12000 {
-			status = "ok";
-		};
-	};
-
-	i2c@0 {
-		compatible = "i2c-gpio";
-		gpios = < &gpio0 8 GPIO_ACTIVE_HIGH		/* sda */
-			  &gpio0 9 GPIO_ACTIVE_HIGH>;		/* scl */
-		i2c-gpio,delay-us = <2>;	/* ~100 kHz */
-	};
-};
-
-&nand {
-	status = "okay";
-	chip-delay = <25>;
 };
 
 &mdio {
-- 
1.8.0.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
