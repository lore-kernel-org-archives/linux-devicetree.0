From: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 6/7] ARM: zynq: DT: Add pinctrl information
Date: Fri,  9 Jan 2015 07:43:50 -0800
Message-ID: <1420818231-13451-7-git-send-email-soren.brinkmann@xilinx.com>
References: <1420818231-13451-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420818231-13451-1-git-send-email-soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Alessandro Rubini <rubini-9wsNiZum9E8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sh-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "Ivan T. Ivanov" <iivanov-NEYub+7Iv8PQT0dZR+AlfA@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Beniamino Galvani <b.galvani-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Add pinctrl descriptions to the zc702 and zc706 device trees.

Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Tested-by: Andreas F=C3=A4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
---
Changes since v1:
 - remove 'pinctrl-' prefix for pinctrl sub-nodes
 - separate config and mux nodes

Changes since RFC v2:
 - add pinconf properties to zc702 mdio node
 - remove arguments from bias-related props

Changes since RFC v1:
 - separate DT changes into their own patch
---
 arch/arm/boot/dts/zynq-7000.dtsi |   8 +-
 arch/arm/boot/dts/zynq-zc702.dts | 181 +++++++++++++++++++++++++++++++=
++++++++
 arch/arm/boot/dts/zynq-zc706.dts | 152 +++++++++++++++++++++++++++++++=
+
 3 files changed, 340 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/zynq-7000.dtsi b/arch/arm/boot/dts/zynq-=
7000.dtsi
index ee3e5d675b05..9a19a319b0f1 100644
--- a/arch/arm/boot/dts/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/zynq-7000.dtsi
@@ -237,7 +237,7 @@
 		slcr: slcr@f8000000 {
 			#address-cells =3D <1>;
 			#size-cells =3D <1>;
-			compatible =3D "xlnx,zynq-slcr", "syscon";
+			compatible =3D "xlnx,zynq-slcr", "syscon", "simple-bus";
 			reg =3D <0xF8000000 0x1000>;
 			ranges;
 			clkc: clkc@100 {
@@ -257,6 +257,12 @@
 						"dbg_trc", "dbg_apb";
 				reg =3D <0x100 0x100>;
 			};
+
+			pinctrl0: pinctrl@700 {
+				compatible =3D "xlnx,pinctrl-zynq";
+				reg =3D <0x700 0x200>;
+				syscon =3D <&slcr>;
+			};
 		};
=20
 		dmac_s: dmac@f8003000 {
diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-=
zc702.dts
index 280f02dd4ddc..4995412f116f 100644
--- a/arch/arm/boot/dts/zynq-zc702.dts
+++ b/arch/arm/boot/dts/zynq-zc702.dts
@@ -40,6 +40,8 @@
=20
 &can0 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_can0_default>;
 };
=20
 &clkc {
@@ -50,15 +52,24 @@
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
 	phy-handle =3D <&ethernet_phy>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gem0_default>;
=20
 	ethernet_phy: ethernet-phy@7 {
 		reg =3D <7>;
 	};
 };
=20
+&gpio0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gpio0_default>;
+};
+
 &i2c0 {
 	status =3D "okay";
 	clock-frequency =3D <400000>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c0_default>;
=20
 	i2cswitch@74 {
 		compatible =3D "nxp,pca9548";
@@ -132,10 +143,180 @@
 	};
 };
