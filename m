From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH v4 4/8] arm64: dts: rockchip: Add GeekBox config
Date: Wed, 16 Mar 2016 14:58:42 +0100
Message-ID: <1458136727-32075-5-git-send-email-afaerber@suse.de>
References: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458136727-32075-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

The GeekBox contains an MXM3 module with a Rockchip RK3368 SoC.
Some connectors are available directly on the module.

This adds initial support, namely serial, USB, GMAC, eMMC, IR and TSADC=
=2E

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 v3 -> v4:
 * Renamed /memory node to resolve dtc warning
=20
 v2 -> v3:
 * Squashed GMAC, eMMC, IR, TSADC (Heiko)
 * Fixed IR pinctrl pull setting (Julien)
 * Changed TSADC polarity (rebooted immediately due to fixed otp-out pi=
n)
=20
 v1 -> v2:
 * Dropped rk3368-geekbox.dtsi. rk3368-geekbox-landingship.dts can
   #include "rk3368-geekbox.dts" just fine, when leaving out /dts-v1/;.
 * Revisited always-on / boot-on for PMIC regulator nodes. (Heiko)
 * Switched pmic-sleep from RK_FUNC_GPIO to RK_FUNC_2. (schematics)
=20
 arch/arm64/boot/dts/rockchip/Makefile           |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts | 299 ++++++++++++++++=
++++++++
 2 files changed, 300 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
