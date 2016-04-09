From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 1/2] MIPS: BMIPS: improve BCM6328 device tree
Date: Sat,  9 Apr 2016 12:57:48 +0200
Message-ID: <1460199469-18880-1-git-send-email-noltari@gmail.com>
References: <1459685585-11747-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1459685585-11747-1-git-send-email-noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jogo-p3rKhJxN3npAfugRpC6u6w@public.gmane.org, cernekee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, simon-A6De1vDTPLDsq35pWSNszA@public.gmane.org
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

- Remove unneeded leds0 alias.
- Switch to bcm6345-l1-intc interrupt controller.
- Use interrupt-controller instead of periph_intc and cpu_intc.
- Add uart1, ehci and ohci nodes.
- Refactor syscon and syscon-reboot.
- Avoid using underscores in node names.
- Rename uart aliases to serial.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 v2: more device tree improvements
  - There is just ohci/ehci node.
  - Avoid using underscores in node names.
  - Use interrupt-controller for cpu_intc.
  - Rename uart aliases to serial.

 arch/mips/boot/dts/brcm/bcm6328.dtsi | 50 ++++++++++++++++++++++++++++=
--------
 1 file changed, 39 insertions(+), 11 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/=
brcm/bcm6328.dtsi
index 9d19236..5633b9d 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -23,7 +23,7 @@
 	};
=20
 	clocks {
-		periph_clk: periph_clk {
+		periph_clk: periph-clk {
 			compatible =3D "fixed-clock";
 			#clock-cells =3D <0>;
 			clock-frequency =3D <50000000>;
@@ -31,11 +31,11 @@
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
+		ehci: usb@10002500 {
+			compatible =3D "brcm,bcm6328-ehci", "generic-ehci";
+			reg =3D <0x10002500 0x100>;
+			big-endian;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <42>;
+			status =3D "disabled";
+		};
+
+		ohci: usb@10002600 {
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

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
