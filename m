From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 1/2] ARM: dts: berlin: add I2C nodes for BG2Q
Date: Tue,  3 Jun 2014 09:33:09 +0200
Message-ID: <1401780790-17830-2-git-send-email-antoine.tenart@free-electrons.com>
References: <1401780790-17830-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1401780790-17830-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Marvell Berlin BG2Q has 4 TWSI compatible with the Synopsys
DesignWare I2C driver. Add the corresponding nodes.

The pin-muxing setup is also done here, since there cannot be another
muxing setup if I2C{0,1,2,3} are enabled.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 72 +++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index 635a16a64cb4..0624868e36e3 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -191,6 +191,32 @@
 				};
 			};
=20
+			i2c0: i2c@1400 {
+				compatible =3D "snps,designware-i2c";
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <0x1400 0x100>;
+				interrupt-parent =3D <&aic>;
+				interrupts =3D <4>;
+				clocks =3D <&chip CLKID_CFG>;
+				pinctrl-0 =3D <&twsi0_pmux>;
+				pinctrl-names =3D "default";
+				status =3D "disabled";
+			};
+
+			i2c1: i2c@1800 {
+				compatible =3D "snps,designware-i2c";
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <0x1800 0x100>;
+				interrupt-parent =3D <&aic>;
+				interrupts =3D <5>;
+				clocks =3D <&chip CLKID_CFG>;
+				pinctrl-0 =3D <&twsi1_pmux>;
+				pinctrl-names =3D "default";
+				status =3D "disabled";
+			};
+
 			timer0: timer@2c00 {
 				compatible =3D "snps,dw-apb-timer";
 				reg =3D <0x2c00 0x14>;
@@ -301,6 +327,16 @@
 			reg =3D <0xea0000 0x400>, <0xdd0170 0x10>;
 			clocks =3D <&refclk>;
 			clock-names =3D "refclk";
+
+			twsi0_pmux: twsi0-pmux {
+				groups =3D "G6";
+				function =3D "twsi0";
+			};
+
+			twsi1_pmux: twsi1-pmux {
+				groups =3D "G7";
+				function =3D "twsi1";
+			};
 		};
=20
 		apb@fc0000 {
@@ -311,6 +347,32 @@
 			ranges =3D <0 0xfc0000 0x10000>;
 			interrupt-parent =3D <&sic>;
=20
+			i2c2: i2c@7000 {
+				compatible =3D "snps,designware-i2c";
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <0x7000 0x100>;
+				interrupt-parent =3D <&sic>;
+				interrupts =3D <6>;
+				clocks =3D <&refclk>;
+				pinctrl-0 =3D <&twsi2_pmux>;
+				pinctrl-names =3D "default";
+				status =3D "disabled";
+			};
+
+			i2c3: i2c@8000 {
+				compatible =3D "snps,designware-i2c";
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+				reg =3D <0x8000 0x100>;
+				interrupt-parent =3D <&sic>;
+				interrupts =3D <7>;
+				clocks =3D <&refclk>;
+				pinctrl-0 =3D <&twsi3_pmux>;
+				pinctrl-names =3D "default";
+				status =3D "disabled";
+			};
+
 			uart0: uart@9000 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x9000 0x100>;
@@ -348,6 +410,16 @@
 					groups =3D "GSM14";
 					function =3D "uart1";
 				};
+
+				twsi2_pmux: twsi2-pmux {
+					groups =3D "GSM13";
+					function =3D "twsi2";
+				};
+
+				twsi3_pmux: twsi3-pmux {
+					groups =3D "GSM14";
+					function =3D "twsi3";
+				};
 			};
=20
 			sic: interrupt-controller@e000 {
--=20
1.9.1
