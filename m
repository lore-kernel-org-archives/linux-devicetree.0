From: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v3 0/3] clk: add driver for the SiFive FU540 PRCI and PLLs it controls
Date: Thu, 11 Apr 2019 01:26:16 -0700
Message-ID: <20190411082618.3502-1-paul.walmsley@sifive.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com
Cc: Paul Walmsley <paul.walmsley@sifive.com>
List-Id: devicetree@vger.kernel.org

clk: add driver for the SiFive FU540 PRCI and PLLs it controls

Add a driver for the SiFive FU540 PRCI IP block, which handles clock and
some device reset control for the SiFive FU540 chip.  Also add a driver-
independent library for the Analog Bits Wide-Range PLL (WRPLL), used by
the PRCI driver to monitor and control the WRPLL instances on the FU540
chip.

Boot-tested on a SiFive HiFive Unleashed board, using BBL and the
open-source FSBL with a mainline-focused DTB.

This third version incorporates changes requested by Stephen Boyd
<sboyd@kernel.org> and Rob Herring <robh@kernel.org>.

This patch series is also available, along with the DT macro prerequisite
patch, at:

https://github.com/sifive/riscv-linux/tree/dev/paulw/prci-v5.1-rc4


- Paul


Paul Walmsley (3):
  clk: analogbits: add Wide-Range PLL library
  dt-bindings: clk: add documentation for the SiFive PRCI driver
  clk: sifive: add a driver for the SiFive FU540 PRCI IP block

 .../bindings/clock/sifive/fu540-prci.txt      |  46 ++
 MAINTAINERS                                   |   6 +
 drivers/clk/Kconfig                           |   2 +
 drivers/clk/Makefile                          |   2 +
 drivers/clk/analogbits/Kconfig                |   2 +
 drivers/clk/analogbits/Makefile               |   1 +
 drivers/clk/analogbits/wrpll-cln28hpc.c       | 360 ++++++++++
 drivers/clk/sifive/Kconfig                    |  18 +
 drivers/clk/sifive/Makefile                   |   1 +
 drivers/clk/sifive/fu540-prci.c               | 630 ++++++++++++++++++
 include/linux/clk/analogbits-wrpll-cln28hpc.h |  96 +++
 11 files changed, 1164 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sifive/fu540-prci.txt
 create mode 100644 drivers/clk/analogbits/Kconfig
 create mode 100644 drivers/clk/analogbits/Makefile
 create mode 100644 drivers/clk/analogbits/wrpll-cln28hpc.c
 create mode 100644 drivers/clk/sifive/Kconfig
 create mode 100644 drivers/clk/sifive/Makefile
 create mode 100644 drivers/clk/sifive/fu540-prci.c
 create mode 100644 include/linux/clk/analogbits-wrpll-cln28hpc.h

-- 
2.20.1
