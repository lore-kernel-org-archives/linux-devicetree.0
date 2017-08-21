From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v3 0/3] Add usb3 ctrl node on RK3328 SoCs and enable usb3 host on RK3328 evb
Date: Mon, 21 Aug 2017 21:36:03 +0800
Message-ID: <1503322566-31489-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: heiko@sntech.de, balbi@kernel.org, gregkh@linuxfoundation.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, frank.wang@rock-chips.com, huangtao@rock-chips.com, daniel.meng@rock-chips.com, william.wu@rock-chips.com
List-Id: devicetree@vger.kernel.org

This series add support for usb3 controller on RK3328 SoCs.
This series don't include usb3 phy patches, and I will try
to submit usb3 phy patches individually later.

Tested on RK3328 evaluation board.

William Wu (3):
  dt-bindings: usb: add DT binding for RK3328 dwc3 controller
  arm64: dts: rockchip: add usb3 controller node for RK3328 SoCs
  arm64: dts: rockchip: enable usb3 for RK3328 evaluation board

 .../devicetree/bindings/usb/rockchip,dwc3.txt      |  4 +++-
 arch/arm64/boot/dts/rockchip/rk3328-evb.dts        |  9 ++++++++
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           | 27 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 1 deletion(-)

-- 
2.0.0
