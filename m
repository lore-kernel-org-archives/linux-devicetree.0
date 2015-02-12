From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 2/5] ARM: dts: zynq: Add pinctrl to Parallella
Date: Thu, 12 Feb 2015 01:55:10 +0100
Message-ID: <1423702513-4032-3-git-send-email-afaerber@suse.de>
References: <1423702513-4032-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1423702513-4032-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>
Cc: Olof Johansson <olof@lixom.net>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-arm-kernel@lists.infradead.org, Andreas Olofsson <andreas@adapteva.com>, Ola Jeppsson <ola@adapteva.com>, Matteo Vit <matteo.vit@starwaredesign.com>, Sean Rickerd <srickerd@suse.com>, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/zynq-parallella1.dtsi | 118 ++++++++++++++++++++++++=
++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella1.dtsi b/arch/arm/boot/dt=
s/zynq-parallella1.dtsi
index 7c1206f928bc..e77a4968fe17 100644
--- a/arch/arm/boot/dts/zynq-parallella1.dtsi
+++ b/arch/arm/boot/dts/zynq-parallella1.dtsi
@@ -47,6 +47,8 @@
 	status =3D "okay";
 	phy-mode =3D "rgmii-id";
 	phy-handle =3D <&ethernet_phy>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_gem0_default>;
=20
 	ethernet_phy: ethernet-phy@0 {
 		/* Marvell 88E1318 */
@@ -58,6 +60,11 @@
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
=20
@@ -85,10 +92,121 @@
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
+			io-standard =3D <1>;
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
+			groups =3D "gpio0_7_grp";
+		};
+
+		conf {
+			groups =3D "gpio0_7_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <3>;
+		};
+
+		conf-pull-up {
+			pins =3D "MIO7";
+			bias-pull-up;
+		};
+	};
+
+	pinctrl_sdhci1_default: sdhci1-default {
+		mux {
+			function =3D "sdio1";
+			groups =3D "sdio1_0_grp";
+		};
+
+		conf {
+			groups =3D "sdio1_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+			bias-disable;
+		};
+
+		mux-cd {
+			function =3D "sdio1_cd";
+			groups =3D "gpio0_0_grp";
+		};
+
+		conf-cd {
+			groups =3D "gpio0_0_grp";
+			bias-high-impedance;
+			bias-pull-up;
+			slew-rate =3D <0>;
+			io-standard =3D <3>;
+		};
+	};
+
+	pinctrl_uart1_default: uart1-default {
+		mux {
+			function =3D "uart1";
+			groups =3D "uart1_0_grp";
+		};
+
+		conf {
+			groups =3D "uart1_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <3>;
+		};
+
+		conf-rx {
+			pins =3D "MIO9";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO8";
+			bias-disable =3D <0>;
+		};
+	};
+};
+
 &sdhci1 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_sdhci1_default>;
 };
=20
 &uart1 {
 	status =3D "okay";
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_uart1_default>;
 };
--=20
2.2.2
