From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 5/5] ARM: dts: zynq: Add USB for Parallella
Date: Thu, 12 Feb 2015 01:55:13 +0100
Message-ID: <1423702513-4032-6-git-send-email-afaerber@suse.de>
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

The Microserver edition does not feature USB - only the Kickstarter,
pre-order, Desktop and Embedded editions.

Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 arch/arm/boot/dts/zynq-parallella.dts   | 16 +++++++
 arch/arm/boot/dts/zynq-parallella1.dtsi | 74 +++++++++++++++++++++++++=
++++++++
 2 files changed, 90 insertions(+)

diff --git a/arch/arm/boot/dts/zynq-parallella.dts b/arch/arm/boot/dts/=
zynq-parallella.dts
index 99ee6551ae8d..b2eede1c708f 100644
--- a/arch/arm/boot/dts/zynq-parallella.dts
+++ b/arch/arm/boot/dts/zynq-parallella.dts
@@ -17,3 +17,19 @@
 / {
 	model =3D "Adapteva Parallella Board";
 };
+
+&usb_phy0 {
+	status =3D "okay";
+};
+
+&usb_phy1 {
+	status =3D "okay";
+};
+
+&usb0 {
+	status =3D "okay";
+};
+
+&usb1 {
+	status =3D "okay";
+};
diff --git a/arch/arm/boot/dts/zynq-parallella1.dtsi b/arch/arm/boot/dt=
s/zynq-parallella1.dtsi
index 8b2895c06c8e..1395aaadf3be 100644
--- a/arch/arm/boot/dts/zynq-parallella1.dtsi
+++ b/arch/arm/boot/dts/zynq-parallella1.dtsi
@@ -47,6 +47,18 @@
 			default-state =3D "on";
 		};
 	};
+
+	usb_phy0: phy0 {
+		compatible =3D "usb-nop-xceiv";
+		#phy-cells =3D <0>;
+		status =3D "disabled";
+	};
+
+	usb_phy1: phy1 {
+		compatible =3D "usb-nop-xceiv";
+		#phy-cells =3D <0>;
+		status =3D "disabled";
+	};
 };
=20
 &clkc {
@@ -208,6 +220,54 @@
 			bias-disable =3D <0>;
 		};
 	};
+
+	pinctrl_usb0_default: usb0-default {
+		mux {
+			function =3D "usb0";
+			groups =3D "usb0_0_grp";
+		};
+
+		conf {
+			groups =3D "usb0_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO29", "MIO31", "MIO36";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO28", "MIO30", "MIO32", "MIO33", "MIO34",
+			       "MIO35", "MIO37", "MIO38", "MIO39";
+			bias-disable;
+		};
+	};
+
+	pinctrl_usb1_default: usb1-default {
+		mux {
+			function =3D "usb1";
+			groups =3D "usb1_0_grp";
+		};
+
+		conf {
+			groups =3D "usb1_0_grp";
+			slew-rate =3D <0>;
+			io-standard =3D <1>;
+		};
+
+		conf-rx {
+			pins =3D "MIO41", "MIO43", "MIO48";
+			bias-high-impedance;
+		};
+
+		conf-tx {
+			pins =3D "MIO40", "MIO42", "MIO44", "MIO45", "MIO46",
+			       "MIO47", "MIO49", "MIO50", "MIO51";
+			bias-disable;
+		};
+	};
 };
=20
 &sdhci1 {
@@ -221,3 +281,17 @@
 	pinctrl-names =3D "default";
 	pinctrl-0 =3D <&pinctrl_uart1_default>;
 };
+
+&usb0 {
+	dr_mode =3D "host";
+	usb-phy =3D <&usb_phy0>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usb0_default>;
+};
+
+&usb1 {
+	dr_mode =3D "peripheral";
+	usb-phy =3D <&usb_phy1>;
+	pinctrl-names =3D "default";
+	pinctrl-0 =3D <&pinctrl_usb1_default>;
+};
--=20
2.2.2
