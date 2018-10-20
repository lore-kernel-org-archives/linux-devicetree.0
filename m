From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it controls
Date: Sat, 20 Oct 2018 06:38:21 -0700
Message-ID: <20181020133823.27103-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, "Wesley W . Terpstra" <wesley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Megan Wachs <megan@sifive.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
some device reset control for the SiFive FU540 chip.  Also add a driver-
independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
the PRCI driver to monitor and control the WRPLL instances on the FU540
chip.

It's been a long time since I've worked on Linux clock code, so Mike &
Stephen, I'd appreciate a close look at the PRCI driver to make sure
what it's doing makes sense.

Boot-tested on a SiFive HiFive Unleashed board.  COREPLL rate changes
and notification were also tested on the same board.

This patch series is also available at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v4.19-rc7


Paul Walmsley (3):
  clk: analogbits: add Wide-Range PLL library
  dt-bindings: clk: add documentation for the SiFive PRCI driver
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 .../bindings/clock/sifive/fu540-prci.txt      |  40 ++
 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   2 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/analogbits/Kconfig                |   3 +
 drivers/clk/analogbits/Makefile               |   2 +
 drivers/clk/analogbits/wrpll-cln28hpc.c       | 387 +++++++++++
 drivers/clk/sifive/Kconfig                    |  18 +
 drivers/clk/sifive/Makefile                   |   1 +
 drivers/clk/sifive/fu540-prci.c               | 634 ++++++++++++++++++
 include/linux/clk/analogbits-wrpll-cln28hpc.h |  99 +++
 include/linux/clk/sifive-fu540-prci.h         |  27 +
 12 files changed, 1221 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
 create mode 100644 drivers/clk/analogbits/Kconfig
 create mode 100644 drivers/clk/analogbits/Makefile
 create mode 100644 drivers/clk/analogbits/wrpll-cln28hpc.c
 create mode 100644 drivers/clk/sifive/Kconfig
 create mode 100644 drivers/clk/sifive/Makefile
 create mode 100644 drivers/clk/sifive/fu540-prci.c
 create mode 100644 include/linux/clk/analogbits-wrpll-cln28hpc.h
 create mode 100644 include/linux/clk/sifive-fu540-prci.h

Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Wesley W. Terpstra <wesley@sifive.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Megan Wachs <megan@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org

-- 
2.19.1
