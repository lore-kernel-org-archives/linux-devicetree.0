From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 3/3] ARM: mvebu: Add Armada 385 General Purpose Development Board support
Date: Sat, 27 Dec 2014 12:00:35 +0100
Message-ID: <1419678035-10658-4-git-send-email-gregory.clement@free-electrons.com>
References: <1419678035-10658-1-git-send-email-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1419678035-10658-1-git-send-email-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The A385-GP is a board produced by Marvell that holds

- 1 PCIe slot
- 2 mini PCIe slot (one of them is multiplexed with the PCIe slot,
  muxing is selected through the GPIO expander)
- 1 16MB SPI-NOR
- 2 Gigabit Ethernet ports
- 4 SATA ports (2 of them are multiplexed with the mini PCIe slots,
  muxing is selected through the GPIO expander)
- 1 SDIO slot
- 1 USB3 port
- 2 USB2 port
- 2 GPIO/interrupts expander on I2C

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/Makefile          |   1 +
 arch/arm/boot/dts/armada-385-gp.dts | 380 ++++++++++++++++++++++++++++++++++++
 2 files changed, 381 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-385-gp.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 91bd5bd62857..d6d7bafac127 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -535,6 +535,7 @@ dtb-$(CONFIG_MACH_ARMADA_375) += \
 	armada-375-db.dtb
 dtb-$(CONFIG_MACH_ARMADA_38X) += \
 	armada-385-db.dtb \
+	armada-385-gp.dtb \
 	armada-385-rd.dtb
 dtb-$(CONFIG_MACH_ARMADA_XP) += \
 	armada-xp-axpwifiap.dtb \
