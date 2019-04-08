From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 0/6] Add Beelink GS1 Board
Date: Mon,  8 Apr 2019 11:26:13 +0200
Message-ID: <20190408092619.23152-1-peron.clem@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
List-Id: devicetree@vger.kernel.org

Thanks to Jagan and Icenowy, most of this device-tree is taken from their works on
the OrangePi One Plus and Pine H64.

PLEASE NOTE that I don't own an OrangePi nor a Pine H64 and PIO regualtors for these
board has not been tested !
Please add a tested-by on these commits 5 and 6 before merging it.

Changes in v3 (Thanks to Maxime Ripard):
 - remove PL regulator
 - separate patch for sunxi.yaml
 - collect reviewed-by

Changes in v2 (Thanks to Maxime Ripard):
 - move MMC pinctrl to SOC dtsi
 - add board to Sunxi YAML file
 - add PIO/R_PIO regulators
 - remove always_on from SDIO regulators

Clément Péron (6):
  arm64: dts: allwinner: h6: move MMC pinctrl to dtsi
  dt-bindings: vendor-prefixes: add AZW
  ARM: dts: sun50i: h6: Introduce Beelink GS1 board
  dt-bindings: arm: sunxi: Add Beelink GS1 board
  arm64: allwinner: h6: orangepi: Add PIO regulators
  arm64: dts: allwinner: h6: pine64: Add PIO regulators

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.txt   |   1 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-h6-beelink-gs1.dts   | 262 ++++++++++++++++++
 .../dts/allwinner/sun50i-h6-orangepi.dtsi     |  19 +-
 .../boot/dts/allwinner/sun50i-h6-pine-h64.dts |  21 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi  |   4 +
 7 files changed, 307 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts

-- 
2.17.1
