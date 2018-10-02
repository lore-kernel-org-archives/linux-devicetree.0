From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH] ARM: dts: auto-detect nand ECC properites for db-88f6820-amc
Date: Wed,  3 Oct 2018 10:12:33 +1300
Message-ID: <20181002211233.20774-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregory.clement@bootlin.com, andrew@lunn.ch, jason@lakedaemon.net
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This board has a Micron MT29F8G08ABACAWP chip which requires a ECC
strength of 8/512. Rather than hard coding any particular strength the
the nand controller auto-detect the ECC strength based on the ONFI data.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
=20arch/arm/boot/dts/armada-385-db-88f6820-amc.dts | 2 --
=201 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts b/arch/arm/b=
oot/dts/armada-385-db-88f6820-amc.dts
index dc9ccce1d4a1..7881df3b28a0 100644
--- a/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts
+++ b/arch/arm/boot/dts/armada-385-db-88f6820-amc.dts
@@ -99,8 +99,6 @@
=20		label =3D "pxa3xx_nand-0";
=20		nand-rb =3D <0>;
=20		nand-on-flash-bbt;
-		nand-ecc-strength =3D <4>;
-		nand-ecc-step-size =3D <512>;
=20
=20		partitions {
=20			compatible =3D "fixed-partitions";
--=20
2.19.0
