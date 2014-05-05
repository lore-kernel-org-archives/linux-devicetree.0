From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH v3 7/7] ARM: dts: berlin: add the pinctrl node and muxing setup for uarts
Date: Mon,  5 May 2014 07:27:29 +0200
Message-ID: <1399267649-20218-8-git-send-email-antoine.tenart@free-electrons.com>
References: <1399267649-20218-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1399267649-20218-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, thomas.petazzoni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The uart0 pinmux configuration is in the dtsi because uart0 will always
use uart0-pmux to work, no other possibility. Same thing for uart1 and
uart2 (BG2).

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
Acked-by: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
---
 arch/arm/boot/dts/berlin2.dtsi   | 31 +++++++++++++++++++++++++++++++
 arch/arm/boot/dts/berlin2cd.dtsi | 17 +++++++++++++++++
 arch/arm/boot/dts/berlin2q.dtsi  | 24 ++++++++++++++++++++++++
 3 files changed, 72 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2=
=2Edtsi
index 56a1af2f1052..fb58f43eab52 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -176,6 +176,11 @@
 			};
 		};
=20
+		soc_pinctrl: pin-controller@ea0000 {
+			compatible =3D "marvell,berlin2-soc-pinctrl";
+			reg =3D <0xea0000 0x4c>;
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -184,6 +189,26 @@
 			ranges =3D <0 0xfc0000 0x10000>;
 			interrupt-parent =3D <&sic>;
=20
+			sm_pinctrl: pin-controller@0000 {
+				compatible =3D "marvell,berlin2-sysmgr-pinctrl";
+				reg =3D <0x0000 0x44>;
+
+				uart0_pmux: uart0-pmux {
+					marvell,groups =3D "GSM4";
+					marvell,function =3D "uart0";
+				};
+
+				uart1_pmux: uart1-pmux {
+					marvell,groups =3D "GSM5";
+					marvell,function =3D "uart1";
+				};
+
+				uart2_pmux: uart2-pmux {
+					marvell,groups =3D "GSM3";
+					marvell,function =3D "uart2";
+				};
+			};
+
 			uart0: serial@9000 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x9000 0x100>;
@@ -191,6 +216,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <8>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart0_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
@@ -201,6 +228,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <9>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart1_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
@@ -211,6 +240,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <10>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart2_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berli=
n2cd.dtsi
index 094968c27533..a802d3fe5da6 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -169,6 +169,11 @@
 			};
 		};
=20
+		soc_pinctrl: pin-controller@ae0000 {
+			compatible =3D "marvell,berlin2cd-soc-pinctrl";
+			reg =3D <0xea0000 0x4c>;
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -177,6 +182,16 @@
 			ranges =3D <0 0xfc0000 0x10000>;
 			interrupt-parent =3D <&sic>;
=20
+			sm_pinctrl: pin-controller@0000 {
+				compatible =3D "marvell,berlin2cd-sysmgr-pinctrl";
+				reg =3D <0x0000 0x44>;
+
+				uart0_pmux: uart0-pmux {
+					marvell,groups =3D "G6";
+					marvell,function =3D "uart0";
+				};
+			};
+
 			uart0: serial@9000 {
 				compatible =3D "snps,dw-apb-uart";
 				reg =3D <0x9000 0x100>;
@@ -184,6 +199,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <8>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart0_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
diff --git a/arch/arm/boot/dts/berlin2q.dtsi b/arch/arm/boot/dts/berlin=
2q.dtsi
index 07452a7483fa..734debbf072f 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -183,6 +183,11 @@
 			};
 		};
=20
+		soc_pinctrl: pin-controller@ea0000 {
+			compatible =3D "marvell,berlin2q-soc-pinctrl";
+			reg =3D <0xea0000 0x4c>;
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -198,6 +203,8 @@
 				interrupts =3D <8>;
 				clocks =3D <&smclk>;
 				reg-shift =3D <2>;
+				pinctrl-0 =3D <&uart0_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
@@ -208,9 +215,26 @@
 				interrupts =3D <9>;
 				clocks =3D <&smclk>;
 				reg-shift =3D <2>;
+				pinctrl-0 =3D <&uart1_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
+			sm_pinctrl: pin-controller@d000 {
+				compatible =3D "marvell,berlin2q-sysmgr-pinctrl";
+				reg =3D <0xd000 0x44>;
+
+				uart0_pmux: uart0-pmux {
+					marvell,groups =3D "GSM12";
+					marvell,function =3D "uart0";
+				};
+
+				uart1_pmux: uart1-pmux {
+					marvell,groups =3D "GSM14";
+					marvell,function =3D "uart1";
+				};
+			};
+
 			sic: interrupt-controller@e000 {
 				compatible =3D "snps,dw-apb-ictl";
 				reg =3D <0xe000 0x30>;
--=20
1.8.3.2