index e3f0b5f4ba4e..df37865e8ced 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -1,4 +1,5 @@
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-evb-act8846.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-geekbox.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) +=3D rk3368-r88.dtb
=20
 always		:=3D $(dtb-y)
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts b/arch/arm=
64/boot/dts/rockchip/rk3368-geekbox.dts
new file mode 100644
index 000000000000..cef4c12bda48
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -0,0 +1,299 @@
+/*
+ * Copyright (c) 2016 Andreas F=C3=A4rber
+ *
+ * This file is dual-licensed: you can use it either under the terms
+ * of the GPL or the X11 license, at your option. Note that this dual
+ * licensing only applies to this file, and not this project as a
+ * whole.
+ *
+ *  a) This file is free software; you can redistribute it and/or
+ *     modify it under the terms of the GNU General Public License as
+ *     published by the Free Software Foundation; either version 2 of =
the
+ *     License, or (at your option) any later version.
+ *
+ *     This file is distributed in the hope that it will be useful,
+ *     but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *     MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *     GNU General Public License for more details.
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
+#include "rk3368.dtsi"
+
+/ {
+	model =3D "GeekBox";
+	compatible =3D "geekbuying,geekbox", "rockchip,rk3368";
+
+	chosen {
+		stdout-path =3D "serial2:115200n8";
+	};
+
+	memory@0 {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x80000000>;
+	};
+
+	ext_gmac: gmac-clk {
+		compatible =3D "fixed-clock";
+		clock-frequency =3D <125000000>;
+		clock-output-names =3D "ext_gmac";
+		#clock-cells =3D <0>;
+	};
+
+	ir: ir-receiver {
+		compatible =3D "gpio-ir-receiver";
+		gpios =3D <&gpio3 30 GPIO_ACTIVE_LOW>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&ir_int>;
+	};
+
+	leds: gpio-leds {
+		compatible =3D "gpio-leds";
+
+		blue {
+			gpios =3D <&gpio2 2 GPIO_ACTIVE_HIGH>;
+			label =3D "geekbox:blue:led";
+			default-state =3D "on";
+		};
+
+		red {
+			gpios =3D <&gpio2 3 GPIO_ACTIVE_HIGH>;
+			label =3D "geekbox:red:led";
+			default-state =3D "off";
+		};
+	};
+
+	vcc_sys: vcc-sys-regulator {
+		compatible =3D "regulator-fixed";
+		regulator-name =3D "vcc_sys";
+		regulator-min-microvolt =3D <5000000>;
+		regulator-max-microvolt =3D <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&emmc {
+	status =3D "okay";
+	bus-width =3D <8>;
+	cap-mmc-highspeed;
+	clock-frequency =3D <150000000>;
+	disable-wp;
+	keep-power-in-suspend;
+	non-removable;
+	num-slots =3D <1>;
+	vmmc-supply =3D <&vcc_io>;
+	vqmmc-supply =3D <&vcc18_flash>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&emmc_clk>, <&emmc_cmd>, <&emmc_bus8>;
+};
+
+&gmac {
+	status =3D "okay";
+	phy-supply =3D <&vcc_lan>;
+	phy-mode =3D "rgmii";
+	clock_in_out =3D "input";
+	assigned-clocks =3D <&cru SCLK_MAC>;
+	assigned-clock-parents =3D <&ext_gmac>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&rgmii_pins>;
+	tx_delay =3D <0x30>;
+	rx_delay =3D <0x10>;
+};
+
+&i2c0 {
+	status =3D "okay";
+
+	rk808: pmic@1b {
+		compatible =3D "rockchip,rk808";
+		reg =3D <0x1b>;
+		pinctrl-names =3D "default";
+		pinctrl-0 =3D <&pmic_int>, <&pmic_sleep>;
+		interrupt-parent =3D <&gpio0>;
+		interrupts =3D <5 IRQ_TYPE_LEVEL_LOW>;
+		rockchip,system-power-controller;
+		vcc1-supply =3D <&vcc_sys>;
+		vcc2-supply =3D <&vcc_sys>;
+		vcc3-supply =3D <&vcc_sys>;
+		vcc4-supply =3D <&vcc_sys>;
+		vcc6-supply =3D <&vcc_sys>;
+		vcc7-supply =3D <&vcc_sys>;
+		vcc8-supply =3D <&vcc_io>;
+		vcc9-supply =3D <&vcc_sys>;
+		vcc10-supply =3D <&vcc_sys>;
+		vcc11-supply =3D <&vcc_sys>;
+		vcc12-supply =3D <&vcc_io>;
+		clock-output-names =3D "xin32k", "rk808-clkout2";
+		#clock-cells =3D <1>;
+
+		regulators {
+			vdd_cpu: DCDC_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <700000>;
+				regulator-max-microvolt =3D <1500000>;
+				regulator-name =3D "vdd_cpu";
+			};
+
+			vdd_log: DCDC_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <700000>;
+				regulator-max-microvolt =3D <1500000>;
+				regulator-name =3D "vdd_log";
+			};
+
+			vcc_ddr: DCDC_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name =3D "vcc_ddr";
+			};
+
+			vcc_io: DCDC_REG4 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc_io";
+			};
+
+			vcc18_flash: LDO_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc18_flash";
+			};
+
+			vcc33_lcd: LDO_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <3300000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vcc33_lcd";
+			};
+
+			vdd_10: LDO_REG3 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-name =3D "vdd_10";
+			};
+
+			vcca_18: LDO_REG4 {
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcca_18";
+			};
+
+			vccio_sd: LDO_REG5 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <3300000>;
+				regulator-name =3D "vccio_sd";
+			};
+
+			vdd10_lcd: LDO_REG6 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1000000>;
+				regulator-max-microvolt =3D <1000000>;
+				regulator-name =3D "vdd10_lcd";
+			};
+
+			vcc_18: LDO_REG7 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc_18";
+			};
+
+			vcc18_lcd: LDO_REG8 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt =3D <1800000>;
+				regulator-max-microvolt =3D <1800000>;
+				regulator-name =3D "vcc18_lcd";
+			};
+
+			vcc_sd: SWITCH_REG1 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name =3D "vcc_sd";
+			};
+
+			vcc_lan: SWITCH_REG2 {
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-name =3D "vcc_lan";
+			};
+		};
+	};
+};
+
+&pinctrl {
+	ir {
+		ir_int: ir-int {
+			rockchip,pins =3D <3 30 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pmic {
+		pmic_sleep: pmic-sleep {
+			rockchip,pins =3D <0 0 RK_FUNC_2 &pcfg_pull_none>;
+		};
+
+		pmic_int: pmic-int {
+			rockchip,pins =3D <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+};
+
+&tsadc {
+	status =3D "okay";
+	rockchip,hw-tshut-mode =3D <0>; /* CRU */
+	rockchip,hw-tshut-polarity =3D <1>; /* high */
+};
+
+&uart2 {
+	status =3D "okay";
+};
+
+&usb_host0_ehci {
+	status =3D "okay";
+};
+
+&usb_otg {
+	status =3D "okay";
+};
+
+&wdt {
+	status =3D "okay";
+};
--=20
2.6.2
