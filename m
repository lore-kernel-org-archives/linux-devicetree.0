From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v11 0/5] support rockchip dwc3 driver
Date: Tue, 16 Aug 2016 22:44:35 +0800
Message-ID: <1471358680-30857-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, zhengsq@rock-chips.com, zyw@rock-chips.com, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This series add support for rockchip DWC3 driver,
and add additional optional properties for specific
platforms (e.g., rockchip rk3399 platform).

The DesignWare USB3 integrated in rockchip SoCs is
a configurable IP Core which can be instantiated as
Dual-Role Device (DRD), Host Only (XHCI) and Peripheral
Only configurations.

The current driver supports Host only and Peripheral Only,
for now, and we can add support for DRD after dwc3 driver
adds generic handling of DRD.

William Wu (5):
  usb: dwc3: of-simple: add compatible for rockchip rk3399
  usb: dwc3: add dis_u2_freeclk_exists_quirk
  usb: dwc3: make usb2 phy utmi interface configurable
  usb: dwc3: add dis_del_phy_power_chg_quirk
  usb: dwc3: rockchip: add devicetree bindings documentation

 Documentation/devicetree/bindings/usb/dwc3.txt     |  5 ++
 Documentation/devicetree/bindings/usb/generic.txt  |  6 +++
 .../devicetree/bindings/usb/rockchip,dwc3.txt      | 59 ++++++++++++++++++++++
 drivers/usb/dwc3/core.c                            | 28 ++++++++++
 drivers/usb/dwc3/core.h                            | 20 ++++++++
 drivers/usb/dwc3/dwc3-of-simple.c                  |  1 +
 6 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt

-- 
1.9.1
