From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH 4/5] ARM: dts: mmp2: add camera interfaces
Date: Thu, 25 Jul 2019 13:07:30 +0200
Message-ID: <20190725110731.3294411-5-lkundrak@v3.sk>
References: <20190725110731.3294411-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725110731.3294411-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 arch/arm/boot/dts/mmp2.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 21432cb9143f7..68b5470773232 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -170,6 +170,28 @@
 				interrupts =3D <54>;
 				status =3D "disabled";
 			};
+
+			camera0: camera@d420a000 {
+				compatible =3D "marvell,mmp2-ccic";
+				reg =3D <0xd420a000 0x800>;
+				interrupts =3D <42>;
+				clocks =3D <&soc_clocks MMP2_CLK_CCIC0>;
+				clock-names =3D "axi";
+				#clock-cells =3D <0>;
+				clock-output-names =3D "mclk";
+				status =3D "disabled";
+			};
+
+			camera1: camera@d420a800 {
+				compatible =3D "marvell,mmp2-ccic";
+				reg =3D <0xd420a800 0x800>;
+				interrupts =3D <30>;
+				clocks =3D <&soc_clocks MMP2_CLK_CCIC1>;
+				clock-names =3D "axi";
+				#clock-cells =3D <0>;
+				clock-output-names =3D "mclk";
+				status =3D "disabled";
+			};
 		};
=20
 		apb@d4000000 {	/* APB */
--=20
2.21.0
