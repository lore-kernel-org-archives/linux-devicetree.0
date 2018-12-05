From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v2 00/15] Cedrus H5 and A64 support with A33 and H3 updates
Date: Wed,  5 Dec 2018 10:24:29 +0100
Message-ID: <20181205092444.29497-1-paul.kocialkowski@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-sunxi@googlegroups.com, Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>
List-Id: devicetree@vger.kernel.org

This series adds support for the Allwinner H5 and A64 platforms to the
cedrus stateless video codec driver, with minor updates to the A33 and
H3 platforms.

It requires changes to the SRAM driver bindings and driver, to properly
support the H5 and the A64 C1 SRAM section. Because a H5-specific
system-control node is introduced, the dummy syscon node that was shared
between the H3 and H5 is removed in favor of each platform-specific node.
A few fixes are included to ensure that the EMAC clock configuration
register is still accessible through the sunxi SRAM driver (instead of the
dummy syscon node, that was there for this purpose) on the H3 and H5.

The reserved memory nodes for the A33 and H3 are also removed in this
series, since they are not actually necessary.

Changes since v1:
* Removed the reserved-memory nodes for the A64 and H5;
* Removed the reserved-memory nodes for the A33 and H3;
* Corrected the SRAM bases and sizes to the best of our knowledge;
* Dropped cosmetic dt changes already included in the sunxi tree.

Paul Kocialkowski (15):
  ARM: dts: sun8i: h3: Fix the system-control register range
  ARM: dts: sun8i: a33: Remove unnecessary reserved memory node
  ARM: dts: sun8i: h3: Remove unnecessary reserved memory node
  soc: sunxi: sram: Enable EMAC clock access for H3 variant
  dt-bindings: sram: sunxi: Add bindings for the H5 with SRAM C1
  soc: sunxi: sram: Add support for the H5 SoC system control
  arm64: dts: allwinner: h5: Add system-control node with SRAM C1
  ARM/arm64: sunxi: Move H3/H5 syscon label over to soc-specific nodes
  dt-bindings: sram: sunxi: Add compatible for the A64 SRAM C1
  arm64: dts: allwinner: a64: Add support for the SRAM C1 section
  dt-bindings: media: cedrus: Add compatibles for the A64 and H5
  media: cedrus: Add device-tree compatible and variant for H5 support
  media: cedrus: Add device-tree compatible and variant for A64 support
  arm64: dts: allwinner: h5: Add Video Engine node
  arm64: dts: allwinner: a64: Add Video Engine node

 .../devicetree/bindings/media/cedrus.txt      |  2 ++
 .../devicetree/bindings/sram/sunxi-sram.txt   |  5 +++
 arch/arm/boot/dts/sun8i-a33.dtsi              | 15 ---------
 arch/arm/boot/dts/sun8i-h3.dtsi               | 18 ++--------
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  6 ----
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 25 ++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi  | 33 +++++++++++++++++++
 drivers/soc/sunxi/sunxi_sram.c                | 10 +++++-
 drivers/staging/media/sunxi/cedrus/cedrus.c   | 16 +++++++++
 9 files changed, 92 insertions(+), 38 deletions(-)

-- 
2.19.2
