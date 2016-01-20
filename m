From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: [PATCH] ARM64: dts: rockchip: Add GeekBox config
Date: Wed, 20 Jan 2016 17:38:33 +0100
Message-ID: <1453307913-8907-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "moderated list:ARM64 PORT" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The GeekBox contains an MXM3 module with a Rockchip RK3368 SoC.
Some connectors are available directly on the module.

This adds initial support, namely serial, PMIC and USB.

Signed-off-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
 Hi Heiko,
=20
 Here's an initial shot at a .dts for GeekBox.
 GMAC was not yet working for me.
=20
 Regards,
 Andreas

 arch/arm64/boot/dts/rockchip/Makefile            |   1 +
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts  |  48 +++++
 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi | 242 +++++++++++++++=
++++++++
 3 files changed, 291 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dt=
s/rockchip/Makefile
index e3f0b5f..df37865 100644
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
index 0000000..eb24ecd
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dts
@@ -0,0 +1,48 @@
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
+#include "rk3368-geekbox.dtsi"
+
+/ {
+	model =3D "GeekBox";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi b/arch/ar=
m64/boot/dts/rockchip/rk3368-geekbox.dtsi
new file mode 100644
index 0000000..f083cdb
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtsi
@@ -0,0 +1,242 @@
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
+#include "rk3368.dtsi"
+
+/ {
+	compatible =3D "geekbuying,geekbox", "rockchip,rk3368";
+
+	chosen {
+		stdout-path =3D "serial2:115200n8";
+	};
+
+	memory {
+		device_type =3D "memory";
+		reg =3D <0x0 0x0 0x0 0x80000000>;
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
+	pmic {
+		pmic_sleep: pmic-sleep {
+			rockchip,pins =3D <0 0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		pmic_int: pmic-int {
+			rockchip,pins =3D <0 5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
