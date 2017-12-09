From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/7] Add USB remote wakeup driver
Date: Sat, 9 Dec 2017 16:45:29 +0800
Message-ID: <1512809136-2779-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, Jean Delvare <jdelvare-l3A5Bk7waGM@public.gmane.org>, Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

    These patches introduce the SSUSB and SPM glue layer driver which is
used to support usb remote wakeup. Usually the glue layer is put into
a system controller, such as PERICFG module.
    The old way to support usb wakeup is put into SSUSB controller drivers,
including xhci-mtk driver and mtu3 driver, but there are some problems:
    1. can't disdinguish the relation between glue layer and SSUSB IP
       when SoCs supports multi SSUSB IPs;
    2. duplicated code for wakeup are put into both xhci-mtk and mtu3
       drivers;
    3. the glue layer may vary on different SoCs with SSUSB IP, and will
       make SSUSB controller drivers complicated;
    In order to resolve these problems, it's useful to make the glue layer
transparent by extracting a seperated driver, meanwhile to reduce the
duplicated code and simplify SSUSB controller drivers.

Changes from v1:
 * Introduce USB remote wakeup driver
 * Use the new way to support remote wakeup for SSUSB controller drivers
 * Add binding document for USB remote wakeup driver
 * Update binding documents of SSUSB controller drivers
 * Update DTS of MT8173 platform

Chunfeng Yun (7):
  soc: mediatek: Add USB wakeup driver
  dt-bindings: soc: mediatek: add bindings document for USB wakeup
  usb: xhci-mtk: use APIs of mtu_wakeup to support remote wakeup
  usb: mtu3: use APIs of mtu_wakeup to support remote wakeup
  dt-bindings: usb: mtk-xhci: add USB wakeup properties
  dt-bindings: usb: mtu3: add USB wakeup properties
  arm64: dts: mt8173: add uwk node and remove unused usb property

 .../bindings/soc/mediatek/usb-wakeup.txt           |  77 +++
 .../devicetree/bindings/usb/mediatek,mtk-xhci.txt  |  15 +-
 .../devicetree/bindings/usb/mediatek,mtu3.txt      |  14 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |  28 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |  16 +-
 drivers/soc/mediatek/Kconfig                       |   8 +
 drivers/soc/mediatek/Makefile                      |   1 +
 drivers/soc/mediatek/mtk-usb-wakeup.c              | 519 +++++++++++++++++++++
 drivers/usb/host/xhci-mtk.c                        |  39 +-
 drivers/usb/host/xhci-mtk.h                        |   2 +
 drivers/usb/mtu3/mtu3.h                            |   2 +
 drivers/usb/mtu3/mtu3_host.c                       |  39 +-
 include/dt-bindings/soc/mediatek,usb-wakeup.h      |  15 +
 include/linux/soc/mediatek/usb-wakeup.h            |  88 ++++
 14 files changed, 803 insertions(+), 60 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/mediatek/usb-wakeup.txt
 create mode 100644 drivers/soc/mediatek/mtk-usb-wakeup.c
 create mode 100644 include/dt-bindings/soc/mediatek,usb-wakeup.h
 create mode 100644 include/linux/soc/mediatek/usb-wakeup.h

-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
