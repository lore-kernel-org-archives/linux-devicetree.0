From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
	<noltari@gmail.com>
Subject: [PATCH 2/3] MIPS: BMIPS: improve BCM6358 device tree
Date: Sun,  3 Apr 2016 14:13:04 +0200
Message-ID: <1459685585-11747-2-git-send-email-noltari@gmail.com>
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

- Switch to bcm6345-l1-intc interrupt controller.
- Add ehci0 and ohci0 nodes.
- Use proper native-endian syscon property.

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6358.dtsi | 29 ++++++++++++++++++++++++----=
-
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/mips/boot/dts/brcm/bcm6358.dtsi b/arch/mips/boot/dts/=
brcm/bcm6358.dtsi
index 5ac1ef0..5dc8432 100644
--- a/arch/mips/boot/dts/brcm/bcm6358.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6358.dtsi
@@ -53,7 +53,7 @@
 		periph_cntl: syscon@fffe0000 {
 			compatible =3D "syscon";
 			reg =3D <0xfffe0000 0xc>;
-			little-endian;
+			native-endian;
 		};
=20
 		reboot: syscon-reboot@fffe0008 {
@@ -64,15 +64,15 @@
 		};
=20
 		periph_intc: interrupt-controller@fffe000c {
-			compatible =3D "brcm,bcm3380-l2-intc";
-			reg =3D <0xfffe0010 0x4 0xfffe000c 0x4>,
-			      <0xfffe003c 0x4 0xfffe0038 0x4>;
+			compatible =3D "brcm,bcm6345-l1-intc";
+			reg =3D <0xfffe000c 0x8>,
+			      <0xfffe0038 0x8>;
=20
 			interrupt-controller;
 			#interrupt-cells =3D <1>;
=20
 			interrupt-parent =3D <&cpu_intc>;
-			interrupts =3D <2>;
+			interrupts =3D <2>, <3>;
 		};
=20
 		leds0: led-controller@fffe00d0 {
@@ -107,5 +107,24 @@
=20
 			status =3D "disabled";
 		};
+
+		ehci0: usb@fffe1300 {
+			compatible =3D "brcm,bcm6358-ehci", "generic-ehci";
+			reg =3D <0xfffe1300 0x100>;
+			big-endian;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <10>;
+			status =3D "disabled";
+		};
+
+		ohci0: usb@fffe1400 {
+			compatible =3D "brcm,bcm6358-ohci", "generic-ohci";
+			reg =3D <0xfffe1400 0x100>;
+			big-endian;
+			no-big-frame-no;
+			interrupt-parent =3D <&periph_intc>;
+			interrupts =3D <5>;
+			status =3D "disabled";
+		};
 	};
 };
--=20
2.1.4
