Return-Path: <SRS0=kpDl=TC=gmail.com=jonas.gorski@kernel.org>
From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH 0/3] MIPS: BMIPS: add support for gated clock controller
Date: Thu,  2 May 2019 14:26:54 +0200
Message-Id: <20190502122657.15577-1-jonas.gorski@gmail.com>
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mips@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Kevin Cernekee <cernekee@gmail.com>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>, James Hogan <jhogan@kernel.org>
List-ID: <devicetree@vger.kernel.org>

This patchset adds support for the gated clock controller found on most
MIPS based Broadcom BCM63XX SoCs.

The MIPS based BCM63XX SoCs have very little in common with the ARM
based ones, so a separate driver is necessary.

It's a simple register based controller, with one bit per clock, active
high.

Since BCM63XX/MIPS runs in big endian mode, the driver depends on the
series "clk: make register endianness a run-time property", or more
specifically on patch 3, "clk: gate: add explicit big endian support".

Based on the clk-next branch.

Jonas Gorski (3):
  devicetree: document the BCM63XX gated clock bindings
  clk: add BCM63XX gated clock controller driver
  MIPS: BMIPS: add clock controller nodes

 .../bindings/clock/brcm,bcm63xx-clocks.txt         |  22 ++
 arch/mips/boot/dts/brcm/bcm3368.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm63268.dtsi              |  12 +-
 arch/mips/boot/dts/brcm/bcm6328.dtsi               |   6 +
 arch/mips/boot/dts/brcm/bcm6358.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6362.dtsi               |  12 +-
 arch/mips/boot/dts/brcm/bcm6368.dtsi               |  12 +-
 drivers/clk/bcm/Kconfig                            |   8 +
 drivers/clk/bcm/Makefile                           |   1 +
 drivers/clk/bcm/clk-bcm63xx-gate.c                 | 246 +++++++++++++++++++++
 10 files changed, 328 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm63xx-clocks.txt
 create mode 100644 drivers/clk/bcm/clk-bcm63xx-gate.c

-- 
2.13.2
