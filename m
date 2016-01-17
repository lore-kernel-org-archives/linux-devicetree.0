From: =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?=
        <noltari@gmail.com>
Subject: [PATCH 1/2] bmips: improve BCM6328 device tree
Date: Sun, 17 Jan 2016 11:02:34 +0100
Message-ID: <1453024955-13570-1-git-send-email-noltari@gmail.com>
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

Adds bcm6328-leds node to bcm6328.dtsi

Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
---
 arch/mips/boot/dts/brcm/bcm6328.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/mips/boot/dts/brcm/bcm6328.dtsi b/arch/mips/boot/dts/=
brcm/bcm6328.dtsi
index 41891c1..d61b161 100644
--- a/arch/mips/boot/dts/brcm/bcm6328.dtsi
+++ b/arch/mips/boot/dts/brcm/bcm6328.dtsi
@@ -31,6 +31,7 @@
 	};
=20
 	aliases {
+		leds0 =3D &leds0;
 		uart0 =3D &uart0;
 	};
=20
@@ -82,5 +83,13 @@
 			offset =3D <0x28>;
 			mask =3D <0x1>;
 		};
+
+		leds0: led-controller@10000800 {
+			#address-cells =3D <1>;
+			#size-cells =3D <0>;
+			compatible =3D "brcm,bcm6328-leds";
+			reg =3D <0x10000800 0x24>;
+			status =3D "disabled";
+		};
 	};
 };
--=20
1.9.1
