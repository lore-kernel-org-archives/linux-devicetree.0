From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: [PATCH 02/14] ARM: dts: armada-375: Use the node labels
Date: Thu, 10 Nov 2016 01:09:48 +0100
Message-ID: <20161110001000.10619-3-gregory.clement@free-electrons.com>
References: <20161110001000.10619-1-gregory.clement@free-electrons.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161110001000.10619-1-gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Use the node label when possible. As a result it flattens the device tree

Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
---
 arch/arm/boot/dts/armada-375-db.dts | 269 ++++++++++++++++++------------------
 1 file changed, 136 insertions(+), 133 deletions(-)

diff --git a/arch/arm/boot/dts/armada-375-db.dts b/arch/arm/boot/dts/armada-375-db.dts
index cded5f0a262d..b33a674088ed 100644
--- a/arch/arm/boot/dts/armada-375-db.dts
+++ b/arch/arm/boot/dts/armada-375-db.dts
@@ -69,138 +69,141 @@
 			  MBUS_ID(0x09, 0x09) 0 0xf1100000 0x10000
 			  MBUS_ID(0x09, 0x05) 0 0xf1110000 0x10000>;
 
-		internal-regs {
-			spi@10600 {
-				pinctrl-0 = <&spi0_pins>;
-				pinctrl-names = "default";
-				/*
-				 * SPI conflicts with NAND, so we disable it
-				 * here, and select NAND as the enabled device
-				 * by default.
-				 */
-				status = "disabled";
-
-				spi-flash@0 {
-					#address-cells = <1>;
-					#size-cells = <1>;
-					compatible = "n25q128a13", "jedec,spi-nor";
-					reg = <0>; /* Chip select 0 */
-					spi-max-frequency = <108000000>;
-				};
-			};
-
-			i2c@11000 {
-				status = "okay";
-				clock-frequency = <100000>;
-				pinctrl-0 = <&i2c0_pins>;
-				pinctrl-names = "default";
-			};
-
-			i2c@11100 {
-				status = "okay";
-				clock-frequency = <100000>;
-				pinctrl-0 = <&i2c1_pins>;
-				pinctrl-names = "default";
-			};
-
-			serial@12000 {
-				status = "okay";
-			};
-
-			pinctrl {
-				sdio_st_pins: sdio-st-pins {
-					marvell,pins = "mpp44", "mpp45";
-					marvell,function = "gpio";
-				};
-			};
-
-			sata@a0000 {
-				status = "okay";
-				nr-ports = <2>;
-			};
-
-			nand: nand@d0000 {
-				pinctrl-0 = <&nand_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-				num-cs = <1>;
-				marvell,nand-keep-config;
-				marvell,nand-enable-arbiter;
-				nand-on-flash-bbt;
-				nand-ecc-strength = <4>;
-				nand-ecc-step-size = <512>;
-
-				partition@0 {
-					label = "U-Boot";
-					reg = <0 0x800000>;
-				};
-				partition@800000 {
-					label = "Linux";
-					reg = <0x800000 0x800000>;
-				};
-				partition@1000000 {
-					label = "Filesystem";
-					reg = <0x1000000 0x3f000000>;
-				};
-			};
-
-			usb@54000 {
-				status = "okay";
-			};
-
-			usb3@58000 {
-				status = "okay";
-			};
-
-			mvsdio@d4000 {
-				pinctrl-0 = <&sdio_pins &sdio_st_pins>;
-				pinctrl-names = "default";
-				status = "okay";
-				cd-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
-				wp-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
-			};
-
-			mdio {
-				phy0: ethernet-phy@0 {
-					reg = <0>;
-				};
-
-				phy3: ethernet-phy@3 {
-					reg = <3>;
-				};
-			};
-
-			ethernet@f0000 {
-				status = "okay";
-
-				eth0@c4000 {
-					status = "okay";
-					phy = <&phy0>;
-					phy-mode = "rgmii-id";
-				};
-
-				eth1@c5000 {
-					status = "okay";
-					phy = <&phy3>;
-					phy-mode = "gmii";
-				};
-			};
-		};
-
-		pcie-controller {
-			status = "okay";
-			/*
-			 * The two PCIe units are accessible through
-			 * standard PCIe slots on the board.
-			 */
-			pcie@1,0 {
-				/* Port 0, Lane 0 */
-				status = "okay";
-			};
-			pcie@2,0 {
-				/* Port 1, Lane 0 */
-				status = "okay";
-			};
-		};
 	};
 };
+&pciec {
+	status = "okay";
+};
+
+/*
+ * The two PCIe units are accessible through
+ * standard PCIe slots on the board.
+ */
+&pcie0 {
+	/* Port 0, Lane 0 */
+	status = "okay";
+};
+
+&pcie1 {
+	/* Port 1, Lane 0 */
+	status = "okay";
+};
+
+
+&spi0 {
+	pinctrl-0 = <&spi0_pins>;
+	pinctrl-names = "default";
+
+	/*
+	 * SPI conflicts with NAND, so we disable it here, and
+	 * select NAND as the enabled device by default.
+	 */
+
+	status = "disabled";
+
+	spi-flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "n25q128a13", "jedec,spi-nor";
+		reg = <0>; /* Chip select 0 */
+		spi-max-frequency = <108000000>;
+	};
+};
+
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&pinctrl {
+	sdio_st_pins: sdio-st-pins {
+		marvell,pins = "mpp44", "mpp45";
+		marvell,function = "gpio";
+	};
+};
+
+&sata {
+	status = "okay";
+	nr-ports = <2>;
+};
+
+&nand {
+	pinctrl-0 = <&nand_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	num-cs = <1>;
+	marvell,nand-keep-config;
+	marvell,nand-enable-arbiter;
+	nand-on-flash-bbt;
+	nand-ecc-strength = <4>;
+	nand-ecc-step-size = <512>;
+
+	partition@0 {
+		label = "U-Boot";
+		reg = <0 0x800000>;
+	};
+	partition@800000 {
+		label = "Linux";
+		reg = <0x800000 0x800000>;
+	};
+	partition@1000000 {
+		label = "Filesystem";
+		reg = <0x1000000 0x3f000000>;
+	};
+};
+
+&usb1 {
+	status = "okay";
+};
+
+&usb2 {
+	status = "okay";
+};
+
+&sdio {
+	pinctrl-0 = <&sdio_pins &sdio_st_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	cd-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
+	wp-gpios = <&gpio1 13 GPIO_ACTIVE_HIGH>;
+};
+
+&mdio {
+	phy0: ethernet-phy@0 {
+		reg = <0>;
+	};
+
+	phy3: ethernet-phy@3 {
+		reg = <3>;
+	};
+};
+
+&ethernet {
+	status = "okay";
+};
+
+
+&eth0 {
+	status = "okay";
+	phy = <&phy0>;
+	phy-mode = "rgmii-id";
+};
+
+&eth1 {
+	status = "okay";
+	phy = <&phy3>;
+	phy-mode = "gmii";
+};
-- 
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
