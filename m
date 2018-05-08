From: djw@t-chip.com.cn
Subject: [PATCH v0 0/2] Add sdmmc UHS support to ROC-RK3328-CC board
Date: Tue,  8 May 2018 10:48:22 +0800
Message-ID: <1525747704-8537-1-git-send-email-djw@t-chip.com.cn>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-rockchip@lists.infradead.org
Cc: Wayne Chou <zxf@t-chip.com.cn>, Levin Du <djw@t-chip.com.cn>, devicetree@vger.kernel.org, David Wu <david.wu@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, Liang Chen <cl@rock-chips.com>, William Wu <william.wu@rock-chips.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Rocky Hao <rocky.hao@rock-chips.com>, Will Deacon <will.deacon@arm.com>, Joseph Chen <chenjh@rock-chips.com>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, "David S. Miller" <davem@davemloft.net>
List-Id: devicetree@vger.kernel.org

From: Levin Du <djw@t-chip.com.cn>

Hi all,

This is an attemp to add sdmmc UHS support to the ROC-RK3328-CC board.

It adds a new compatible `rockchip,rk3328-gpio-syscon10` to the gpio-syscon
driver,  so that a new gpio controller named `gpio_syscon10` can be defined
and used in the regulator-gpio. This regulator controls the signal voltage of the
sdmmc. It is essential for UHS support which requires 1.8V signal voltage.


Levin Du (2):
  gpio: syscon: Add gpio-syscon for rk3328
  arm64: dts: rockchip: Add sdmmc UHS support for roc-rk3328-cc

 arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dts | 36 ++++++++++++++++++++++++++
 drivers/gpio/gpio-syscon.c                     | 32 +++++++++++++++++++++++
 2 files changed, 68 insertions(+)

-- 
2.7.4
