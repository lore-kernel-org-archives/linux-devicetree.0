From: Vivek Unune <npcomplete13@gmail.com>
Subject: [PATCH v3] ARM: dts: BCM5301X: Add support for Linksys EA9500
Date: Mon, 18 Jun 2018 13:41:59 -0400
Message-ID: <20180618174159.86150-1-npcomplete13@gmail.com>
References: <20180222223844.98527-1-npcomplete13@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180222223844.98527-1-npcomplete13@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: florian.fainelli@broadcom.com, hauke@hauke-m.de, zajec5@gmail.com, jonmason@broadcom.com, bcm-kernel-feedback-list@broadcom.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vivek Unune <npcomplete13@gmail.com>
List-Id: devicetree@vger.kernel.org

Hardware Info
-------------

Processor	- Broadcom BCM4709C0KFEBG dual-core @ 1.4 GHz
Switch		- BCM53012 in BCM4709C0KFEBG & external BCM53125
DDR3 RAM	- 256 MB
Flash		- 128 MB (Toshiba TC58BVG0S3HTA00)
2.4GHz		- BCM4366 4×4 2.4/5G single chip 802.11ac SoC
Power Amp	- Skyworks SE2623L 2.4 GHz power amp (x4)
5GHz x 2	- BCM4366 4×4 2.4/5G single chip 802.11ac SoC
Power Amp	- PLX Technology PEX8603 3-lane, 3-port PCIe switch
Ports		- 8 Ports, 1 WAN Ports
Antennas	- 8 Antennas
Serial Port	- @J6 [GND,TX,RX] (VCC NC)    115200 8n1

Tested with OpenWrt built with DSA driver and Kernel v4.14

Signed-off-by: Vivek Unune <npcomplete13@gmail.com>
---
Changes in v3:
 - Remove unnecessary change to BCH settings
 - Remove ports 5 & 7 from internal switch for now
Changes in v2:
 - Properly define mdio mux, internal mdio, external mdio, mii bus
 - Now we define usb3 phy as a mdio node connected to internal mdio,
   thanks to work done by Rafał Miłecki on the bcm usb3 phy mdio driver
 - Define external SW as a mdio-mii node connected to external mdio
---
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts | 225 ++++++++++++++++++++++++
 1 file changed, 225 insertions(+)

diff --git a/arch/arm/boot/dts/bcm47094-linksys-panamera.dts b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
index 1b26f0be2382..f4f40fd7fbe5 100644
--- a/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
+++ b/arch/arm/boot/dts/bcm47094-linksys-panamera.dts
@@ -31,6 +31,231 @@
 			linux,code = <KEY_WPS_BUTTON>;
 			gpios = <&chipcommon 3 GPIO_ACTIVE_LOW>;
 		};
+
+		rfkill {
+				label = "WiFi";
+				linux,code = <KEY_RFKILL>;
+				gpios = <&chipcommon 16 GPIO_ACTIVE_LOW>;
+		};
+
+		reset {
+				label = "Reset";
+				linux,code = <KEY_RESTART>;
+				gpios = <&chipcommon 17 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		wps {
+			label = "bcm53xx:white:wps";
+			gpios = <&chipcommon 22 GPIO_ACTIVE_LOW>;
+		};
+
+		usb2 {
+			label = "bcm53xx:green:usb2";
+			gpios = <&chipcommon 1 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&ohci_port2>, <&ehci_port2>;
+			linux,default-trigger = "usbport";
+		};
+
+		usb3 {
+			label = "bcm53xx:green:usb3";
+			gpios = <&chipcommon 2 GPIO_ACTIVE_LOW>;
+			trigger-sources = <&ohci_port1>, <&ehci_port1>,
+					  <&xhci_port1>;
+			linux,default-trigger = "usbport";
+		};
+
+		power {
+			label = "bcm53xx:white:power";
+			gpios = <&chipcommon 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		wifi-disabled {
+			label = "bcm53xx:amber:wifi-disabled";
+			gpios = <&chipcommon 0 GPIO_ACTIVE_LOW>;
+		};
+
+		wifi-enabled {
+			label = "bcm53xx:white:wifi-enabled";
+			gpios = <&chipcommon 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar1 {
+			label = "bcm53xx:white:bluebar1";
+			gpios = <&chipcommon 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar2 {
+			label = "bcm53xx:white:bluebar2";
+			gpios = <&chipcommon 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar3 {
+			label = "bcm53xx:white:bluebar3";
+			gpios = <&chipcommon 15 GPIO_ACTIVE_LOW>;
+		};
+
+		bluebar4 {
+			label = "bcm53xx:white:bluebar4";
+			gpios = <&chipcommon 18 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar5 {
+			label = "bcm53xx:white:bluebar5";
+			gpios = <&chipcommon 19 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar6 {
+			label = "bcm53xx:white:bluebar6";
+			gpios = <&chipcommon 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar7 {
+			label = "bcm53xx:white:bluebar7";
+			gpios = <&chipcommon 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		bluebar8 {
+			label = "bcm53xx:white:bluebar8";
+			gpios = <&chipcommon 8 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	mdio-bus-mux {
+		mdio_ext: mdio@200 {	/* BIT(9) = 1 => external mdio */
+			reg = <0x200>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+
+	mdio-mii-mux {
+		compatible = "mdio-mux-mmioreg";
+		mdio-parent-bus = <&mdio_ext>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		reg = <0x1800c1c0 0x4>;
+		mux-mask = <0xc0>;		/* BIT(6) = mdc, BIT(7) = mdio */
+
+		mdio-mii@0 {
+			reg = <0x0>;		/* Enable mii function */
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			switch@0  {
+				compatible = "brcm,bcm53125";
+				#address-cells = <1>;
+				#size-cells = <0>;
+				reset-gpios = <&chipcommon 10 GPIO_ACTIVE_LOW>;
+				reset-names = "robo_reset";
+				reg = <0>;
+				dsa,member = <1 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						label = "lan1";
+					};
+
+					port@1 {
+						reg = <1>;
+						label = "lan5";
+					};
+
+					port@2 {
+						reg = <2>;
+						label = "lan2";
+					};
+
+					port@3 {
+						reg = <3>;
+						label = "lan6";
+					};
+
+					port@4 {
+						reg = <4>;
+						label = "lan3";
+					};
+
+					sw1_p8: port@8 {
+						reg = <8>;
+						ethernet = <&sw0_p0>;
+						label = "cpu";
+
+						fixed-link {
+							speed = <1000>;
+							full-duplex;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&usb2 {
+	vcc-gpio = <&chipcommon 13 GPIO_ACTIVE_HIGH>;
+};
+
+&usb3 {
+	vcc-gpio = <&chipcommon 14 GPIO_ACTIVE_HIGH>;
+};
+
+&srab {
+	compatible = "brcm,bcm53012-srab", "brcm,bcm5301x-srab";
+	status = "okay";
+	dsa,member = <0 0>;
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+			label = "lan7";
+		};
+
+		port@2 {
+			reg = <2>;
+			label = "lan4";
+		};
+
+		port@3 {
+			reg = <3>;
+			label = "lan8";
+		};
+
+		port@4 {
+			reg = <4>;
+			label = "wan";
+		};
+
+		port@8 {
+			reg = <8>;
+			ethernet = <&gmac2>;
+			label = "cpu";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
+
+		sw0_p0: port@0 {
+			reg = <0>;
+			label = "extsw";
+
+			fixed-link {
+				speed = <1000>;
+				full-duplex;
+			};
+		};
 	};
 };
 
-- 
2.11.0
