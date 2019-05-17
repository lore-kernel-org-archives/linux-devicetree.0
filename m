From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Subject: [PATCH 1/1] arm64: dts: marvell: mcbin: enlarge PCI memory window
Date: Fri, 17 May 2019 18:11:23 +0200
Message-ID: <20190517161123.9293-1-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>
List-Id: devicetree@vger.kernel.org

Running a graphics adapter on the MACCHIATObin fails due to an
insufficently sized memory window.

Enlarge the memory window for the PCIe slot to 512 MiB.

With the patch I am able to use a GT710 graphics adapter with 1 GB onboard
memory.

These are the mapped memory areas that the graphics adapter is actually
using:

Region 0: Memory at cc000000 (32-bit, non-prefetchable) [size=3D16M]
Region 1: Memory at c0000000 (64-bit, prefetchable) [size=3D128M]
Region 3: Memory at c8000000 (64-bit, prefetchable) [size=3D32M]
Region 5: I/O ports at 1000 [size=3D128]
Expansion ROM at ca000000 [disabled] [size=3D512K]

Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
=2D--
 arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi b/arch/arm=
64/boot/dts/marvell/armada-8040-mcbin.dtsi
index 329f8ceeebea..205071b45a32 100644
=2D-- a/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-8040-mcbin.dtsi
@@ -184,6 +184,8 @@
 	num-lanes =3D <4>;
 	num-viewport =3D <8>;
 	reset-gpios =3D <&cp0_gpio2 20 GPIO_ACTIVE_LOW>;
+	ranges =3D <0x81000000 0x0 0xf9010000 0x0 0xf9010000 0x0 0x10000
+		  0x82000000 0x0 0xc0000000 0x0 0xc0000000 0x0 0x20000000>;
 	status =3D "okay";
 };

=2D-
2.20.1