=20
+&pinctrl0 {
+	pinctrl_can0_default: can0-default {
+		mux {
+			function =3D "can0";
+			groups =3D "can0_9_grp";
+		};
+
+		conf {
+			groups =3D "can0_9_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO46";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO47";
+			bias-disable;
+		};
+	};
+
+	pinctrl_gem0_default: gem0-default {
+		mux {
+			function =3D "ethernet0";
+			groups =3D "ethernet0_0_grp";
+		};
+
+		conf {
+			groups =3D "ethernet0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <4>;
+		};
+
+		conf-rx {
+			pins =3D "MIO22", "MIO23", "MIO24", "MIO25", "MIO26", "MIO27";
+			bias-high-impedance;
+			low-power-disable;
+		};
+
+		conf-tx {
+			pins =3D "MIO16", "MIO17", "MIO18", "MIO19", "MIO20", "MIO21";
+			bias-disable;
+			low-power-enable;
+		};
+
+		mux-mdio {
+			function =3D "mdio0";
+			groups =3D "mdio0_0_grp";
+		};
+
+		conf-mdio {
+			groups =3D "mdio0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio0_default: gpio0-default {
+		mux {
+			function =3D "gpio0";
+			groups =3D "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
+				 "gpio0_13_grp", "gpio0_14_grp";
+		};
+
+		conf {
+			groups =3D "gpio0_7_grp", "gpio0_8_grp", "gpio0_9_grp",
+				 "gpio0_10_grp", "gpio0_11_grp", "gpio0_12_grp",
+				 "gpio0_13_grp", "gpio0_14_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-pull-up {
+			pins =3D "MIO9", "MIO10", "MIO11", "MIO12", "MIO13", "MIO14";
+			bias-pull-up;
+		};
+
+		conf-pull-none {
+			pins =3D "MIO7", "MIO8";
+			bias-disable;
+		};
+	};
+
+	pinctrl_i2c0_default: i2c0-default {
+		mux {
+			groups =3D "i2c0_10_grp";
+			function =3D "i2c0";
+		};
+
+		conf {
+			groups =3D "i2c0_10_grp";
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups =3D "sdio0_2_grp";
+			function =3D "sdio0";
+		};
+
+		conf {
+			groups =3D "sdio0_2_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+			bias-disable;
+		};
+
+		mux-cd {
+			groups =3D "gpio0_0_grp";
+			function =3D "sdio0_cd";
+		};
+
+		conf-cd {
+			groups =3D "gpio0_0_grp";
+			bias-high-impedance;
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		mux-wp {
+			groups =3D "gpio0_15_grp";
+			function =3D "sdio0_wp";
+		};
+
+		conf-wp {
+			groups =3D "gpio0_15_grp";
+			bias-high-impedance;
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+	};
+
+	pinctrl_uart1_default: uart1-default {
+		mux {
+			groups =3D "uart1_10_grp";
+			function =3D "uart1";
+		};
+
+		conf {
+			groups =3D "uart1_10_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO49";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO48";
+			bias-disable =3D <0>;
+		};
+	};
+};
+
 &sdhci0 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sdhci0_default>;
 };
=20
 &uart1 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1_default>;
 };
diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-=
zc706.dts
index 34f7812d2ee8..af590d2bb046 100644
--- a/arch/arm/boot/dts/zynq-zc706.dts
+++ b/arch/arm/boot/dts/zynq-zc706.dts
@@ -37,15 +37,24 @@
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
 	phy-handle =3D <&ethernet_phy>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gem0_default>;
=20
 	ethernet_phy: ethernet-phy@7 {
 		reg =3D <7>;
 	};
 };
=20
+&gpio0 {
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gpio0_default>;
+};
+
 &i2c0 {
 	status =3D "okay";
 	clock-frequency =3D <400000>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_i2c0_default>;
=20
 	i2cswitch@74 {
 		compatible =3D "nxp,pca9548";
@@ -111,10 +120,153 @@
 	};
 };
=20
+&pinctrl0 {
+	pinctrl_gem0_default: gem0-default {
+		mux {
+			function =3D "ethernet0";
+			groups =3D "ethernet0_0_grp";
+		};
+
+		conf {
+			groups =3D "ethernet0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <4>;
+		};
+
+		conf-rx {
+			pins =3D "MIO22", "MIO23", "MIO24", "MIO25", "MIO26", "MIO27";
+			bias-high-impedance;
+			low-power-disable;
+		};
+
+		conf-tx {
+			pins =3D "MIO16", "MIO17", "MIO18", "MIO19", "MIO20", "MIO21";
+			low-power-enable;
+			bias-disable;
+		};
+
+		mux-mdio {
+			function =3D "mdio0";
+			groups =3D "mdio0_0_grp";
+		};
+
+		conf-mdio {
+			groups =3D "mdio0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+			bias-disable;
+		};
+	};
+
+	pinctrl_gpio0_default: gpio0-default {
+		mux {
+			function =3D "gpio0";
+			groups =3D "gpio0_7_grp", "gpio0_46_grp", "gpio0_47_grp";
+		};
+
+		conf {
+			groups =3D "gpio0_7_grp", "gpio0_46_grp", "gpio0_47_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-pull-up {
+			pins =3D "MIO46", "MIO47";
+			bias-pull-up;
+		};
+
+		conf-pull-none {
+			pins =3D "MIO7";
+			bias-disable;
+		};
+	};
+
+	pinctrl_i2c0_default: i2c0-default {
+		mux {
+			groups =3D "i2c0_10_grp";
+			function =3D "i2c0";
+		};
+
+		conf {
+			groups =3D "i2c0_10_grp";
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+	};
+
+	pinctrl_sdhci0_default: sdhci0-default {
+		mux {
+			groups =3D "sdio0_2_grp";
+			function =3D "sdio0";
+		};
+
+		conf {
+			groups =3D "sdio0_2_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+			bias-disable;
+		};
+
+		mux-cd {
+			groups =3D "gpio0_14_grp";
+			function =3D "sdio0_cd";
+		};
+
+		conf-cd {
+			groups =3D "gpio0_14_grp";
+			bias-high-impedance;
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		mux-wp {
+			groups =3D "gpio0_15_grp";
+			function =3D "sdio0_wp";
+		};
+
+		conf-wp {
+			groups =3D "gpio0_15_grp";
+			bias-high-impedance;
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+	};
+
+	pinctrl_uart1_default: uart1-default {
+		mux {
+			groups =3D "uart1_10_grp";
+			function =3D "uart1";
+		};
+
+		conf {
+			groups =3D "uart1_10_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO49";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO48";
+			bias-disable;
+		};
+	};
+};
+
 &sdhci0 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sdhci0_default>;
 };
=20
 &uart1 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1_default>;
 };
--=20
2.2.1.1.gb42cc81

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
