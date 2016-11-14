From: William Wu <wulf@rock-chips.com>
Subject: [PATCH v3 0/2] phy: rockchip-inno-usb2: correct 480MHz clk_ops callbacks and stable time
Date: Mon, 14 Nov 2016 17:27:09 +0800
Message-ID: <1479115631-20137-1-git-send-email-wulf@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kishon@ti.com, heiko@sntech.de
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, robh+dt@kernel.org, frank.wang@rock-chips.com, huangtao@rock-chips.com, dianders@google.com, briannorris@google.com, groeck@google.com, wulf@rock-chips.com
List-Id: devicetree@vger.kernel.org

This series try to correct the 480MHz output clock of USB2 PHY
clk_ops callback and fix the delay time. It aims to make the
480MHz clock gate more sensible and stable.

Tested on rk3366/rk3399 EVB board.

William Wu (2):
  phy: rockchip-inno-usb2: correct clk_ops callback
  phy: rockchip-inno-usb2: correct 480MHz output clock stable time

 drivers/phy/phy-rockchip-inno-usb2.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

-- 
2.0.0
