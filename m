From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v3 0/7] Add more clock compatible features and support the RK3399 clock
Date: Wed,  9 Mar 2016 10:37:00 +0800
Message-ID: <1457491027-30936-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi,
  The patch series add support more mux parameters and multiple
clock providers for the rockchip features of the clock framework,
and support the clock controller for the RK3399.


Changes in v3:
- rename pclkin_cif to pclkin_cifmux, add diagram and comment for
  pclkin_cifmux
- add the clk_test node
- modify the cif_testout path
- include two new patches that dt-bindings and header file from
  Jianqun's patch series

Changes in v2:
- rename the aplll/apllb to lpll/bpll
- add drv/sample clock nodes for sdmmc/sdio

Xing Zheng (7):
  dt-bindings: add bindings for rk3399 clock controller
  clk: rockchip: add dt-binding header for rk3399
  clk: rockchip: add more mux parameters for new pll sources
  clk: rockchip: Add support for multiple clock providers
  clk: rockchip: add new pll-type for rk3399 and similar socs
  clk: rockchip: add a COMPOSITE_FRACMUX_NOGATE type
  clk: rockchip: add clock controller for the RK3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |   82 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-cpu.c                     |   14 +-
 drivers/clk/rockchip/clk-pll.c                     |  309 +++-
 drivers/clk/rockchip/clk-rk3036.c                  |   20 +-
 drivers/clk/rockchip/clk-rk3188.c                  |   54 +-
 drivers/clk/rockchip/clk-rk3228.c                  |   20 +-
 drivers/clk/rockchip/clk-rk3288.c                  |   22 +-
 drivers/clk/rockchip/clk-rk3368.c                  |   27 +-
 drivers/clk/rockchip/clk-rk3399.c                  | 1567 ++++++++++++++++++++
 drivers/clk/rockchip/clk.c                         |  148 +-
 drivers/clk/rockchip/clk.h                         |   98 +-
 include/dt-bindings/clock/rk3399-cru.h             |  720 +++++++++
 13 files changed, 2957 insertions(+), 125 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3399.c
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
1.7.9.5


