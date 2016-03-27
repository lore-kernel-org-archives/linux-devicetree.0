From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v4 0/5] clk: mvebu: clock drivers for Marvell Armada 7K/8K
Date: Sun, 27 Mar 2016 11:26:12 +0200
Message-ID: <1459070777-18049-1-git-send-email-thomas.petazzoni@free-electrons.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Kumar Gala <galak@codeaurora.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Hanna Hawa <hannah@marvell.com>, linux-arm-kernel@lists.infradead.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
List-Id: devicetree@vger.kernel.org

Hello,

Here is a new version of the clock drivers for the Marvell Armada
7K/8K. Changes since v3:

 - Addition of a driver for the CP110 system controller, which
   provides clocks. The CP110 is the other big HW block contained in
   the Armada 7K/8K, next to the AP806.

 - Everything rebase on v4.6-rc1.

 - Addition of Rob Herring Acked-by on the AP806 DT bindings.

 - Minor adjustements to the A806 DT binding documentation: the
   proposed clock names have been changed with a "ap-" suffix, so that
   we don't have any naming conflicts between the clocks provided by
   the AP806 and the clocks provided by the CP110. Since only the
   proposed clock names were changed, I kept Rob Herring
   Acked-by. Rob, let me know if there is any issue with this.

Thanks!

Thomas

Thomas Petazzoni (5):
  clk: unconditionally recurse into clk/mvebu/
  dt-bindings: arm: add DT binding for Marvell AP806 system controller
  clk: mvebu: new driver for Armada AP806 system controller
  dt-bindings: arm: add DT binding for Marvell CP110 system controller
  clk: mvebu: new driver for Armada CP110 system controller

 .../arm/marvell/ap806-system-controller.txt        |  35 +++
 .../arm/marvell/cp110-system-controller0.txt       |  88 +++++++
 drivers/clk/Makefile                               |   2 +-
 drivers/clk/mvebu/Kconfig                          |   6 +
 drivers/clk/mvebu/Makefile                         |   2 +
 drivers/clk/mvebu/ap806-system-controller.c        | 106 +++++++++
 drivers/clk/mvebu/cp110-system-controller.c        | 265 +++++++++++++++++++++
 7 files changed, 503 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
 create mode 100644 Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
 create mode 100644 drivers/clk/mvebu/ap806-system-controller.c
 create mode 100644 drivers/clk/mvebu/cp110-system-controller.c

-- 
2.6.4

