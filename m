From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v6 0/5] support rockchip dwc3 driver
Date: Thu,  7 Jul 2016 10:54:21 +0800
Message-ID: <1467860066-15142-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This series add support for rockchip dwc3 driver,
and add additional optional properties for specific
platforms (e.g., rockchip rk3399 platform).

William Wu (5):
  usb: dwc3: of-simple: add compatible for rockchip rk3399
  usb: dwc3: add dis_u2_freeclk_exists_quirk
  usb: dwc3: add phyif_utmi_quirk
  usb: dwc3: add dis_del_phy_power_chg_quirk
  usb: dwc3: rockchip: add devicetree bindings documentation

 Documentation/devicetree/bindings/usb/dwc3.txt     |  9 ++++
 .../devicetree/bindings/usb/rockchip,dwc3.txt      | 59 ++++++++++++++++++++++
 drivers/usb/dwc3/core.c                            | 29 +++++++++++
 drivers/usb/dwc3/core.h                            | 20 ++++++++
 drivers/usb/dwc3/dwc3-of-simple.c                  |  1 +
 5 files changed, 118 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

-- 
1.9.1
