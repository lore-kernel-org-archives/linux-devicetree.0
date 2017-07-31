From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v3 0/2] clk: rockchip: support clk drivers for RK3126 SoC.
Date: Mon, 31 Jul 2017 18:42:06 +0800
Message-ID: <1501497728-7805-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

changed in V3:
add documentation for rk3126 clock

Elaine Zhang (2):
  clk: rockchip: rk3128: modify rk3128 clk driver to support rk3126
  dt-bindings: add documentation for rk3126 clock

 .../bindings/clock/rockchip,rk3128-cru.txt         |  6 +-
 drivers/clk/rockchip/clk-rk3128.c                  | 69 +++++++++++++++++-----
 2 files changed, 58 insertions(+), 17 deletions(-)

-- 
1.9.1


