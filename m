From: Finley Xiao <finley.xiao@rock-chips.com>
Subject: [PATCH v4 0/3] nvmem: rockchip-efuse: support more rockchip SoCs
Date: Mon, 29 Aug 2016 02:50:07 -0700
Message-ID: <1472464210-30252-1-git-send-email-finley.xiao@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: srinivas.kandagatla@linaro.org, maxime.ripard@free-electrons.com, robh+dt@kernel.org, mark.rutland@arm.com, heiko@sntech.de, linux@armlinux.org.uk, catalin.marinas@arm.com, will.deacon@arm.com, dianders@chromium.org
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, wxt@rock-chips.com, jay.xu@rock-chips.com, huangtao@rock-chips.com, cl@rock-chips.com, tony.xie@rock-chips.com, Finley Xiao <finley.xiao@rock-chips.com>
List-Id: devicetree@vger.kernel.org

As the timing and organization of efuse may be different
between rockchip SoCs, so their read function may be different.
We add different device tree compatible string for rockchip SoCs
to match their own read function.

V3->V4:
- 3/3 change the type of out_value into u32 and buf into u8, their values
  come from register, use u32 and u8 may be more readable. 

Finley Xiao (3):
  nvmem: rockchip-efuse: update compatible strings for Rockchip efuse
  ARM: dts: rockchip: update compatible strings for Rockchip efuse
  nvmem: rockchip-efuse: add rk3399-efuse support

 .../devicetree/bindings/nvmem/rockchip-efuse.txt   |  13 +-
 arch/arm/boot/dts/rk3066a.dtsi                     |   2 +-
 arch/arm/boot/dts/rk3188.dtsi                      |   2 +-
 arch/arm/boot/dts/rk3288.dtsi                      |   2 +-
 drivers/nvmem/rockchip-efuse.c                     | 131 ++++++++++++++++++---
 5 files changed, 126 insertions(+), 24 deletions(-)

-- 
1.9.1
