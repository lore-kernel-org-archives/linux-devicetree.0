From: Caesar Wang <wxt@rock-chips.com>
Subject: [PATCH 0/3] Add the rk3368 evb board with the act8846 pmic
Date: Tue,  1 Dec 2015 17:13:23 +0800
Message-ID: <1448961206-23769-1-git-send-email-wxt@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, Caesar Wang <wxt@rock-chips.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Stephen Boyd <sboyd@codeaurora.org>, Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, linux-kernel@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Roger Chen <roger.chen@rock-chips.com>, Pawel Moll <pawel.moll@arm.com>, Yunzhi Li <lyz@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Romain Perier <romain.perier@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This series pacthes try to add the evb dts for rk3368 SoCs,
This's similar with the rj3288 evb board.

On the moment, pwm/backlight/usb/thermal/emmc stuff can work for this
board, I add the base version for the future firstly.

PATCH [1/3]: Force rk3368 PWM clock (and its parents) On
That's similar HACK way to work.

PATCH [2/3]: Add the RK3368 EVB board for with the act8846 pmic for dtsi

PATCH [3/3]: Add the PWM node info for rk3368 core.



Caesar Wang (3):
  clk: rockchip: Force rk3368 PWM clock (and its parents) on
  arm64: dts: rockchip: add rk3368 evaluation board
  arm64: dts: rockchip: add the pwm node info for RK3368 SoCs

 arch/arm64/boot/dts/rockchip/Makefile              |   2 +-
 .../arm64/boot/dts/rockchip/rk3368-evb-act8846.dts | 173 +++++++++++++
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi       | 286 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |  60 +++++
 drivers/clk/rockchip/clk-rk3368.c                  |   9 +
 5 files changed, 529 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi

-- 
1.9.1
