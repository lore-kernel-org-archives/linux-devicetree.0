From: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [PATCH 4/4] arm64: dts: marvell: Rename armada-ap806 XOR nodes
Date: Wed, 23 Mar 2016 23:24:21 +0100
Message-ID: <1458771861-12392-5-git-send-email-afaerber@suse.de>
References: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1458771861-12392-1-git-send-email-afaerber@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "open list:OPEN FIRMWARE AND FLATTENED
	DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

Node names should not contain an instance number, the unit address
serves to distinguish nodes of the same name. So rename the XOR nodes
to just xor@address, using xorX as label instead.

=46ixes: ec7e5a569bce ("arm64: dts: marvell: add Device Tree files for =
Armada 7K/8K")
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
---
 "marvell,mv-xor-v2" is not yet referenced from any driver in next-2016=
0323.
=20
 arch/arm64/boot/dts/marvell/armada-ap806.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi b/arch/arm64=
/boot/dts/marvell/armada-ap806.dtsi
index 3ecf9b1798fa..dd6e48a952ac 100644
--- a/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-ap806.dtsi
@@ -135,7 +135,7 @@
 				marvell,spi-base =3D <128>, <136>, <144>, <152>;
 			};
=20
-			xor0@400000 {
+			xor0: xor@400000 {
 				compatible =3D "marvell,mv-xor-v2";
 				reg =3D <0x400000 0x1000>,
 				      <0x410000 0x1000>;
@@ -143,7 +143,7 @@
 				dma-coherent;
 			};
=20
-			xor1@420000 {
+			xor1: xor@420000 {
 				compatible =3D "marvell,mv-xor-v2";
 				reg =3D <0x420000 0x1000>,
 				      <0x430000 0x1000>;
@@ -151,7 +151,7 @@
 				dma-coherent;
 			};
=20
-			xor2@440000 {
+			xor2: xor@440000 {
 				compatible =3D "marvell,mv-xor-v2";
 				reg =3D <0x440000 0x1000>,
 				      <0x450000 0x1000>;
@@ -159,7 +159,7 @@
 				dma-coherent;
 			};
=20
-			xor3@460000 {
+			xor3: xor@460000 {
 				compatible =3D "marvell,mv-xor-v2";
 				reg =3D <0x460000 0x1000>,
 				      <0x470000 0x1000>;
--=20
2.6.2
