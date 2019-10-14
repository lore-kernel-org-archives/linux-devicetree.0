From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v2 0/2] pinctrl: rockchip: support rk3308 SoC
Date: Mon, 14 Oct 2019 08:25:21 +0800
Message-ID: <20191014002523.4540-1-jay.xu@rock-chips.com>
References: <20191012061528.27821-1-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191012061528.27821-1-jay.xu@rock-chips.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jianqun Xu <jay.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add support for rk3308 SoC from rockchip.

Jianqun Xu (2):
  dt-bindings: pinctrl: rockchip: add rk3308 SoC support
  pinctrl: rockchip: add rk3308 SoC support

 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 377 ++++++++++++++++++
 2 files changed, 378 insertions(+)

--
changes since v1:
- add Reviewed-by: Heiko Stuebner <heiko@sntech.de>, thanks Heiko

2.17.1
