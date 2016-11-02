From: William Wu <wulf@rock-chips.com>
Subject: [PATCH 0/2] support USB2 PHY OTG port for rk3399
Date: Wed,  2 Nov 2016 15:42:16 +0800
Message-ID: <1478072538-32081-1-git-send-email-wulf@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, frank.wang@rock-chips.com, huangtao@rock-chips.com, dianders@google.com, briannorris@google.com, groeck@google.com, wulf@rock-chips.com
List-Id: devicetree@vger.kernel.org

This series add support for rk3399 USB2 PHY0 and PHY1 OTG port.
rk3399 has two USB2 PHYs, and each USB2 PHY is comprised of one
Host port and one OTG port. We have supported Host port before,
and try to support OTG port now.

Test on rk3399-evb board.

William Wu (2):
  phy: rockchip-inno-usb2: support otg-port for rk3399
  arm64: dts: rockchip: add usb2-phy otg-port support for rk3399

 arch/arm64/boot/dts/rockchip/rk3399.dtsi |  21 ++
 drivers/phy/phy-rockchip-inno-usb2.c     | 609 +++++++++++++++++++++++++++++--
 2 files changed, 599 insertions(+), 31 deletions(-)

-- 
2.0.0
