From: Mesih Kilinc <mesihkilinc@gmail.com>
Subject: [PATCH 0/7] Timer & SPI support for Allwinner suniv F1C100s
Date: Mon, 11 Feb 2019 12:21:06 +0300
Message-ID: <cover.1549875778.git.mesihkilinc@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Cc: Mesih Kilinc <mesihkilinc@gmail.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, Linus Walleij <linus.walleij@linaro.org>, Icenowy Zheng <icenowy@aosc.io>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

This is followup series for F1C100s initial support patchset. 
All patches merged except patch 1 ~ 2 which is related to timer.
I am resending those since they are already have Acked tags.

Our dt-bindings for F1C100s are merged, we can now use them at our 
device tree source - patch 3.

Also this series add spi support and enables spi flash at Lichee-pi Nano
in patch 4 ~ 7. This patches are based on Icenowy's work.

Thanks!

Mesih Kilinc (7):
  dt-bindings: timer: Add Allwinner suniv timer
  clocksource: sun4i: add a compatible for suniv
  ARM: dts: suniv: Add dt-binding headers for F1C100s
  dt-bindings: spi: Add Support for Allwinner F1C100s
  ARM: dts: suniv: Add SPI device-tree nodes
  ARM: dts: suniv: Add pinmux for SPI0 and SPI1 of F1C100s
  ARM: dts: f1c100s: Activate SPI flash on Lichee Pi Nano

 .../devicetree/bindings/spi/spi-sun6i.txt          |  5 +-
 .../bindings/timer/allwinner,sun4i-timer.txt       |  4 +-
 arch/arm/boot/dts/suniv-f1c100s-licheepi-nano.dts  | 13 ++++++
 arch/arm/boot/dts/suniv-f1c100s.dtsi               | 53 +++++++++++++++++++---
 drivers/clocksource/timer-sun4i.c                  |  5 +-
 5 files changed, 70 insertions(+), 10 deletions(-)

-- 
2.7.4
