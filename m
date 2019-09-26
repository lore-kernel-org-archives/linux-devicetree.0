From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 3/3] ARM: dts: armada-xp: add label to sdram-controller node
Date: Fri, 27 Sep 2019 11:28:20 +1200
Message-ID: <20190926232820.27676-4-chris.packham@alliedtelesis.co.nz>
References: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Add the label "sdramc" to the sdram-controller nodes for the Armada-XP
and 98dx3236 SoCs.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi | 2 +-
 arch/arm/boot/dts/armada-xp.dtsi          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi b/arch/arm/boot/dt=
s/armada-xp-98dx3236.dtsi
index 267d0c178e55..654648b05c7c 100644
--- a/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
+++ b/arch/arm/boot/dts/armada-xp-98dx3236.dtsi
@@ -90,7 +90,7 @@
 		};
=20
 		internal-regs {
-			sdramc@1400 {
+			sdramc: sdramc@1400 {
 				compatible =3D "marvell,armada-xp-sdram-controller";
 				reg =3D <0x1400 0x500>;
 			};
diff --git a/arch/arm/boot/dts/armada-xp.dtsi b/arch/arm/boot/dts/armada-=
xp.dtsi
index ee15c77d3689..6c19984d668e 100644
--- a/arch/arm/boot/dts/armada-xp.dtsi
+++ b/arch/arm/boot/dts/armada-xp.dtsi
@@ -36,7 +36,7 @@
 		};
=20
 		internal-regs {
-			sdramc@1400 {
+			sdramc: sdramc@1400 {
 				compatible =3D "marvell,armada-xp-sdram-controller";
 				reg =3D <0x1400 0x500>;
 			};
--=20
2.23.0
