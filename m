From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH 1/7] ARM: dts: socfpga: add gpio pieces
Date: Sat, 22 Mar 2014 17:16:38 +0100
Message-ID: <1395505004-22650-2-git-send-email-bigeasy@linutronix.de>
References: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1395505004-22650-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: atull@altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, dinguyen@altera.com, delicious.quinoa@gmail.com, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The cycloneV has three gpio controllers, the first two with 29 gpios, t=
he last
one with 27. This patch adds the three controller with the gpio driver =
which is
now sitting the gpio tree.

Cc: devicetree@vger.kernel.org
Acked-by: Alan Tull <atull@altera.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
v1=E2=80=A6v2:
	- #gpio-cells =3D <2>
	- third gpio block has now only 27 gpios

 arch/arm/boot/dts/socfpga.dtsi | 64 ++++++++++++++++++++++++++++++++++=
++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga=
=2Edtsi
index 537f1a5..2a84e67 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -463,6 +463,70 @@
 			status =3D "disabled";
 		};
=20
+		gpio@ff708000 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "snps,dw-apb-gpio";
+			reg =3D <0xff708000 0x1000>;
+			clocks =3D <&per_base_clk>;
+			status =3D "disabled";
+
+			gpio0: gpio-controller@0 {
+				compatible =3D "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				snps,nr-gpios =3D <29>;
+				reg =3D <0>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+				interrupts =3D <0 164 4>;
+			};
+		};
+
+		gpio@ff709000 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "snps,dw-apb-gpio";
+			reg =3D <0xff709000 0x1000>;
+			clocks =3D <&per_base_clk>;
+			status =3D "disabled";
+
+			gpio1: gpio-controller@0 {
+				compatible =3D "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				snps,nr-gpios =3D <29>;
+				reg =3D <0>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+				interrupts =3D <0 165 4>;
+			};
+		};
+
+		gpio@ff70a000 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "snps,dw-apb-gpio";
+			reg =3D <0xff70a000 0x1000>;
+			clocks =3D <&per_base_clk>;
+			status =3D "disabled";
+
+			gpio2: gpio-controller@0 {
+				compatible =3D "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells =3D <2>;
+				/*
+				 * Despite what the documentation says here, the
+				 * third gpio block has only 27 gpios available
+				 */
+				snps,nr-gpios =3D <27>;
+				reg =3D <0>;
+				interrupt-controller;
+				#interrupt-cells =3D <2>;
+				interrupts =3D <0 166 4>;
+			};
+		};
+
 		L2: l2-cache@fffef000 {
 			compatible =3D "arm,pl310-cache";
 			reg =3D <0xfffef000 0x1000>;
--=20
1.9.1
