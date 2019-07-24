From: Chuanhong Guo <gch981213@gmail.com>
Subject: [PATCH v2 0/6] MIPS: ralink: add CPU clock detection for MT7621
Date: Wed, 24 Jul 2019 10:23:04 +0800
Message-ID: <20190724022310.28010-1-gch981213@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, "open list:MIPS" <linux-mips@vger.kernel.org>, "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>, John Crispin <john@phrozen.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Weijie Gao <hackpascal@gmail.com>, NeilBrown <neil@brown.name>, Chuanhong Guo <gch981213@gmail.com>
List-Id: devicetree@vger.kernel.org

This patchset ports CPU clock detection for MT7621 from OpenWrt.

Last time I sent this, I forgot to add an binding include which
caused a compile error and the patch doesn't stay in linux-next.

This patchset resent the first two commits and also added binding
documentation for mt7621-pll and used it in mt7621-dts at
drivers/staging.

Changes since v1:
1. changed commit title prefix for dt include
2. split the patch adding clock node (details in that patch body)
3. drop useless syscon in dt documentation
4. drop cpuclock node for gbpc1

Chuanhong Guo (6):
  dt-bindings: clock: add dt binding header for mt7621-pll
  MIPS: ralink: drop ralink_clk_init for mt7621
  MIPS: ralink: add clock device providing cpu/bus clock for mt7621
  dt: bindings: add mt7621-pll dt binding documentation
  staging: mt7621-dts: fix register range of memc node in mt7621.dtsi
  staging: mt7621-dts: add dt nodes for mt7621-pll

 .../bindings/clock/mediatek,mt7621-pll.txt    | 18 ++++
 arch/mips/include/asm/mach-ralink/mt7621.h    | 20 ++++
 arch/mips/ralink/mt7621.c                     | 98 +++++++++++++------
 drivers/staging/mt7621-dts/gbpc1.dts          |  5 -
 drivers/staging/mt7621-dts/mt7621.dtsi        | 17 ++--
 include/dt-bindings/clock/mt7621-clk.h        | 14 +++
 6 files changed, 126 insertions(+), 46 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/mediatek,mt7621-pll.txt
 create mode 100644 include/dt-bindings/clock/mt7621-clk.h

-- 
2.21.0
