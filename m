From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 3/3] MIPS: BMIPS: improve BCM6368 device tree
Date: Sun,  3 Apr 2016 14:13:05 +0200
Message-ID: <1459685585-11747-3-git-send-email-noltari@gmail.com>
References: <1459685585-11747-1-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459685585-11747-1-git-send-email-noltari@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com, simon@fire.lp0.eu
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

- Remove unneeded leds0 alias.
- Switch to bcm6345-l1-intc interrupt controller.
- Use interrupt-controller instead of periph_intc.
- Add uart1 node.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6368.dtsi | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/=
brcm/bcm6368.dtsi
index 1f6b9b5..75aba97 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -32,8 +32,8 @@
 	};
=20
 	aliases {
-		leds0 =3D &leds0;
 		uart0 =3D &uart0;
+		uart1 =3D &uart1;
 	};
=20
 	cpu_intc: cpu_intc {
@@ -64,16 +64,16 @@
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
@@ -93,6 +93,15 @@
 			status =3D "disabled";
 		};
=20
+		uart1: serial@10000120 {
+			compatible =3D "brcm,bcm6345-uart";
+			reg =3D <0x10000120 0x18>;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <3>;
+			clocks =3D <&periph_clk>;
+			status =3D "disabled";
+		};
+
 		ehci0: usb@10001500 {
 			compatible =3D "brcm,bcm6368-ehci", "generic-ehci";
 			reg =3D <0x10001500 0x100>;
--=20
2.1.4
