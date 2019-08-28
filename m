From: Lubomir Rintel <lkundrak@v3.sk>
Subject: [PATCH v3 2/6] ARM: dts: mmp2: fix the SPI nodes
Date: Wed, 28 Aug 2019 09:26:25 +0200
Message-ID: <20190828072629.285760-3-lkundrak@v3.sk>
References: <20190828072629.285760-1-lkundrak@v3.sk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828072629.285760-1-lkundrak@v3.sk>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, Lubomir Rintel <lkundrak@v3.sk>
List-Id: devicetree@vger.kernel.org

The SPI bus has a single address cell and not size cells.

Also, dtc thinks the SPI nodes are preferrably called "spi" and it is
right to think so.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
 arch/arm/boot/dts/mmp2.dtsi | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mmp2.dtsi b/arch/arm/boot/dts/mmp2.dtsi
index 50b6c38b39cc3..e64639ce57a91 100644
--- a/arch/arm/boot/dts/mmp2.dtsi
+++ b/arch/arm/boot/dts/mmp2.dtsi
@@ -346,35 +346,43 @@
 				status =3D "disabled";
 			};
=20
-			ssp1: ssp@d4035000 {
+			ssp1: spi@d4035000 {
 				compatible =3D "marvell,mmp2-ssp";
 				reg =3D <0xd4035000 0x1000>;
 				clocks =3D <&soc_clocks MMP2_CLK_SSP0>;
 				interrupts =3D <0>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
 				status =3D "disabled";
 			};
=20
-			ssp2: ssp@d4036000 {
+			ssp2: spi@d4036000 {
 				compatible =3D "marvell,mmp2-ssp";
 				reg =3D <0xd4036000 0x1000>;
 				clocks =3D <&soc_clocks MMP2_CLK_SSP1>;
 				interrupts =3D <1>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
 				status =3D "disabled";
 			};
=20
-			ssp3: ssp@d4037000 {
+			ssp3: spi@d4037000 {
 				compatible =3D "marvell,mmp2-ssp";
 				reg =3D <0xd4037000 0x1000>;
 				clocks =3D <&soc_clocks MMP2_CLK_SSP2>;
 				interrupts =3D <20>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
 				status =3D "disabled";
 			};
=20
-			ssp4: ssp@d4039000 {
+			ssp4: spi@d4039000 {
 				compatible =3D "marvell,mmp2-ssp";
 				reg =3D <0xd4039000 0x1000>;
 				clocks =3D <&soc_clocks MMP2_CLK_SSP3>;
 				interrupts =3D <21>;
+				#address-cells =3D <1>;
+				#size-cells =3D <0>;
 				status =3D "disabled";
 			};
 		};
--=20
2.21.0
