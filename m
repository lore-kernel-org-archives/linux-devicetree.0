From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH v2 2/2] ARM: dts: berlin: add GPIO nodes for the BG2Q
Date: Wed, 16 Apr 2014 09:46:35 +0200
Message-ID: <1397634395-7456-3-git-send-email-antoine.tenart@free-electrons.com>
References: <1397634395-7456-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397634395-7456-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Marvell Berlin BG2Q has 6 GPIO ports compatible with the snps,dw-ap=
b-gpio
driver. This patch add the corresponding device tree nodes.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2q.dtsi | 102 ++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index e6e556055dfc..82bf6910e227 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -109,6 +109,78 @@
 			ranges =3D <0 0xe80000 0x10000>;
 			interrupt-parent =3D <&aic>;
=20
+			gpio0: gpio@0400 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x0400 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				porta: gpio-port@0 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+					interrupt-controller;
+					#interrupt-cells =3D <2>;
+					interrupts =3D <0>;
+				};
+			};
+
+			gpio1: gpio@0800 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x0800 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				portb: gpio-port@1 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+					interrupt-controller;
+					#interrupt-cells =3D <2>;
+					interrupts =3D <1>;
+				};
+			};
+
+			gpio2: gpio@0c00 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x0c00 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				portc: gpio-port@2 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+					interrupt-controller;
+					#interrupt-cells =3D <2>;
+					interrupts =3D <2>;
+				};
+			};
+
+			gpio3: gpio@1000 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x1000 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				portd: gpio-port@3 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+					interrupt-controller;
+					#interrupt-cells =3D <2>;
+					interrupts =3D <3>;
+				};
+			};
+
 			timer0: timer@2c00 {
 				compatible =3D "snps,dw-apb-timer";
 				reg =3D <0x2c00 0x14>;
@@ -181,6 +253,36 @@
 				interrupt-parent =3D <&gic>;
 				interrupts =3D <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
 			};
+
+			gpio4: gpio@5000 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x5000 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				porte: gpio-port@4 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+				};
+			};
+
+			gpio5: gpio@c000 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0xc000 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				portf: gpio-port@5 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <32>;
+					reg =3D <0>;
+				};
+			};
 		};
=20
 		pinctrl: pinctrl@0 {
--=20
1.8.3.2
