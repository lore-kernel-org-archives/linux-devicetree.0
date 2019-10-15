From: Jianqun Xu <jay.xu@rock-chips.com>
Subject: [PATCH v3 0/2] pinctrl: rockchip: support rk3308 SoC
Date: Tue, 15 Oct 2019 17:17:06 +0800
Message-ID: <20191015091708.7934-1-jay.xu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jianqun Xu <jay.xu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

Add support for rk3308 SoC from rockchip.

Jianqun Xu (2):
  dt-bindings: pinctrl: rockchip: add rk3308 SoC support
  pinctrl: rockchip: add rk3308 SoC support

 .../bindings/pinctrl/rockchip,pinctrl.txt     |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 382 +++++++++++++++++-
 2 files changed, 382 insertions(+), 1 deletion(-)

-- 
changes since v2:
- Add Acked-by: Rob Herring <robh@kernel.org>

changes since v1:
- Add type case for pull get/set
- Add Reviewed-by: Heiko Stuebner <heiko@sntech.de>


2.17.1
