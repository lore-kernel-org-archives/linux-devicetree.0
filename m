From: Adam Ford <aford173@gmail.com>
Subject: [PATCH V2] ARM: DTS: da850-evm: use phandles to extend nodes
Date: Fri, 27 Apr 2018 04:47:51 -0500
Message-ID: <20180427094751.19120-1-aford173@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Adam Ford <aford173@gmail.com>, devicetree@vger.kernel.org, robh+dt@kernel.org, nsekhar@ti.com, adam.ford@logicpd.com
List-Id: devicetree@vger.kernel.org

Many node labels in the device tree (like serial0, serial1, etc) are being
redefined, so let's modernize the device tree by using phandles to
extend the existing nodes.  This helps reduce the whitespace.

Signed-off-by: Adam Ford <aford173@gmail.com>
---

V2: Rename subject per feedback from Sekhar.
    Extend notes from tps6507x
    Add empty line after each node

 arch/arm/boot/dts/da850-evm.dts | 370 ++++++++++++++++----------------
 1 file changed, 188 insertions(+), 182 deletions(-)

diff --git a/arch/arm/boot/dts/da850-evm.dts b/arch/arm/boot/dts/da850-evm.dts
index a56d43d53ba1..52ffe6c517e3 100644
--- a/arch/arm/boot/dts/da850-evm.dts
+++ b/arch/arm/boot/dts/da850-evm.dts
@@ -27,146 +27,6 @@
 		spi0 = &spi1;
 	};
 
-	soc@1c00000 {
-		pmx_core: pinmux@14120 {
-			status = "okay";
-
-			mcasp0_pins: pinmux_mcasp0_pins {
-				pinctrl-single,bits = <
-					/*
-					 * AHCLKX, ACLKX, AFSX, AHCLKR, ACLKR,
-					 * AFSR, AMUTE
-					 */
-					0x00 0x11111111 0xffffffff
-					/* AXR11, AXR12 */
-					0x04 0x00011000 0x000ff000
-				>;
-			};
-			nand_pins: nand_pins {
-				pinctrl-single,bits = <
-					/* EMA_WAIT[0], EMA_OE, EMA_WE, EMA_CS[4], EMA_CS[3] */
-					0x1c 0x10110110  0xf0ff0ff0
-					/*
-					 * EMA_D[0], EMA_D[1], EMA_D[2],
-					 * EMA_D[3], EMA_D[4], EMA_D[5],
-					 * EMA_D[6], EMA_D[7]
-					 */
-					0x24 0x11111111  0xffffffff
-					/* EMA_A[1], EMA_A[2] */
-					0x30 0x01100000  0x0ff00000
-				>;
-			};
-		};
-		serial0: serial@42000 {
-			status = "okay";
-		};
-		serial1: serial@10c000 {
-			status = "okay";
-		};
-		serial2: serial@10d000 {
-			status = "okay";
-		};
-		rtc0: rtc@23000 {
-			status = "okay";
-		};
-		i2c0: i2c@22000 {
-			status = "okay";
-			clock-frequency = <100000>;
-			pinctrl-names = "default";
-			pinctrl-0 = <&i2c0_pins>;
-
-			tps: tps@48 {
-				reg = <0x48>;
-			};
-			tlv320aic3106: tlv320aic3106@18 {
-				#sound-dai-cells = <0>;
-				compatible = "ti,tlv320aic3106";
-				reg = <0x18>;
-				status = "okay";
-
-				/* Regulators */
-				IOVDD-supply = <&vdcdc2_reg>;
-				/* Derived from VBAT: Baseboard 3.3V / 1.8V */
-				AVDD-supply = <&vbat>;
-				DRVDD-supply = <&vbat>;
-				DVDD-supply = <&vbat>;
-			};
-			tca6416: gpio@20 {
-				compatible = "ti,tca6416";
-				reg = <0x20>;
-				gpio-controller;
-				#gpio-cells = <2>;
-			};
-		};
-		wdt: wdt@21000 {
-			status = "okay";
-		};
-		mmc0: mmc@40000 {
-			max-frequency = <50000000>;
-			bus-width = <4>;
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&mmc0_pins>;
-			cd-gpios = <&gpio 64 GPIO_ACTIVE_LOW>;
-			wp-gpios = <&gpio 65 GPIO_ACTIVE_HIGH>;
-		};
-		spi1: spi@30e000 {
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&spi1_pins &spi1_cs0_pin>;
-			flash: m25p80@0 {
-				#address-cells = <1>;
-				#size-cells = <1>;
-				compatible = "m25p64";
-				spi-max-frequency = <30000000>;
-				m25p,fast-read;
-				reg = <0>;
-				partition@0 {
-					label = "U-Boot-SPL";
-					reg = <0x00000000 0x00010000>;
-					read-only;
-				};
-				partition@1 {
-					label = "U-Boot";
-					reg = <0x00010000 0x00080000>;
-					read-only;
-				};
-				partition@2 {
-					label = "U-Boot-Env";
-					reg = <0x00090000 0x00010000>;
-					read-only;
-				};
-				partition@3 {
-					label = "Kernel";
-					reg = <0x000a0000 0x00280000>;
-				};
-				partition@4 {
-					label = "Filesystem";
-					reg = <0x00320000 0x00400000>;
-				};
-				partition@5 {
-					label = "MAC-Address";
-					reg = <0x007f0000 0x00010000>;
-					read-only;
-				};
-			};
-		};
-		mdio: mdio@224000 {
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&mdio_pins>;
-			bus_freq = <2200000>;
-		};
-		eth0: ethernet@220000 {
-			status = "okay";
-			pinctrl-names = "default";
-			pinctrl-0 = <&mii_pins>;
-		};
-		gpio: gpio@226000 {
-			status = "okay";
-		};
-	};
-
 	backlight {
 		compatible = "gpio-backlight";
 		enable-gpios = <&gpio 48 GPIO_ACTIVE_HIGH>;
@@ -257,61 +117,207 @@
 	};
 };
 
