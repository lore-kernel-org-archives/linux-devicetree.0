From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Subject: [PATCH v2 2/2] ARM: dts: add support for Turris Omnia
Date: Thu, 10 Nov 2016 14:57:21 +0100
Message-ID: <20161110135721.13098-2-uwe@kleine-koenig.org>
References: <20161110135721.13098-1-uwe@kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110135721.13098-1-uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: =?UTF-8?q?Martin=20Strba=C4=8Dka?= <martin.strbacka-x+rMaJPWets@public.gmane.org>, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This machine is an open hardware router by cz.nic driven by a
Marvell Armada 385.

Signed-off-by: Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
---
Compared to the (implict) v1, the following was changed:

 - disable rtc
 - change compatible to cznic,turris-omnia

The following components are working:

 - WAN port
 - eMMC
 - UART0
 - USB
 - mSATA

Wireless fails to probe, didn't debug this up to now.
I already see the DSA devices (with an additional change not included here),
but sending and receiving doesn't work yet.

SFP is missing as I cannot test it. UART1 is untested, but I'd be
surprised if it didn't work.

IMHO it makes sense to add the current state and fix the remaining stuff
incrementally.

Best regards
Uwe
---
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/armada-385-turris-omnia.dts | 257 ++++++++++++++++++++++++++
 2 files changed, 258 insertions(+)
 create mode 100644 arch/arm/boot/dts/armada-385-turris-omnia.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index befcd2619902..f1d3b9ff257e 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -920,6 +920,7 @@ dtb-$(CONFIG_MACH_ARMADA_38X) += \
 	armada-385-db-ap.dtb \
 	armada-385-linksys-caiman.dtb \
 	armada-385-linksys-cobra.dtb \
+	armada-385-turris-omnia.dtb \
 	armada-388-clearfog.dtb \
 	armada-388-db.dtb \
 	armada-388-gp.dtb \
diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boot/dts/armada-385-turris-omnia.dts
new file mode 100644
index 000000000000..28e45d816120
--- /dev/null
+++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
@@ -0,0 +1,257 @@
+/*
+ * Device Tree file for the Turris Omnia
+ * Schematic available at https://www.turris.cz/doc/_media/rtrom01-schema.pdf
+ *
+ * Copyright (C) 2016 Uwe Kleine-König <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
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
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include "armada-385.dtsi"
+
+/ {
+	model = "Turris Omnia";
+	compatible = "cznic,turris-omnia", "marvell,armada385", "marvell,armada380";
+
+	chosen {
+		stdout-path = &uart0;
+	};
+
+	memory {
+		device_type = "memory";
+		reg = <0x00000000 0x40000000>; /* 1024 MB */
+	};
+
+	soc {
+		ranges = <MBUS_ID(0xf0, 0x01) 0 0xf1000000 0x100000
+			  MBUS_ID(0x01, 0x1d) 0 0xfff00000 0x100000>;
+
+		internal-regs {
+
+			/* USB part of the eSATA/USB 2.0 port */
+			usb@58000 {
+				status = "okay";
+			};
+
+			rtc@a3800 {
+				/*
+				 * There are several errata for this device
+				 * still unimplemented. Without some love it only reports 
+				 * 2016-12-19 22:00:24. So disable for now.
+				 */
+				status = "disabled";
+			};
+
+			sata@a8000 {
+				status = "okay";
+			};
+
+			sdhci@d8000 {
+				pinctrl-names = "default";
+				pinctrl-0 = <&sdhci_pins>;
+				status = "okay";
+
+				bus-width = <8>;
+				no-1-8-v;
+				non-removable;
+			};
+
+			usb3@f0000 {
+				status = "okay";
+			};
+
+			usb3@f8000 {
+				status = "okay";
+			};
+		};
+
+		pcie-controller {
+			status = "okay";
+
+			pcie@1,0 {
+				/* Port 0, Lane 0 */
+				status = "okay";
+			};
+
+			pcie@2,0 {
+				/* Port 2, Lane 0 */
+				status = "okay";
+			};
+
+			pcie@3,0 {
+				/* Port 3, Lane 0 */
+				status = "okay";
+			};
+		};
+	};
+};
+
+&eth0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ge0_rgmii_pins>;
+	status = "okay";
+	phy-mode = "rgmii-id";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+&eth1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&ge1_rgmii_pins>;
+	status = "okay";
+	phy-mode = "rgmii-id";
+
+	fixed-link {
+		speed = <1000>;
+		full-duplex;
+	};
+};
+
+/* WAN port */
+&eth2 {
+	status = "okay";
+	phy-mode = "sgmii";
+	phy = <&phy1>;
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+	status = "okay";
+
+	i2cmux@70 {
+		compatible = "nxp,pca9547";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x70>;
+		status = "okay";
+
+		i2c@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0>;
+			status = "okay";
+
+			/* STM32F0 at address 0x2a */
+			/* leds device at address 0x2b */
+
+			eeprom@54 {
+				/* holds configuration about RAM, evaluated by bootloader */
+				compatible = "at,24c64";
+				reg = <0x54>;
+			};
+		};
+
+		i2c@5 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <5>;
+
+			/* ATSHA204A at address 0x64 */
+		};
+
+		i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <6>;
+
+			/* exposed on pin header */
+		};
+	};
+};
+
+&mdio {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins>;
+	status = "okay";
+
+	phy1: phy@1 {
+		status = "okay";
+		compatible = "ethernet-phy-id0141.0DD1", "ethernet-phy-ieee802.3-c22";
+		reg = <1>;
+	};
+
+	/* There is a Switch (MV88E7176) at address 0x10 */
+};
+
+&pinctrl {
+	spi0cs1_pins: spi0-pins-0cs1 {
+		marvell,pins = "mpp26";
+		marvell,function = "spi0";
+	};
+};
+
+&spi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins &spi0cs1_pins>;
+	status = "okay";
+
+	spi-nor@0 {
+		compatible = "spansion,s25fl164k", "jedec,spi-nor";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		reg = <0>;
+		spi-max-frequency = <40000000>;
+
+		partition@0 {
+			reg = <0x0 0x00100000>;
+			label = "U-Boot";
+		};
+
+		partition@1 {
+			reg = <0x00100000 0x00700000>;
+			label = "Rescue system";
+		};
+	};
+
+	/* @1 is on pin header */
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>;
+	status = "okay";
+};
-- 
2.10.2

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
