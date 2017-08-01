From: Elaine Zhang <zhangqing@rock-chips.com>
Subject: [PATCH v4 0/2] clk: rockchip: support clk drivers for RK3126 SoC.
Date: Tue,  1 Aug 2017 09:17:02 +0800
Message-ID: <1501550224-6875-1-git-send-email-zhangqing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: mturquette@baylibre.com, sboyd@codeaurora.org, heiko@sntech.de
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, xxx@rock-chips.com, xf@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com, Elaine Zhang <zhangqing@rock-chips.com>
List-Id: devicetree@vger.kernel.org

changed in V4:
modify the document description for rk3126 clock.

changed in V3:
add documentation for rk3126 clock

Elaine Zhang (2):
  clk: rockchip: rk3128: modify rk3128 clk driver to support rk3126
  dt-bindings: add documentation for rk3126 clock

 .../bindings/clock/rockchip,rk3128-cru.txt         |  8 ++-
 drivers/clk/rockchip/clk-rk3128.c                  | 69 +++++++++++++++++-----
 2 files changed, 60 insertions(+), 17 deletions(-)

-- 
1.9.1


