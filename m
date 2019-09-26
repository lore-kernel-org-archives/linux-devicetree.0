From: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH 0/3] ARM: dts: SDRAM and L2 cache EDAC for Armada SoCs
Date: Fri, 27 Sep 2019 11:28:17 +1200
Message-ID: <20190926232820.27676-1-chris.packham@alliedtelesis.co.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jason@lakedaemon.net, andrew@lunn.ch, gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Packham <chris.packham@alliedtelesis.co.nz>
List-Id: devicetree@vger.kernel.org

This series was waiting for the armada_xp edac driver to be accepted.
Now that it has the relevant nodes can be added to the Armada SoCs. So
that boards can use the EDAC driver if they have the hardware support.

The db-xc3-24g4xg.dts board doesn't have an ECC chip for it's DDR but it
can use the L2 cache parity and ecc support.

Chris Packham (3):
  ARM: dts: armada-xp: enable L2 cache parity and ecc on db-xc3-24g4xg
  ARM: dts: mvebu: add sdram controller node to Armada-38x
  ARM: dts: armada-xp: add label to sdram-controller node

 arch/arm/boot/dts/armada-38x.dtsi             | 5 +++++
 arch/arm/boot/dts/armada-xp-98dx3236.dtsi     | 2 +-
 arch/arm/boot/dts/armada-xp-db-xc3-24g4xg.dts | 5 +++++
 arch/arm/boot/dts/armada-xp.dtsi              | 2 +-
 4 files changed, 12 insertions(+), 2 deletions(-)

--=20
2.23.0
