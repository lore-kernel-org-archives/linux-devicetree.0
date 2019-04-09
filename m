From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 0/3] rockchip: A few clock cleanups for rk3288
Date: Tue,  9 Apr 2019 13:47:04 -0700
Message-ID: <20190409204707.150347-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Caesar Wang <caesar.wang@rock-chips.com>, linux-rockchip@lists.infradead.org, mka@chromium.org, ryandcase@chromium.org, Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org


This series contains a few misc clock cleanups for Rockchip rk3288
found by comparing to what's in the downstream Chrome OS 3.14 kernel.

NOTES:
* The PWM patches could go in separately from the revert but that
  would cause a merge conflict which is why they're together in a
  series.
* Having the PWM marked as a critical clock _definitely_ needs to land
  before switching the clock in the device tree.


Caesar Wang (1):
  ARM: dts: rockchip: fix PWM clock found on RK3288 Socs

Douglas Anderson (2):
  Revert "clk: rockchip: mark noc and some special clk as critical on
    rk3288"
  clk: rockchip: Make rkpwm a critical clock on rk3288

 arch/arm/boot/dts/rk3288.dtsi     |  8 ++++----
 drivers/clk/rockchip/clk-rk3288.c | 17 ++++++-----------
 2 files changed, 10 insertions(+), 15 deletions(-)

-- 
2.21.0.392.gf8f6787159e-goog
