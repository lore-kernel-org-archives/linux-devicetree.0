From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 2/2] ARM: dts: berlin: add the BG2CD GPIO nodes
Date: Thu, 17 Apr 2014 10:45:29 +0200
Message-ID: <1397724329-14154-3-git-send-email-antoine.tenart@free-electrons.com>
References: <1397724329-14154-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397724329-14154-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The Berlin BG2CD has 32 GPIOs in SoC power domain and 16 in the SM one.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2cd.dtsi | 102 +++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berli=
n2cd.dtsi
index 094968c27533..6eb1bdae23ac 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -87,6 +87,78 @@
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
+					snps,nr-gpios =3D <8>;
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
+					snps,nr-gpios =3D <8>;
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
+					snps,nr-gpios =3D <8>;
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
+					snps,nr-gpios =3D <8>;
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
@@ -177,6 +249,36 @@
 			ranges =3D <0 0xfc0000 0x10000>;
 			interrupt-parent =3D <&sic>;
=20
+			sm_gpio1: gpio@5000 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0x5000 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				portf: gpio-port@5 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <8>;
+					reg =3D <0>;
+				};
+			};
+
+			sm_gpio0: gpio@c000 {
+				compatible =3D "snps,dw-apb-gpio";
+				reg =3D <0xc000 0x400>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
+
+				porte: gpio-port@4 {
+					compatible =3D "snps,dw-apb-gpio-port";
+					gpio-controller;
+					#gpio-cells =3D <2>;
+					snps,nr-gpios =3D <8>;
+					reg =3D <0>;
+				};
+			};
+
 			uart0: serial@9000 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x9000 0x100>;
--=20
1.8.3.2
