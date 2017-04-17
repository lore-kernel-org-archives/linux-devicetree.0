From: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Subject: [PATCH v3 00/12] AXP803 PMIC support for Pine64
Date: Mon, 17 Apr 2017 19:57:35 +0800
Message-ID: <20170417115747.7300-1-icenowy@aosc.io>
Reply-To: icenowy-h8G6r0blFSE@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBDS6XAN6ZADRBDW42LDQKGQEGGEL7OQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Pine64 (including Pine64+) boards have an AXP803 PMIC, which is a PMIC
similar to AXP288, but tweaked to use with Allwinner SoCs rather than Intel
tablets (with DCIN and Vbus re-splitted like other AXP PMICs, and RSB bus
support added).

This patchset adds support for it and enabled it in Pine64 device tree.

This patchset can be splitted into two big parts:

- Part1: PATCH 1/11 to PATCH 6/12, which are enabling the MFD (and the
  power key functionality) of AXP803.

- Part2: PATCH 7/12 to PATCH 12/12, which are enabling the regulator
  function of the AXP803 PMIC. Finally Wi-Fi function is added
  as a usage of regulators function.

PATCH 1 and 2 added RSB and NMI device nodes, which are used for the
communication between A64 and AXP803.

PATCH 3 re-arranged the compatible strings in AXP20x device tree binding,
for easier insertion of AXP803 compatible. This is based on the suggestion
by device tree maintainer Rob Herring.

PATCH 4 adds basical devicetree binding for AXP803.

PATCH 5 adds support for the AXP803 variant in axp20x-rsb mfd driver. It's
said to be applied already by Lee Jones, but I didn't see it in linux-next
now, so it's kept in this series.

PATCH 6 enabled the AXP803 MFD in Pine64 device tree.

PATCH 7 adds devicetree binding for the regulators in AXP803.

PATCH 8 adds support for the regulators in AXP803 in the axp20x-regulator
driver.

PATCH 9 enabled the regulator MFD cell in AXP803.

PATCH 10 adds a DTSI file for AXP803, just like what have been done for other
AXPs.

PATCH 11 enabled the regulators on Pine64.

PATCH 12 enabled Wi-Fi support on Pine64, which required DLDO4 and ELDO1
regulators.

Icenowy Zheng (12):
  arm64: allwinner: a64: enable RSB on A64
  arm64: allwinner: a64: add NMI controller on A64
  dt-bindings: make AXP20X compatible strings one per line
  dt-bindings: add device tree binding for X-Powers AXP803 PMIC
  mfd: axp20x: support AXP803 variant
  arm64: allwinner: a64: add AXP803 node to Pine64 device tree
  dt-bindings: add AXP803's regulator info
  regulator: axp20x-regulator: add support for AXP803
  mfd: axp20x: add axp20x-regulator cell for AXP803
  arm64: allwinner: a64: add DTSI file for AXP803 PMIC
  arm64: allwinner: a64: enable AXP803 regulators for Pine64
  arm64: allwinner: a64: enable Wi-Fi for Pine64

 Documentation/devicetree/bindings/mfd/axp20x.txt   |  40 +++++-
 arch/arm64/boot/dts/allwinner/axp803.dtsi          | 150 ++++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts | 136 ++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  27 ++++
 drivers/mfd/axp20x-rsb.c                           |   1 +
 drivers/mfd/axp20x.c                               |  80 +++++++++++
 drivers/regulator/axp20x-regulator.c               | 153 ++++++++++++++++++---
 include/linux/mfd/axp20x.h                         |  77 ++++++++++-
 8 files changed, 638 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/axp803.dtsi

-- 
2.12.2
