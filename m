From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH 0/2] Add usb nodes on rk322x SoCs and enable usb on rk3229 evb
Date: Wed, 31 May 2017 09:21:22 +0800
Message-ID: <1496193684-30449-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, frank.wang@rock-chips.com, huangtao@rock-chips.com, daniel.meng@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

This series adds support for usb on rk322x SoCs.

William Wu (2):
  ARM: dts: rockchip: add usb nodes on rk322x
  ARM: dts: rockchip: enable usb for rk3229 evb board

Tested on rk3229 evb board, and depended on the following
patches and config.
[1] https://patchwork.kernel.org/patch/9732473/
[2] https://patchwork.kernel.org/patch/9732475/
[3] https://patchwork.kernel.org/patch/9732481/
[4] https://patchwork.kernel.org/patch/9732479/  
[5] enable CONFIG_PHY_ROCKCHIP_INNO_USB2

 arch/arm/boot/dts/rk3229-evb.dts |  74 +++++++++++++++++++++
 arch/arm/boot/dts/rk322x.dtsi    | 138 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 211 insertions(+), 1 deletion(-)

-- 
2.0.0
