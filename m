From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/2] MIPS: BMIPS: improve BCM6368 device tree
Date: Sat,  9 Apr 2016 12:57:49 +0200
Message-ID: <1460199469-18880-2-git-send-email-noltari@gmail.com>
References: <1459685585-11747-1-git-send-email-noltari@gmail.com>
 <1460199469-18880-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460199469-18880-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, ralf@linux-mips.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, robh@kernel.org, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

- Remove unneeded leds0 alias.
- Switch to bcm6345-l1-intc interrupt controller.
- Use interrupt-controller instead of periph_intc and cpu_intc.
- Add uart1 node.
- Single ohci and ehci nodes.
- Avoid using underscores in node names.
- Rename uart aliases to serial.
- Remove blank line in cpus node.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 v2: more device tree improvements
  - There is just ohci/ehci node.
  - Avoid using underscores in node names.
  - Use interrupt-controller for cpu_intc.
  - Rename uart aliases to serial.
  - Remove blank line.

 arch/mips/boot/dts/brcm/bcm6368.dtsi | 32 ++++++++++++++++++++--------=
----
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/=
brcm/bcm6368.dtsi
index 1f6b9b5..d0e3a70 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -20,11 +20,10 @@
 			device_type =3D "cpu";
 			reg =3D <1>;
 		};
-
 	};
=20
 	clocks {
-		periph_clk: periph_clk {
+		periph_clk: periph-clk {
 			compatible =3D "fixed-clock";
 			#clock-cells =3D <0>;
 			clock-frequency =3D <50000000>;
@@ -32,11 +31,11 @@
 	};
=20
 	aliases {
-		leds0 =3D &leds0;
-		uart0 =3D &uart0;
+		serial0 =3D &uart0;
+		serial1 =3D &uart1;
 	};
=20
-	cpu_intc: cpu_intc {
+	cpu_intc: interrupt-controller {
 		#address-cells =3D <0>;
 		compatible =3D "mti,cpu-interrupt-controller";
=20
@@ -64,16 +63,16 @@
 			mask =3D <0x1>;
 		};
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
 		leds0: led-controller@100000d0 {
@@ -93,7 +92,16 @@
 			status =3D "disabled";
 		};
=20
-		ehci0: usb@10001500 {
+		uart1: serial@10000120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000120 0x18>;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <3>;
+			clocks =3D <&periph_clk>;
+			status =3D "disabled";
+		};
+
+		ehci: usb@10001500 {
 			compatible =3D "brcm,bcm6368-ehci", "generic-ehci";
 			reg =3D <0x10001500 0x100>;
 			big-endian;
@@ -102,7 +110,7 @@
 			status =3D "disabled";
 		};
=20
-		ohci0: usb@10001600 {
+		ohci: usb@10001600 {
 			compatible =3D "brcm,bcm6368-ohci", "generic-ohci";
 			reg =3D <0x10001600 0x100>;
 			big-endian;
--=20
2.1.4
