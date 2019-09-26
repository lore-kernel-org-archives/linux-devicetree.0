From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 2/3] ARM: dts: mvebu: add sdram controller node to Armada-38x
Date: Fri, 27 Sep 2019 11:28:19 +1200
Message-ID: <20190926232820.27676-3-chris.packham@alliedtelesis.co.nz>
References: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

The Armada-38x uses an SDRAM controller that is compatible with the
Armada-XP. The key difference is the width of the bus (XP is 64/32, 38x
is 32/16). The SDRAM controller registers are the same between the two
SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-38x.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada=
-38x.dtsi
index 3f4bb44d85f0..e038abc0c6b4 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -103,6 +103,11 @@
 			#size-cells =3D <1>;
 			ranges =3D <0 MBUS_ID(0xf0, 0x01) 0 0x100000>;
=20
+			sdramc: sdramc@1400 {
+				compatible =3D "marvell,armada-xp-sdram-controller";
+				reg =3D <0x1400 0x500>;
+			};
+
 			L2: cache-controller@8000 {
 				compatible =3D "arm,pl310-cache";
 				reg =3D <0x8000 0x1000>;
--=20
2.23.0
