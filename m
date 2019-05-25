From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 00/10] Allwiner A64/H6 IR support
Date: Sat, 25 May 2019 20:09:13 +0200
Message-ID: <20190525180923.6105-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Hi,

A64 IR support series[1] pointed out that an A31 bindinds should be
introduced.

This series introduce the A31 compatible bindings, then switch it on
the already existing board.

Finally introduce A64 and H6 support.

Regards,
Clément

[1] https://lore.kernel.org/patchwork/patch/1031390/#1221464

Clément Péron (8):
  dt-bindings: media: A31 compatible
  media: rc: sunxi: Add A31 compatible
  ARM: dts: sunxi: prefer A31 instead of A13 for ir
  dt-bindings: media: sunxi-ir: Add A64 compatible
  dt-bindings: media: sunxi-ir: Add H6 compatible
  arm64: dts: allwiner: h6: Add IR receiver node
  arm64: dts: allwinner: h6: Enable IR on H6 boards
  arm64: defconfig: enable IR SUNXI option

Igors Makejevs (1):
  arm64: dts: allwinner: a64: Add IR node

Jernej Skrabec (1):
  arm64: dts: allwinner: a64: Enable IR on Orange Pi Win

 .../devicetree/bindings/media/sunxi-ir.txt    |  7 ++++++-
 arch/arm/boot/dts/sun6i-a31.dtsi              |  2 +-
 arch/arm/boot/dts/sun8i-a83t.dtsi             |  2 +-
 arch/arm/boot/dts/sun9i-a80.dtsi              |  2 +-
 arch/arm/boot/dts/sunxi-h3-h5.dtsi            |  2 +-
 .../dts/allwinner/sun50i-a64-orangepi-win.dts |  4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 18 ++++++++++++++++++
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   |  4 ++++
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  4 ++++
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  | 19 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  1 +
 drivers/media/rc/sunxi-cir.c                  |  1 +
 13 files changed, 65 insertions(+), 5 deletions(-)

-- 
2.20.1
