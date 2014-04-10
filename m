From: =?UTF-8?q?Antoine=20T=C3=A9nart?=
	<antoine.tenart@free-electrons.com>
Subject: [PATCH 5/5] ARM: dts: berlin: add the pinctrl node and muxing setup for uarts
Date: Thu, 10 Apr 2014 14:47:43 +0200
Message-ID: <1397134063-10503-6-git-send-email-antoine.tenart@free-electrons.com>
References: <1397134063-10503-1-git-send-email-antoine.tenart@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1397134063-10503-1-git-send-email-antoine.tenart@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sebastian.hesselbarth@gmail.com, linus.walleij@linaro.org
Cc: =?UTF-8?q?Antoine=20T=C3=A9nart?= <antoine.tenart@free-electrons.com>, alexandre.belloni@free-electrons.com, zmxu@marvell.com, jszhang@marvell.com, linux-arm-kernel@list.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The uart0 pinmux configuration is in the dtsi because uart0 will always
use uart0-pmux to work, no other possibility. Same thing for uart1.

Signed-off-by: Antoine T=C3=A9nart <antoine.tenart@free-electrons.com>
---
 arch/arm/boot/dts/berlin2.dtsi   | 20 ++++++++++++++++++++
 arch/arm/boot/dts/berlin2cd.dtsi | 13 +++++++++++++
 arch/arm/boot/dts/berlin2q.dtsi  | 20 ++++++++++++++++++++
 3 files changed, 53 insertions(+)

diff --git a/arch/arm/boot/dts/berlin2.dtsi b/arch/arm/boot/dts/berlin2=
=2Edtsi
index 56a1af2f1052..43eb90c36050 100644
--- a/arch/arm/boot/dts/berlin2.dtsi
+++ b/arch/arm/boot/dts/berlin2.dtsi
@@ -176,6 +176,22 @@
 			};
 		};
=20
+		pinctrl: pinctrl@0 {
+			compatible =3D "marvell,berlin2-pinctrl";
+			reg =3D <0xea0000 0x08>, <0xfc0000 0x44>;
+			reg-names =3D "global_base", "apb_base";
+
+			uart0_pmux: uart0-pmux {
+				berlin,group =3D "GSM4";
+				berlin,function =3D <0>;
+			};
+
+			uart1_pmux: uart1-pmux {
+				berlin,group =3D "GSM5";
+				berlin,function =3D <1>;
+			};
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -191,6 +207,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <8>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart0_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
@@ -201,6 +219,8 @@
 				reg-io-width =3D <1>;
 				interrupts =3D <9>;
 				clocks =3D <&smclk>;
+				pinctrl-0 =3D <&uart1_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
diff --git a/arch/arm/boot/dts/berlin2cd.dtsi b/arch/arm/boot/dts/berli=
n2cd.dtsi
index 094968c27533..4c04cff89226 100644
--- a/arch/arm/boot/dts/berlin2cd.dtsi
+++ b/arch/arm/boot/dts/berlin2cd.dtsi
@@ -169,6 +169,17 @@
 			};
 		};
=20
+		pinctrl: pinctrl@0 {
+			compatible =3D "marvell,berlin2cd-pinctrl";
+			reg =3D <0xea0000 0x08>, <0xfc0000 0x44>;
+			reg-names =3D "global_base", "apb_base";
+
+			uart0_pmux: uart0-pmux {
+				berlin,group =3D "G6";
+				berlin,function =3D <0>;
+			};
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -184,6 +195,8 @@
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
index 07452a7483fa..e6e556055dfc 100644
--- a/arch/arm/boot/dts/berlin2q.dtsi
+++ b/arch/arm/boot/dts/berlin2q.dtsi
@@ -183,6 +183,22 @@
 			};
 		};
=20
+		pinctrl: pinctrl@0 {
+			compatible =3D "marvell,berlin2q-pinctrl";
+			reg =3D <0xea0000 0x4c>, <0xfcd000 0x44>;
+			reg-names =3D "global_base", "sm_base";
+
+			uart0_pmux: uart0-pmux {
+				berlin,group =3D "GSM12";
+				berlin,function =3D <0>;
+			};
+
+			uart1_pmux: uart1-pmux {
+				berlin,group =3D "GSM14";
+				berlin,function =3D <1>;
+			};
+		};
+
 		apb@fc0000 {
 			compatible =3D "simple-bus";
 			#address-cells =3D <1>;
@@ -198,6 +214,8 @@
 				interrupts =3D <8>;
 				clocks =3D <&smclk>;
 				reg-shift =3D <2>;
+				pinctrl-0 =3D <&uart0_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
@@ -208,6 +226,8 @@
 				interrupts =3D <9>;
 				clocks =3D <&smclk>;
 				reg-shift =3D <2>;
+				pinctrl-0 =3D <&uart1_pmux>;
+				pinctrl-names =3D "default";
 				status =3D "disabled";
 			};
=20
--=20
1.8.3.2
