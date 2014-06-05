From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 8/9] ARM: dts: berlin: add BG2Q nodes for USB support
Date: Thu,  5 Jun 2014 17:48:45 +0200
Message-ID: <1401983326-19205-9-git-send-email-antoine.tenart@free-electrons.com>
References: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401983326-19205-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, Peter.Chen@freescale.com, balbi@ti.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adds nodes describing the Marvell Berlin BG2Q USB PHY and USB. The BG2Q
SoC has 3 USB host controller, compatible with ChipIdea.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 51 +++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index b74e5ec66354..a6902ea5580c 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -87,6 +87,39 @@
 			#interrupt-cells =3D <3>;
 		};
=20
+		usb_phy2: usbphy@a2f400 {
+			compatible =3D "marvell,berlin-usbphy";
+			reg =3D <0xa2f400 0x128>;
+			#phy-cells =3D <0>;
+			resets =3D <&chip 14>;
+			status =3D "disabled";
+		};
+
+		usb2: usb@a30000 {
+			compatible =3D "marvell,berlin-usb";
+			reg =3D <0xa30000 0x10000>;
+			interrupts =3D <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_USB2>;
+			marvell,usbphy =3D <&usb_phy2>;
+			status =3D "disabled";
+		};
+
+		usb_phy0: usbphy@b74000 {
+			compatible =3D "marvell,berlin-usbphy";
+			reg =3D <0xb74000 0x128>;
+			#phy-cells =3D <0>;
+			resets =3D <&chip 12>;
+			status =3D "disabled";
+		};
+
+		usb_phy1: usbphy@b78000 {
+			compatible =3D "marvell,berlin-usbphy";
+			reg =3D <0xb78000 0x128>;
+			#phy-cells =3D <0>;
+			resets =3D <&chip 13>;
+			status =3D "disabled";
+		};
+
 		apb@e80000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -280,6 +313,24 @@
 			clock-names =3D "refclk";
 		};
=20
+		usb0: usb@ed0000 {
+			compatible =3D "marvell,berlin-usb";
+			reg =3D <0xed0000 0x10000>;
+			interrupts =3D <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_USB0>;
+			marvell,usbphy =3D <&usb_phy0>;
+			status =3D "disabled";
+		};
+
+		usb1: usb@ee0000 {
+			compatible =3D "marvell,berlin-usb";
+			reg =3D <0xee0000 0x10000>;
+			interrupts =3D <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
+			clocks =3D <&chip CLKID_USB1>;
+			marvell,usbphy =3D <&usb_phy1>;
+			status =3D "disabled";
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
--=20
1.9.1
