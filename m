From: Yakir Yang <ykk@rock-chips.com>
Subject: [PATCH v1 0/4] Add clock ids for RK3228 HDMI/VOP modules
Date: Wed, 24 Feb 2016 18:05:03 +0800
Message-ID: <1456308303-29706-1-git-send-email-ykk@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Yakir Yang <ykk@rock-chips.com>
List-Id: devicetree@vger.kernel.org


Add clocks ids for RK3228 HDMI/VOP modules which driver already have been
posted.

RK3228 HDMI driver: https://patchwork.kernel.org/patch/7974671
RK3228 VOP driver: https://patchwork.kernel.org/patch/7952591

Yakir Yang (4):
  clk: rockchip: add the new clock ids for RK3228 VOP
  clk: rockchip: set the clock ids for RK3228 VOP
  clk: rockchip: add the new clock ids for RK3228 HDMI
  clk: rockchip: set the clock ids for RK3228 HDMI

 drivers/clk/rockchip/clk-rk3228.c      | 14 +++++++-------
 include/dt-bindings/clock/rk3228-cru.h | 10 ++++++++++
 2 files changed, 17 insertions(+), 7 deletions(-)

-- 
1.9.1
