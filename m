From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 1/3] ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg
Date: Fri, 27 Sep 2019 11:28:18 +1200
Message-ID: <20190926232820.27676-2-chris.packham@alliedtelesis.co.nz>
References: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

Enable L2 cache parity and ECC on the db-xc3-24g4xg board so that cache
operations are protected and errors can be flagged to the EDAC
subsystem.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts b/arch/arm/boo=
t/dts/armada-xp-db-xc3-24g4xg.dts
index df048050615f..4ec0ae01b61d 100644
--- a/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
+++ b/arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts
@@ -33,6 +33,11 @@
 	};
 };
=20
+&L2 {
+	arm,parity-enable;
+	marvell,ecc-enable;
+};
+
 &devbus_bootcs {
 	status =3D "okay";
=20
--=20
2.23.0
