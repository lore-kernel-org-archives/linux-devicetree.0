From: Eddie Cai <eddie.cai.linux@gmail.com>
Subject: [PATCH 0/2] correct id for clk_testout1
Date: Wed, 19 Apr 2017 15:30:21 +0800
Message-ID: <20170419073023.1921-1-eddie.cai.linux@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, zhengxing@rock-chips.com, zyw@rock-chips.com, hl@rock-chips.com, mturquette@baylibre.com, sboyd@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, Eddie Cai <eddie.cai.linux@gmail.com>
List-Id: devicetree@vger.kernel.org

the id for clk_testout1 is wrong, it's time to correct it. 

Eddie Cai (2):
  clk: rockchip: add SCLK_TESTCLKOUT1 id
  clk: rockchip: fix the incorrect id for clk_testout1

 drivers/clk/rockchip/clk-rk3399.c      | 2 +-
 include/dt-bindings/clock/rk3399-cru.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

-- 
2.10.2
