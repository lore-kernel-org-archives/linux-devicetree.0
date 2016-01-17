From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH 2/2] bmips: improve BCM6368 device tree
Date: Sun, 17 Jan 2016 11:02:35 +0100
Message-ID: <1453024955-13570-2-git-send-email-noltari@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-mips-bounce@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: linux-mips@linux-mips.org, ralf@linux-mips.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, f.fainelli@gmail.com, jogo@openwrt.org, cernekee@gmail.com
Cc: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= <noltari@gmail.com>
List-Id: devicetree@vger.kernel.org

Adds brcm,bcm6358-leds node to bcm6368.dtsi
Adds reboot support (syscon-reboot as defined in BCM6328)

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6368.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6368.dtsi b/arch/mips/boot/dts/=
brcm/bcm6368.dtsi
index 45152bc..9c8d3fe2 100644
--- a/arch/mips/boot/dts/brcm/bcm6368.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6368.dtsi
@@ -32,6 +32,7 @@
 	};
=20
 	aliases {
+		leds0 =3D &leds0;
 		uart0 =3D &uart0;
 	};
=20
@@ -50,6 +51,19 @@
 		compatible =3D "simple-bus";
 		ranges;
=20
+		periph_cntl: syscon@10000000 {
+			compatible =3D "syscon";
+			reg =3D <0x10000000 0x14>;
+			little-endian;
+		};
+
+		reboot: syscon-reboot@10000008 {
+			compatible =3D "syscon-reboot";
+			regmap =3D <&periph_cntl>;
+			offset =3D <0x8>;
+			mask =3D <0x1>;
+		};
+
 		periph_intc: periph_intc@10000020 {
 			compatible =3D "brcm,bcm3380-l2-intc";
 			reg =3D <0x10000024 0x4 0x1000002c 0x4>,
@@ -62,6 +76,14 @@
 			interrupts =3D <2>;
 		};
=20
+		leds0: led-controller@100000d0 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "brcm,bcm6358-leds";
+			reg =3D <0x100000d0 0x8>;
+			status =3D "disabled";
+		};
+
 		uart0: serial@10000100 {
 			compatible =3D "brcm,bcm6345-uart";
 			reg =3D <0x10000100 0x18>;
--=20
1.9.1
