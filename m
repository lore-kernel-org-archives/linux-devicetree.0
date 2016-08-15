From: William Wu <william.wu@rock-chips.com>
Subject: [PATCH v9 0/5] support rockchip dwc3 driver
Date: Mon, 15 Aug 2016 14:59:54 +0800
Message-ID: <1471244399-1356-1-git-send-email-william.wu@rock-chips.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, balbi@kernel.org, heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org, briannorris@google.com, dianders@google.com, kever.yang@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com, eddie.cai@rock-chips.com, John.Youn@synopsys.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, zhengsq@rock-chips.com, zyw@rock-chips.com, William Wu <william.wu@rock-chips.com>
List-Id: devicetree@vger.kernel.org

This series add support for rockchip DWC3 driver,
and add additional optional properties for specific
platforms (e.g., rockchip rk3399 platform).

And because rockchip DWC3 need additional handling of
cable events and mode switch to support DRD mode, so
we add a new dwc3-rockchip driver, but not use the
generic of glue layer which merely enable some clocks
and populate its children.

William Wu (5):
  usb: dwc3: add dis_u2_freeclk_exists_quirk
  usb: dwc3: make usb2 phy utmi interface configurable
  usb: dwc3: add dis_del_phy_power_chg_quirk
  usb: dwc3: rockchip: add devicetree bindings documentation
  usb: dwc3: add rockchip specific glue layer

 Documentation/devicetree/bindings/usb/dwc3.txt     |   5 +
 Documentation/devicetree/bindings/usb/generic.txt  |   6 +
 .../devicetree/bindings/usb/rockchip,dwc3.txt      |  71 ++++
 drivers/usb/dwc3/Kconfig                           |   9 +
 drivers/usb/dwc3/Makefile                          |   1 +
 drivers/usb/dwc3/core.c                            |  30 +-
 drivers/usb/dwc3/core.h                            |  21 +
 drivers/usb/dwc3/dwc3-rockchip.c                   | 441 +++++++++++++++++++++
 8 files changed, 583 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/usb/rockchip,dwc3.txt
 create mode 100644 drivers/usb/dwc3/dwc3-rockchip.c

-- 
1.9.1
