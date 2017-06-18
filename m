From: Chunyan Zhang <chunyan.zhang@spreadtrum.com>
Subject: [PATCH V1 0/9] add clock driver for Spreadtrum platforms
Date: Sun, 18 Jun 2017 09:58:46 +0800
Message-ID: <20170618015855.27738-1-chunyan.zhang@spreadtrum.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Xiaolong Zhang <xiaolong.zhang@spreadtrum.com>, Orson Zhai <orson.zhai@spreadtrum.com>, Geng Ren <geng.ren@spreadtrum.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Chunyan Zhang <chunyan.zhang@spreadtrum.com>
List-Id: devicetree@vger.kernel.org

In the last cycle, the patches support Whale2 sc9860 mobile chip have been
merged. This patchset adds clock driver which is used on almost all
Spreadtrum SoCs.

This is a rewrite of Spreadtrum's original clock driver[1] according to the
comments[2] from Stephen Boyd.

This series also adds Spreadtrum clock binding documentation and devicetree
data.

Any comments would be greatly appreciated.

Thanks,
Chunyan

[1] https://lwn.net/Articles/722739/
[2] https://www.spinics.net/lists/arm-kernel/msg582017.html

Chunyan Zhang (9):
  dt-bindings: Add Spreadtrum CCU binding documentation
  clk: sprd: Add common infrastructure
  clk: sprd: add gate clock support
  clk: sprd: add mux clock support
  clk: sprd: add divider clock support
  clk: sprd: add composite clock support
  clk: sprd: add adjustable pll support
  clk: sprd: add clock support for SC9860
  arm64: dts: add ccu for SC9860

 .../devicetree/bindings/clock/sprd-ccu.txt         |   46 +
 arch/arm64/boot/dts/sprd/sc9860-ccu.dtsi           |   67 +
 arch/arm64/boot/dts/sprd/sc9860.dtsi               |    2 +
 arch/arm64/boot/dts/sprd/whale2.dtsi               |    8 -
 drivers/clk/Makefile                               |    1 +
 drivers/clk/sprd/Makefile                          |    4 +
 drivers/clk/sprd/ccu-sc9860.c                      | 1742 ++++++++++++++++++++
 drivers/clk/sprd/ccu-sc9860.h                      |  379 +++++
 drivers/clk/sprd/ccu_common.c                      |   78 +
 drivers/clk/sprd/ccu_common.h                      |   90 +
 drivers/clk/sprd/ccu_composite.c                   |   62 +
 drivers/clk/sprd/ccu_composite.h                   |   47 +
 drivers/clk/sprd/ccu_div.c                         |   93 ++
 drivers/clk/sprd/ccu_div.h                         |   77 +
 drivers/clk/sprd/ccu_gate.c                        |  102 ++
 drivers/clk/sprd/ccu_gate.h                        |   73 +
 drivers/clk/sprd/ccu_mux.c                         |   82 +
 drivers/clk/sprd/ccu_mux.h                         |   63 +
 drivers/clk/sprd/ccu_pll.c                         |  241 +++
 drivers/clk/sprd/ccu_pll.h                         |  123 ++
 include/dt-bindings/clock/sc9860-ccu.h             |   19 +
 21 files changed, 3391 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/sprd-ccu.txt
 create mode 100644 arch/arm64/boot/dts/sprd/sc9860-ccu.dtsi
 create mode 100644 drivers/clk/sprd/Makefile
 create mode 100644 drivers/clk/sprd/ccu-sc9860.c
 create mode 100644 drivers/clk/sprd/ccu-sc9860.h
 create mode 100644 drivers/clk/sprd/ccu_common.c
 create mode 100644 drivers/clk/sprd/ccu_common.h
 create mode 100644 drivers/clk/sprd/ccu_composite.c
 create mode 100644 drivers/clk/sprd/ccu_composite.h
 create mode 100644 drivers/clk/sprd/ccu_div.c
 create mode 100644 drivers/clk/sprd/ccu_div.h
 create mode 100644 drivers/clk/sprd/ccu_gate.c
 create mode 100644 drivers/clk/sprd/ccu_gate.h
 create mode 100644 drivers/clk/sprd/ccu_mux.c
 create mode 100644 drivers/clk/sprd/ccu_mux.h
 create mode 100644 drivers/clk/sprd/ccu_pll.c
 create mode 100644 drivers/clk/sprd/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/sc9860-ccu.h

-- 
2.7.4
