From: Xing Zheng <zhengxing@rock-chips.com>
Subject: [RESEND PATCH v1 0/4] fix some clock configuration for the RK3036 platform
Date: Mon, 28 Dec 2015 17:03:49 +0800
Message-ID: <1451293433-32392-1-git-send-email-zhengxing@rock-chips.com>
Return-path: <linux-clk-owner@vger.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
To: heiko@sntech.de
Cc: keescook@google.com, leozwang@google.com, linux-rockchip@lists.infradead.org, Xing Zheng <zhengxing@rock-chips.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


Hi:
  In the development work, we found that some of the previous incorrect
clock configuration on the RK3036 platform, we should fix them.



Xing Zheng (4):
  clk: rockchip: rk3036: fix the FLAGs for clock mux
  clk: rockchip: rk3036: fix uarts clock error
  clk: rockchip: rk3036: rename emac ext source clock
  clk: rockchip: rk3036: fix and add node id for emac clock

 drivers/clk/rockchip/clk-rk3036.c      |   33 ++++++++++++++++----------------
 include/dt-bindings/clock/rk3036-cru.h |    2 ++
 2 files changed, 19 insertions(+), 16 deletions(-)

-- 
1.7.9.5