diff --git a/arch/arm/boot/dts/armada-385-gp.dts b/arch/arm/boot/dts/armada-385-gp.dts
new file mode 100644
index 000000000000..c9a375674e7f
--- /dev/null
+++ b/arch/arm/boot/dts/armada-385-gp.dts
@@ -0,0 +1,380 @@
+/*
+ * Device Tree file for Marvell Armada 385 development board
+ * (RD-88F6820-GP)
+ *
+ * Copyright (C) 2014 Marvell
+ *
+ * Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is licensed under the terms of the GNU General Public
+ *     License version 2.  This program is licensed "as is" without
+ *     any warranty of any kind, whether express or implied.
+ *
+ * Or, alternatively,
+ *
+ *  b) Permission is hereby granted, free of charge, to any person
+ *     obtaining a copy of this software and associated documentation
+ *     files (the "Software"), to deal in the Software without
+ *     restriction, including without limitation the rights to use,
+ *     copy, modify, merge, publish, distribute, sublicense, and/or
+ *     sell copies of the Software, and to permit persons to whom the
+ *     Software is furnished to do so, subject to the following
+ *     conditions:
+ *
+ *     The above copyright notice and this permission notice shall be
+ *     included in all copies or substantial portions of the Software.
+ *
+ *     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+ *     EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+ *     OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+ *     NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
+ *     HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+ *     WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+ *     FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+ *     OTHER DEALINGS IN THE SOFTWARE.
+ */
+
+/dts-v1/;
+#include "armada-385.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	model = "Marvell Armada 385 GP";
+	compatible = "marvell,a385-gp", "marvell,armada385", "marvell,armada380";
+
+	chosen {
+		bootargs = "console=ttyS0,115200 earlyprintk";
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x80000000>; /* 2 GB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000>;
+
+		internal-regs {
+			spi@10600 {
+				status = "okay";
+
+				spi-flash@0 {
+					#address-cells = <1>;
+					#size-cells = <1>;
+					compatible = "st,m25p128";
+					reg = <0>; /* Chip select 0 */
+					spi-max-frequency = <50000000>;
+					m25p,fast-read;
+				};
+			};
+
+			i2c@11000 {
+				status = "okay";
+				clock-frequency = <100000>;
+
+				pca9555_0: pca9555@20 {
+					compatible = "nxp,pca9555";
+					pinctrl-names = "default";
+					pinctrl-0 = <&pca0_pins>;
+					interrupt-parent = <&gpio0>;
+					interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+					reg = <0x20>;
+				};
+
+				pca9555_1: pca9555@21 {
+					compatible = "nxp,pca9555";
+					pinctrl-names = "default";
+					interrupt-parent = <&gpio0>;
+					interrupts = <18 IRQ_TYPE_EDGE_FALLING>;
+
+					gpio-controller;
+					#gpio-cells = <2>;
+					interrupt-controller;
+					#interrupt-cells = <2>;
+
+					reg = <0x21>;
+				};
+
+			};
+
+			serial@12000 {
+				status = "okay";
+			};
+
+			ethernet@30000 {
+				status = "okay";
+				phy = <&phy0>;
+				phy-mode = "rgmii-id";
+			};
+
+			usb@50000 {
+				vcc-supply = <&reg_usb2_0_vbus>;
+				status = "okay";
+			};
+
+			ethernet@70000 {
+				status = "okay";
+				phy = <&phy1>;
+				phy-mode = "rgmii-id";
+			};
+
+
+			mdio@72004 {
+				phy0: ethernet-phy@0 {
+					reg = <0>;
+				};
+
+				phy1: ethernet-phy@1 {
+					reg = <1>;
+				};
+			};
+
+			sata@a8000 {
+				nr-ports = <2>;
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sata0: sata-port@0 {
+					reg = <0>;
+					target-supply = <&reg_5v_sata0>;
+				};
+
+				sata1: sata-port@1 {
+					reg = <1>;
+					target-supply = <&reg_5v_sata1>;
+				};
+			};
+
+			sata@e0000 {
+				nr-ports = <2>;
+				status = "okay";
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				sata2: sata-port@0 {
+					reg = <0>;
+					target-supply = <&reg_5v_sata2>;
+				};
+
+				sata3: sata-port@1 {
+					reg = <1>;
+					target-supply = <&reg_5v_sata3>;
+				};
+			};
+
+			sdhci@d8000 {
+				clock-frequency = <200000000>;
+				cd-gpios = <&pca9555_0 5 GPIO_ACTIVE_LOW>;
+				no-1-8-v;
+				wp-inverted;
+				bus-width = <8>;
+				status = "okay";
+			};
+
+			usb3@f0000 {
+				vcc-supply = <&reg_usb2_1_vbus>;
+				status = "okay";
+			};
+
+			usb3@f8000 {
+				vcc-supply = <&reg_usb3_vbus>;
+				status = "okay";
+			};
+		};
+
+		pcie-controller {
+			status = "okay";
+			/*
+			 * One PCIe units is accessible through
+			 * standard PCIe slot on the board.
+			 */
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status = "okay";
+			};
+
+			/*
+			 * The two other PCIe units are accessible
+			 * through mini PCIe slot on the board.
+			 */
+			pcie@2,0 {
+				/* Port 1, Lane 0 */
+				status = "okay";
+			};
+			pcie@3,0 {
+				/* Port 2, Lane 0 */
+				status = "okay";
+			};
+		};
+
+		gpio-fan {
+			compatible = "gpio-fan";
+			gpios = <&pca9555_1 3 GPIO_ACTIVE_HIGH>;
+			gpio-fan,speed-map = <0 0 3000 1>;
+		};
+	};
+
+	reg_usb3_vbus: usb3-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb3-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_1 15 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_usb2_0_vbus: v5-vbus0 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-vbus0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_1 14 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_usb2_1_vbus: v5-vbus1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-vbus1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_0 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_usb2_1_vbus: v5-vbus1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-vbus1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_0 4 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_sata0: pwr-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwr_en_sata0";
+		enable-active-high;
+		regulator-always-on;
+
+	};
+
+	reg_5v_sata0: v5-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata0>;
+	};
+
+	reg_12v_sata0: v12-sata0 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata0>;
+	};
+
+	reg_sata1: pwr-sata1 {
+		regulator-name = "pwr_en_sata1";
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_0 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_5v_sata1: v5-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata1";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata1>;
+	};
+
+	reg_12v_sata1: v12-sata1 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata1";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata1>;
+	};
+
+	reg_sata2: pwr-sata2 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwr_en_sata2";
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_0 11 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_5v_sata2: v5-sata2 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata2";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata2>;
+	};
+
+	reg_12v_sata2: v12-sata2 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata2";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata2>;
+	};
+
+	reg_sata3: pwr-sata3 {
+		compatible = "regulator-fixed";
+		regulator-name = "pwr_en_sata3";
+		enable-active-high;
+		regulator-always-on;
+		gpio = <&pca9555_0 12 GPIO_ACTIVE_HIGH>;
+	};
+
+	reg_5v_sata3: v5-sata3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v5.0-sata3";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata3>;
+	};
+
+	reg_12v_sata3: v12-sata3 {
+		compatible = "regulator-fixed";
+		regulator-name = "v12.0-sata3";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-always-on;
+		vin-supply = <&reg_sata3>;
+	};
+};
+
+&pinctrl {
+	pca0_pins: pca0_pins {
+		marvell,pins = "mpp18";
+		marvell,function = "gpio";
+	};
+};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
