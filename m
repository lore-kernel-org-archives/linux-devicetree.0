From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v1 0/2] clk: rockchip: rk3228: add SCLK_SDIO_SRC clk id
Date: Fri, 18 Aug 2017 11:49:23 +0800
Message-ID: <1503028165-27072-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This patch exports sdio src clock for dts reference.

Elaine Zhang (2):
  clk: rockchip: add rk3228 sclk_sdio_src ID
  clk: rockchip: rk3228: add SCLK_SDIO_SRC clk id

 drivers/clk/rockchip/clk-rk3228.c      | 2 +-
 include/dt-bindings/clock/rk3228-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
1.9.1


