From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v3 0/3] clk: clock driver for the Marvell Armada AP806
Date: Fri,  4 Mar 2016 13:57:52 +0100
Message-ID: <1457096275-7581-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, linux-arm-kernel@lists.infradead.org, Yehuda Yitschak <yehuday@marvell.com>, Neta Zur Hershkovits <neta@marvell.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Michael, Stephen,

Here is a new version of the clock driver and its DT binding for the
Marvell Armada AP806. As you will see, there is no longer any
reference to the DFX Server and changes in the clock tree compared to
the v2. This is due to the fact that the HW has changed from this
point of view between the test chips and the final revision, and this
new version aims at supporting only the final revision.

We therefore have a very simple DT binding, with one single node that
covers the entire "system controller" registers, associated to one
driver that provides the clocks. This system controller will later be
used to support other features such as pin-muxing, but for now we only
support the clocks aspects of it.

Please let me know if this approach works for you.

Note that this patch series is based on clk-net, because I wanted to
avoid introducing a new use of CLK_IS_ROOT. To do this, I needed the
patches currently in clk-next that remove the need for CLK_IS_ROOT.

Thanks!

Thomas

Thomas Petazzoni (3):
  dt-bindings: arm: add DT binding for Marvell AP806 system controller
  clk: unconditionally recurse into clk/mvebu/
  clk: mvebu: new driver for Armada AP806 system controller

 .../arm/marvell/ap806-system-controller.txt        |  34 +++++++
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/mvebu/Kconfig                          |   3 +
 drivers/clk/mvebu/Makefile                         |   1 +
 drivers/clk/mvebu/ap806-system-controller.c        | 106 +++++++++++++++++++++
 5 files changed, 145 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
 create mode 100644 drivers/clk/mvebu/ap806-system-controller.c

-- 
2.6.4

