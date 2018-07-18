From: Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/5] ARM: dts: sunxi: Remove unused address-cells/size-cells of dwmac-sun8i
Date: Wed, 18 Jul 2018 11:40:36 +0000
Message-ID: <1531914041-14751-1-git-send-email-clabbe@baylibre.com>
Return-path: <netdev-owner@vger.kernel.org>
Sender: netdev-owner@vger.kernel.org
To: catalin.marinas@arm.com, linux@armlinux.org.uk, mark.rutland@arm.com, maxime.ripard@free-electrons.com, robh+dt@kernel.org, wens@csie.org, will.deacon@arm.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-sunxi@googlegroups.com, Corentin Labbe <clabbe@baylibre.com>
List-Id: devicetree@vger.kernel.org

address-cells/size-cells is unnecessary for dwmac-sun8i node.
It was in early days, but since a mdio node is used, it could be
removed.

This patch fix the following DT warning:
Warning (avoid_unnecessary_addr_size): /soc/ethernet@1c50000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

Changes since V1:
- splited patch

Corentin Labbe (5):
  dt-bindings: net: dwmac-sun8i: Remove unused address-cells/size-cells
  ARM: dts: sunxi-h3-h5: Remove unused address-cells/size-cells of
    dwmac-sun8i
  ARM: dts: sun8i: a83t: Remove unused address-cells/size-cells of
    dwmac-sun8i
  ARM: dts: sun8i: r40: Remove unused address-cells/size-cells of
    dwmac-sun8i
  ARM64: dts: sun50i: a64: Remove unused address-cells/size-cells of
    dwmac-sun8i

 Documentation/devicetree/bindings/net/dwmac-sun8i.txt | 8 --------
 arch/arm/boot/dts/sun8i-a83t.dtsi                     | 2 --
 arch/arm/boot/dts/sun8i-r40.dtsi                      | 2 --
 arch/arm/boot/dts/sunxi-h3-h5.dtsi                    | 2 --
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi         | 2 --
 5 files changed, 16 deletions(-)

-- 
2.16.4
