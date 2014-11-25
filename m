From: Chris Zhong <zyw@rock-chips.com>
Subject: [PATCH 0/2] Increase the maximum cpu frequency of rk3288
Date: Tue, 25 Nov 2014 17:37:31 +0800
Message-ID: <1416908253-31721-1-git-send-email-zyw@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, dianders@chromium.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-rockchip@lists.infradead.org, Chris Zhong <zyw@rock-chips.com>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, linux-kernel@vger.kernel.org, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The maximum cpu frequency of rk3288 can up to 1.8Ghz, but the vdd_cpu need set
to 1.4v. I've tested these patches on rk3288 evb board.


Chris Zhong (2):
  ARM: dts: rockchip: change the max voltage of cpu to 1.4v
  ARM: dts: rk3288: change the max clk of cpu to 1.8Ghz

 arch/arm/boot/dts/rk3288-evb-rk808.dts | 2 +-
 arch/arm/boot/dts/rk3288.dtsi          | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
1.9.1
