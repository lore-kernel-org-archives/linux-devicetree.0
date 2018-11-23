Return-Path: <SRS0=DtIy=OC=bootlin.com=miquel.raynal@kernel.org>
From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 0/4] Prepare Armada 3700 PCIe suspend to RAM support
Date: Fri, 23 Nov 2018 10:44:39 +0100
Message-Id: <20181123094444.27956-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Antoine Tenart <antoine.tenart@bootlin.com>, Gregory Clement <gregory.clement@bootlin.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Nadav Haklai <nadavh@marvell.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-ID: <devicetree@vger.kernel.org>

Hello,

As part of an effort to bring suspend to RAM support to the Armada
3700 SoC (main target: ESPRESSObin board), there are small things to
do in the Armada 3700 peripherals clock driver:

* On this SoC, the PCIe controller gets fed by a gated clock in the
  south bridge. This clock is missing in the current driver, patch 1
  adds it.

* Because of a constraint in the PCI core, the resume function of a
  PCIe controller driver must be run at an early stage
  (->suspend/resume_noirq()), before the core tries to ->read/write()
  in the PCIe registers to do more configuration. Hence, the PCIe
  clock must be resumed before. This is enforced thanks to two
  changes:
  1/ Add device links to the clock framework. This enforce order in
     the PM core: the clocks are resumed before the consumers. Series
     has been posted, see [1].
  2/ Even with the above feature, the clock's resume() callback is
     called after the PCI controller's resume_noirq() callback. The
     only way to fix this is to change the "priority" of the clock
     suspend/resume callbacks. This is done in patch 2.

* The bindings are updated with the PCI clock in patch 4 while patch 3
  is just a typo correction in the same file.

If there is anything unclear please feel free to ask.

[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/614527.html

Thanks,
Miquèl


Miquel Raynal (4):
  clk: mvebu: armada-37xx-periph: add PCIe gated clock
  clk: mvebu: armada-37xx-periph: change suspend/resume time
  dt-bindings: clk: armada3700: fix typo in SoC name
  dt-bindings: clk: armada3700: document the PCIe clock

 .../devicetree/bindings/clock/armada3700-periph-clock.txt   | 5 +++--
 drivers/clk/mvebu/armada-37xx-periph.c                      | 6 ++++--
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
2.19.1