-/include/ "tps6507x.dtsi"
+&pmx_core {
+	status = "okay";
 
-&tps {
-	vdcdc1_2-supply = <&vbat>;
-	vdcdc3-supply = <&vbat>;
-	vldo1_2-supply = <&vbat>;
+	mcasp0_pins: pinmux_mcasp0_pins {
+		pinctrl-single,bits = <
+			/*
+			 * AHCLKX, ACLKX, AFSX, AHCLKR, ACLKR,
+			 * AFSR, AMUTE
+			 */
+			0x00 0x11111111 0xffffffff
+			/* AXR11, AXR12 */
+			0x04 0x00011000 0x000ff000
+		>;
+	};
 
-	regulators {
-		vdcdc1_reg: regulator@0 {
-			regulator-name = "VDCDC1_3.3V";
-			regulator-min-microvolt = <3150000>;
-			regulator-max-microvolt = <3450000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+	nand_pins: nand_pins {
+		pinctrl-single,bits = <
+			/* EMA_WAIT[0], EMA_OE, EMA_WE, EMA_CS[4], EMA_CS[3] */
+			0x1c 0x10110110  0xf0ff0ff0
+			/*
+			 * EMA_D[0], EMA_D[1], EMA_D[2],
+			 * EMA_D[3], EMA_D[4], EMA_D[5],
+			 * EMA_D[6], EMA_D[7]
+			 */
+			0x24 0x11111111  0xffffffff
+			/* EMA_A[1], EMA_A[2] */
+			0x30 0x01100000  0x0ff00000
+		>;
+	};
+};
 
-		vdcdc2_reg: regulator@1 {
-			regulator-name = "VDCDC2_3.3V";
-			regulator-min-microvolt = <1710000>;
-			regulator-max-microvolt = <3450000>;
-			regulator-always-on;
-			regulator-boot-on;
-			ti,defdcdc_default = <1>;
-		};
+&serial0 {
+	status = "okay";
+};
 
-		vdcdc3_reg: regulator@2 {
-			regulator-name = "VDCDC3_1.2V";
-			regulator-min-microvolt = <950000>;
-			regulator-max-microvolt = <1350000>;
-			regulator-always-on;
-			regulator-boot-on;
-			ti,defdcdc_default = <1>;
-		};
+&serial1 {
+	status = "okay";
+};
 
-		ldo1_reg: regulator@3 {
-			regulator-name = "LDO1_1.8V";
-			regulator-min-microvolt = <1710000>;
-			regulator-max-microvolt = <1890000>;
-			regulator-always-on;
-			regulator-boot-on;
-		};
+&serial2 {
+	status = "okay";
+};
+
+&rtc0 {
+	status = "okay";
+};
 
-		ldo2_reg: regulator@4 {
-			regulator-name = "LDO2_1.2V";
-			regulator-min-microvolt = <1140000>;
-			regulator-max-microvolt = <1320000>;
-			regulator-always-on;
-			regulator-boot-on;
+&i2c0 {
+	status = "okay";
+	clock-frequency = <100000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0_pins>;
+
+	tps: tps@48 {
+		reg = <0x48>;
+	};
+
+	tlv320aic3106: tlv320aic3106@18 {
+		#sound-dai-cells = <0>;
+		compatible = "ti,tlv320aic3106";
+		reg = <0x18>;
+		status = "okay";
+
+		/* Regulators */
+		IOVDD-supply = <&vdcdc2_reg>;
+		/* Derived from VBAT: Baseboard 3.3V / 1.8V */
+		AVDD-supply = <&vbat>;
+		DRVDD-supply = <&vbat>;
+		DVDD-supply = <&vbat>;
+	};
+
+	tca6416: gpio@20 {
+		compatible = "ti,tca6416";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&wdt {
+	status = "okay";
+};
+
+&mmc0 {
+	max-frequency = <50000000>;
+	bus-width = <4>;
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	cd-gpios = <&gpio 64 GPIO_ACTIVE_LOW>;
+	wp-gpios = <&gpio 65 GPIO_ACTIVE_HIGH>;
+};
+
+&spi1 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins &spi1_cs0_pin>;
+	flash: m25p80@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "m25p64";
+		spi-max-frequency = <30000000>;
+		m25p,fast-read;
+		reg = <0>;
+		partition@0 {
+			label = "U-Boot-SPL";
+			reg = <0x00000000 0x00010000>;
+			read-only;
+		};
+		partition@1 {
+			label = "U-Boot";
+			reg = <0x00010000 0x00080000>;
+			read-only;
+		};
+		partition@2 {
+			label = "U-Boot-Env";
+			reg = <0x00090000 0x00010000>;
+			read-only;
+		};
+		partition@3 {
+			label = "Kernel";
+			reg = <0x000a0000 0x00280000>;
+		};
+		partition@4 {
+			label = "Filesystem";
+			reg = <0x00320000 0x00400000>;
+		};
+		partition@5 {
+			label = "MAC-Address";
+			reg = <0x007f0000 0x00010000>;
+			read-only;
 		};
 	};
+};
+
+&mdio {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mdio_pins>;
+	bus_freq = <2200000>;
+};
+&eth0 {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mii_pins>;
+};
+
+/include/ "tps6507x.dtsi"
+
+&tps {
+	vdcdc1_2-supply = <&vbat>;
+	vdcdc3-supply = <&vbat>;
+	vldo1_2-supply = <&vbat>;
+};
+
+&vdcdc1_reg {
+	regulator-name = "VDCDC1_3.3V";
+	regulator-min-microvolt = <3150000>;
+	regulator-max-microvolt = <3450000>;
+	regulator-always-on;
+	regulator-boot-on;
+
 	touchscreen {
 		ti,min-pressure = <0x30>;
 	};
 };
 
+&vdcdc2_reg {
+	regulator-name = "VDCDC2_3.3V";
+	regulator-min-microvolt = <1710000>;
+	regulator-max-microvolt = <3450000>;
+	regulator-always-on;
+	regulator-boot-on;
+	ti,defdcdc_default = <1>;
+};
+
+&vdcdc3_reg {
+	regulator-name = "VDCDC3_1.2V";
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <1350000>;
+	regulator-always-on;
+	regulator-boot-on;
+	ti,defdcdc_default = <1>;
+};
+
+&ldo1_reg {
+	regulator-name = "LDO1_1.8V";
+	regulator-min-microvolt = <1710000>;
+	regulator-max-microvolt = <1890000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
+&ldo2_reg {
+	regulator-name = "LDO2_1.2V";
+	regulator-min-microvolt = <1140000>;
+	regulator-max-microvolt = <1320000>;
+	regulator-always-on;
+	regulator-boot-on;
+};
+
 &gpio {
 	status = "okay";
 };
-- 
2.17.0
