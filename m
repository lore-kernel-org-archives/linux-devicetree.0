From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 1/3] ARM: dts: armada-38x: add interrupts for watchdog
Date: Wed,  6 Mar 2019 09:19:22 +1300
Message-ID: <20190305201924.14853-2-chris.packham@alliedtelesis.co.nz>
References: <20190305201924.14853-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190305201924.14853-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, linux@roeck-us.net
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

The first interrupt is for the regular watchdog timeout. Normally the
RSTOUT line will trigger a reset before this interrupt fires but on
systems with a non-standard reset it may still trigger.

The second interrupt is for a timer1 which is used as a pre-timeout for
the watchdog.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- new, split out from "watchdog: orion_wdt: use timer1 as a pretimeout"

 arch/arm/boot/dts/armada-38x.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/armada-38x.dtsi b/arch/arm/boot/dts/armada=
-38x.dtsi
index 929459c42760..fc550c640ca8 100644
--- a/arch/arm/boot/dts/armada-38x.dtsi
+++ b/arch/arm/boot/dts/armada-38x.dtsi
@@ -376,6 +376,8 @@
 				reg =3D <0x20300 0x34>, <0x20704 0x4>, <0x18260 0x4>;
 				clocks =3D <&coreclk 2>, <&refclk>;
 				clock-names =3D "nbclk", "fixed";
+				interrupts-extended =3D <&gic GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
+						      <&gic GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
 			};
=20
 			cpurst: cpurst@20800 {
--=20
2.21.0
