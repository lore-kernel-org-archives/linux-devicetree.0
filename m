From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 1/3] MIPS: BMIPS: improve BCM6328 device tree
Date: Sun,  3 Apr 2016 14:13:03 +0200
Message-ID: <1459685585-11747-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

- Remove unneeded leds0 alias.
- Switch to bcm6345-l1-intc interrupt controller.
- Use interrupt-controller instead of periph_intc.
- Add uart1, ehci0 and ohci0 nodes.
- Refactor syscon and syscon-reboot.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6328.dtsi | 44 ++++++++++++++++++++++++++++=
+-------
 1 file changed, 36 insertions(+), 8 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/=
brcm/bcm6328.dtsi
index 9d19236..8efa420 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -31,8 +31,8 @@
 	};
=20
 	aliases {
-		leds0 =3D &leds0;
 		uart0 =3D &uart0;
+		uart1 =3D &uart1;
 	};
=20
 	cpu_intc: cpu_intc {
@@ -50,16 +50,16 @@
 		compatible =3D "simple-bus";
 		ranges;
=20
-		periph_intc: periph_intc@10000020 {
-			compatible =3D "brcm,bcm3380-l2-intc";
-			reg =3D <0x10000024 0x4 0x1000002c 0x4>,
-			      <0x10000020 0x4 0x10000028 0x4>;
+		periph_intc: interrupt-controller@10000020 {
+			compatible =3D "brcm,bcm6345-l1-intc";
+			reg =3D <0x10000020 0x10>,
+			      <0x10000030 0x10>;
=20
 			interrupt-controller;
 			#interrupt-cells =3D <1>;
=20
 			interrupt-parent =3D <&cpu_intc>;
-			interrupts =3D <2>;
+			interrupts =3D <2>, <3>;
 		};
=20
 		uart0: serial@10000100 {
@@ -71,13 +71,22 @@
 			status =3D "disabled";
 		};
=20
-		timer: timer@10000040 {
+		uart1: serial@10000120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000120 0x18>;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <39>;
+			clocks =3D <&periph_clk>;
+			status =3D "disabled";
+		};
+
+		timer: syscon@10000040 {
 			compatible =3D "syscon";
 			reg =3D <0x10000040 0x2c>;
 			native-endian;
 		};
=20
-		reboot {
+		reboot: syscon-reboot@10000068 {
 			compatible =3D "syscon-reboot";
 			regmap =3D <&timer>;
 			offset =3D <0x28>;
@@ -91,5 +100,24 @@
 			reg =3D <0x10000800 0x24>;
 			status =3D "disabled";
 		};
+
+		ehci0: usb@10002500 {
+			compatible =3D "brcm,bcm6328-ehci", "generic-ehci";
+			reg =3D <0x10002500 0x100>;
+			big-endian;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <42>;
+			status =3D "disabled";
+		};
+
+		ohci0: usb@10002600 {
+			compatible =3D "brcm,bcm6328-ohci", "generic-ohci";
+			reg =3D <0x10002600 0x100>;
+			big-endian;
+			no-big-frame-no;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <41>;
+			status =3D "disabled";
+		};
 	};
 };
--=20
2.1.4
