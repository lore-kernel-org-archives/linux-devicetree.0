From: Jean-Francois Moine <moinejf@free.fr>
Subject: [PATCH 1/2] ARM: Dove: Add the audio devices in DT
Date: Wed, 28 Aug 2013 11:34:59 +0200
Message-ID: <20130828113459.48ecbb34@armhf>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>
Cc: Rob Herring <rob.herring@calxeda.com>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch adds the nodes to instantiate the audio devices of the Dove
boards.

Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
---
 arch/arm/boot/dts/dove.dtsi                  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/dove.dtsi b/arch/arm/boot/dts/dove.dtsi
index 499abad..78227e2 100644
--- a/arch/arm/boot/dts/dove.dtsi
+++ b/arch/arm/boot/dts/dove.dtsi
@@ -573,6 +573,24 @@
 					phy-handle =3D <&ethphy>;
 				};
 			};
+
+			i2s0: audio-controller@b0000 {
+				compatible =3D "marvell,mvebu-audio";
+				reg =3D <0xb0000 0x2210>;
+				interrupts =3D <19>, <20>;
+				clocks =3D <&gate_clk 12>;
+				clock-names =3D "internal";
+				status =3D "disabled";
+			};
+
+			i2s1: audio-controller@b4000 {
+				compatible =3D "marvell,mvebu-audio";
+				reg =3D <0xb4000 0x2210>;
+				interrupts =3D <21>, <22>;
+				clocks =3D <&gate_clk 13>;
+				clock-names =3D "internal";
+				status =3D "disabled";
+			};
 		};
 	};
 };


--=20
Ken ar c'henta=C3=B1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
