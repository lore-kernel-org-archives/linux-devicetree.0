From: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v7, 0/8] Add MediaTek USB3 DRD Driver
Date: Wed, 19 Oct 2016 10:28:19 +0800
Message-ID: <1476844107-31087-1-git-send-email-chunfeng.yun@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Oliver Neukum <oneukum-IBi9RG/b67k@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Alan Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

These patches introduce the MediaTek USB3 dual-role controller
driver.

The driver can be configured as Dual-Role Device (DRD),
Peripheral Only and Host Only (xHCI) modes. It works well
with Mass Storage, RNDIS and g_zero on FS/HS and SS. And it is
tested on MT8173 platform which only contains USB2.0 device IP,
and on MT6290 platform which contains USB3.0 device IP.

Change in v7:
1. split dual-role driver into four patchs
2. remove QMU done tasklet
3. add a bool in xhci_hcd_mtk to signal absence of IPPC

Change in v6:
1. handle endianness of GPD and SETUP data
2. remove dummy error log and return suitable error number
3. cancel delay work when deregiseter driver

Change in v5:
1. modify some comments
2. rename some unsuitable variables
3. add reg-names property for host node
4. add USB_MTU3_DEBUG to control debug messages

Change in v4:
1. fix build errors on non-mediatek platforms
2. provide manual dual-role switch via debugfs instead of sysfs

Change in v3:
1. fix some typo error
2. rename mtu3.txt to mt8173-mtu3.txt

Change in v2:
1. modify binding docs according to suggestions
2. modify some comments and remove some dummy blank lines
3. fix memory leakage


Chunfeng Yun (8):
  dt-bindings: mt8173-xhci: support host side of dual-role mode
  dt-bindings: mt8173-mtu3: add devicetree bindings
  usb: xhci-mtk: make IPPC register optional
  usb: Add MediaTek USB3 DRD driver
  usb: mtu3: Super-Speed Peripheral mode support
  usb: mtu3: host only mode support
  usb: mtu3: dual-role mode support
  arm64: dts: mediatek: add USB3 DRD driver

 .../devicetree/bindings/usb/mt8173-mtu3.txt        |   87 ++
 .../devicetree/bindings/usb/mt8173-xhci.txt        |   54 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   63 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   29 +-
 drivers/usb/Kconfig                                |    2 +
 drivers/usb/Makefile                               |    1 +
 drivers/usb/host/xhci-mtk.c                        |   38 +-
 drivers/usb/host/xhci-mtk.h                        |    1 +
 drivers/usb/mtu3/Kconfig                           |   54 ++
 drivers/usb/mtu3/Makefile                          |   18 +
 drivers/usb/mtu3/mtu3.h                            |  417 +++++++++
 drivers/usb/mtu3/mtu3_core.c                       |  859 +++++++++++++++++++
 drivers/usb/mtu3/mtu3_dr.c                         |  379 +++++++++
 drivers/usb/mtu3/mtu3_dr.h                         |  108 +++
 drivers/usb/mtu3/mtu3_gadget.c                     |  730 ++++++++++++++++
 drivers/usb/mtu3/mtu3_gadget_ep0.c                 |  881 ++++++++++++++++++++
 drivers/usb/mtu3/mtu3_host.c                       |  294 +++++++
 drivers/usb/mtu3/mtu3_hw_regs.h                    |  473 +++++++++++
 drivers/usb/mtu3/mtu3_plat.c                       |  484 +++++++++++
 drivers/usb/mtu3/mtu3_qmu.c                        |  573 +++++++++++++
 drivers/usb/mtu3/mtu3_qmu.h                        |   43 +
 21 files changed, 5561 insertions(+), 27 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/mt8173-mtu3.txt
 create mode 100644 drivers/usb/mtu3/Kconfig
 create mode 100644 drivers/usb/mtu3/Makefile
 create mode 100644 drivers/usb/mtu3/mtu3.h
 create mode 100644 drivers/usb/mtu3/mtu3_core.c
 create mode 100644 drivers/usb/mtu3/mtu3_dr.c
 create mode 100644 drivers/usb/mtu3/mtu3_dr.h
 create mode 100644 drivers/usb/mtu3/mtu3_gadget.c
 create mode 100644 drivers/usb/mtu3/mtu3_gadget_ep0.c
 create mode 100644 drivers/usb/mtu3/mtu3_host.c
 create mode 100644 drivers/usb/mtu3/mtu3_hw_regs.h
 create mode 100644 drivers/usb/mtu3/mtu3_plat.c
 create mode 100644 drivers/usb/mtu3/mtu3_qmu.c
 create mode 100644 drivers/usb/mtu3/mtu3_qmu.h

-- 
1.7.9.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
