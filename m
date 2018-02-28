From: Jolly Shah <jolly.shah@xilinx.com>
Subject: [PATCH 0/3] drivers: clk: Add ZynqMp clock driver support
Date: Wed, 28 Feb 2018 14:27:38 -0800
Message-ID: <1519856861-31384-1-git-send-email-jollys@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: rajanv@xilinx.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jolly Shah <jollys@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add clock driver for ZynqMp. 
This patchset has dependency on below drivers:
Firmware Driver:     https://patchwork.kernel.org/patch/10230773/

Jolly Shah (3):
  drivers: clk: Add clk_get_children support
  dt-bindings: clock: Add bindings for ZynqMP clock driver
  drivers: clk: Add ZynqMP clock driver

 .../devicetree/bindings/clock/xlnx,zynqmp-clk.txt  | 163 +++++
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/clk.c                                  |  28 +
 drivers/clk/zynqmp/Kconfig                         |  10 +
 drivers/clk/zynqmp/Makefile                        |   4 +
 drivers/clk/zynqmp/clk-gate-zynqmp.c               | 156 +++++
 drivers/clk/zynqmp/clk-mux-zynqmp.c                | 189 ++++++
 drivers/clk/zynqmp/clkc.c                          | 712 +++++++++++++++++++++
 drivers/clk/zynqmp/divider.c                       | 245 +++++++
 drivers/clk/zynqmp/pll.c                           | 382 +++++++++++
 include/linux/clk-provider.h                       |   1 +
 include/linux/clk/zynqmp.h                         |  45 ++
 13 files changed, 1937 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
 create mode 100644 drivers/clk/zynqmp/Kconfig
 create mode 100644 drivers/clk/zynqmp/Makefile
 create mode 100644 drivers/clk/zynqmp/clk-gate-zynqmp.c
 create mode 100644 drivers/clk/zynqmp/clk-mux-zynqmp.c
 create mode 100644 drivers/clk/zynqmp/clkc.c
 create mode 100644 drivers/clk/zynqmp/divider.c
 create mode 100644 drivers/clk/zynqmp/pll.c
 create mode 100644 include/linux/clk/zynqmp.h

-- 
2.7.4
