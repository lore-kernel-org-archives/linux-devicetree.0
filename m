From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v2 0/6] clk: mvebu: initial support for AP806 clocks
Date: Wed, 24 Feb 2016 16:14:20 +0100
Message-ID: <1456326866-30854-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, Yehuda Yitschak <yehuday@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

The following set of patches add initial support for the main clocks
found in the AP806 hardware block, which is the central block used in
the newest Marvell 7K and 8K 64-bits processors.

Two new drivers are added, one for the so-called "core" clocks and one
for the "ring" clocks. The latter are child clocks from one of the
core clocks. The "core" clocks are fixed rate clocks, but their rate
is calculated from values in the Sample At Reset register.

Changes since v1:
 - Introduce a minimal DT binding for the AP806 DFX Server register
   area, and make the clock DT nodes child nodes of the DFX server
   node. Implementation-wise, we use the simple-mfd/syscon mechanism.
 - Separate the DT binding documentation into its own patches.

Thanks!

Thomas

Thomas Petazzoni (6):
  dt-bindings: arm/marvell: add DT bindings for AP806 DFX Server
  dt-bindings: clock: add DT bindings for AP806 core clocks
  dt-bindings: clock: add DT bindings for AP806 ring clocks
  clk: unconditionally recurse into clk/mvebu/
  clk: mvebu: add AP806 core clock driver
  clk: mvebu: add AP806 ring clock driver

 .../arm/marvell/marvell,ap806-dfx-server.txt       |  19 ++++
 .../clock/mvebu-armada-ap806-core-clock.txt        |  35 ++++++
 .../clock/mvebu-armada-ap806-ring-clock.txt        |  36 ++++++
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/mvebu/Kconfig                          |   6 +
 drivers/clk/mvebu/Makefile                         |   3 +-
 drivers/clk/mvebu/ap806-core.c                     | 121 +++++++++++++++++++++
 drivers/clk/mvebu/ap806-ring.c                     |  74 +++++++++++++
 8 files changed, 294 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/marvell,ap806-dfx-server.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-armada-ap806-core-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/mvebu-armada-ap806-ring-clock.txt
 create mode 100644 drivers/clk/mvebu/ap806-core.c
 create mode 100644 drivers/clk/mvebu/ap806-ring.c

-- 
2.6.4

