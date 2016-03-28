From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [PATCH v6 0/3] Add more clock compatible features and support the RK3399 clock
Date: Mon, 28 Mar 2016 17:51:34 +0800
Message-ID: <1459158697-8218-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de, huangtao@rock-chips.com, jay.xu@rock-chips.com, elaine.zhang@rock-chips.com, dianders@chromium.org, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Michael Turquette <mturquette@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi,
  The patch series add support more mux parameters and multiple
clock providers for the rockchip features of the clock framework,
and support the clock controller for the RK3399.


Changes in v6:
- update some clock contents
- fix the source of the pclkin_isp1_wrapper should be pclkin_cif
- remove unused the GRF reference in the clock driver
- use the frac mux type for spdif and i2s
- remove useless defines RK3399_PMU_RSTNHOLD_CON and RK3399_PMU_GATEDIS_CON

Changes in v5:
- add some necessary clock IDs
- keep PPLL independent into the part of the PMUCRU
- fix PMUCRU IDs are out of range
- add clock IDs to drivers reference
- fix some important bugs
- fix configuration for cpu tables

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

Xing Zheng (3):
  dt-bindings: add bindings for rk3399 clock controller
  clk: rockchip: add dt-binding header for rk3399
  clk: rockchip: add clock controller for the RK3399

 .../bindings/clock/rockchip,rk3399-cru.txt         |   68 +
 drivers/clk/rockchip/Makefile                      |    1 +
 drivers/clk/rockchip/clk-rk3399.c                  | 1540 ++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |   22 +-
 include/dt-bindings/clock/rk3399-cru.h             |  752 ++++++++++
 5 files changed, 2382 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/rockchip,rk3399-cru.txt
 create mode 100644 drivers/clk/rockchip/clk-rk3399.c
 create mode 100644 include/dt-bindings/clock/rk3399-cru.h

-- 
1.7.9.5


