From: Jeffy Chen <jeffy.chen@rock-chips.com>
Subject: [PATCH v2 0/4] Add support for rk3228 Soc platform
Date: Fri, 11 Dec 2015 09:30:48 +0800
Message-ID: <1449797452-19389-1-git-send-email-jeffy.chen@rock-chips.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
To: heiko@sntech.de, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jeffy Chen <jeffy.chen@rock-chips.com>, devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>, linux-gpio@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This serial of patches add dts/pinctrl/clock-tree/doc for rk3228
platform, with these patches, my evb board could boot into initramfs.

Changes in v2:
Fix some clock tree errors.
Fix some coding styles.

Separate board and core properties.
Remove phy clocks.
Order nodes by register address.
Add vgic registers and interrupt.

Move board properties into board dts.

Jeffy Chen (4):
  pinctrl: rockchip: add support for the rk3228
  rockchip: add clock controller for rk3228
  ARM: dts: rockchip: add core rk3228 dtsi
  ARM: dts: rockchip: add rk3228-evb board

 .../bindings/pinctrl/rockchip,pinctrl.txt          |   3 +-
 arch/arm/boot/dts/Makefile                         |   1 +
 arch/arm/boot/dts/rk3228-evb.dts                   |  66 ++
 arch/arm/boot/dts/rk3228.dtsi                      | 442 +++++++++++++
 drivers/clk/rockchip/Makefile                      |   1 +
 drivers/clk/rockchip/clk-rk3228.c                  | 681 +++++++++++++++++++++
 drivers/clk/rockchip/clk.h                         |  11 +-
 drivers/pinctrl/pinctrl-rockchip.c                 |  53 ++
 8 files changed, 1256 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm/boot/dts/rk3228-evb.dts
 create mode 100644 arch/arm/boot/dts/rk3228.dtsi
 create mode 100644 drivers/clk/rockchip/clk-rk3228.c

-- 
2.1.4


