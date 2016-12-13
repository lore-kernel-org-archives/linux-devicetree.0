From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/3] clk: rockchip: support clk controller for rk3328 SoC
Date: Tue, 13 Dec 2016 16:47:46 +0800
Message-ID: <1481618869-1239-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Elaine Zhang (3):
  clk: rockchip: add dt-binding header for rk3328
  clk: rockchip: add clock controller for rk3328
  clk: rockchip: add new pll-type for rk3328 and similar socs

 drivers/clk/rockchip/Makefile          |    1 +
 drivers/clk/rockchip/clk-pll.c         |   13 +-
 drivers/clk/rockchip/clk-rk3328.c      | 1068 ++++++++++++++++++++++++++++++++
 drivers/clk/rockchip/clk.h             |   23 +
 include/dt-bindings/clock/rk3328-cru.h |  403 ++++++++++++
 5 files changed, 1507 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/rockchip/clk-rk3328.c
 create mode 100644 include/dt-bindings/clock/rk3328-cru.h

-- 
1.9.1
