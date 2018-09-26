From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH 0/5] Add XHCI, EHCI and OHCI drivers for Broadcom STB SoCs
Date: Wed, 26 Sep 2018 18:20:09 -0400
Message-ID: <1538000414-24873-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alan Stern <stern@rowland.harvard.edu>, Mathias Nyman <mathias.nyman@intel.com>, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, "David S. Miller" <davem@davemloft.net>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dmitry Osipenko <digetx@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Jianguo Sun <sunjianguo1@huawei.com>, James Hogan <jhogan@kernel.org>, Alban Bedel <albeu@free.fr>, Lu Baolu <baolu.lu@linux.intel.com>, Avi Fishman <avifishman70@gmail.com>, Alex Elder <elder@linaro.org>, Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org, dev
List-Id: devicetree@vger.kernel.org

Add XHCI, EHCI and OHCI drivers for Broadcom STB SoCs. These drivers
depend on getting access to the new Broadcom STB USB PHY driver
through a device-tree phandle and will fail if the driver is not
available.

Al Cooper (5):
  dt-bindings: Add Broadcom STB OHCI, EHCI and XHCI binding document
  usb: host: Add OHCI driver for Broadcom STB SoCs
  usb: host: Add EHCI driver for Broadcom STB SoCs
  usb: host: Add XHCI driver for Broadcom STB SoCs
  usb: host: Enable building of new Broadcom STB USB drivers

 .../devicetree/bindings/usb/brcm,ehci-brcm.txt     |  22 ++
 .../devicetree/bindings/usb/brcm,ohci-brcm.txt     |  22 ++
 .../devicetree/bindings/usb/brcm,xhci-brcm.txt     |  23 ++
 MAINTAINERS                                        |   9 +
 drivers/usb/host/Kconfig                           |  27 ++
 drivers/usb/host/Makefile                          |   7 +
 drivers/usb/host/ehci-brcm.c                       | 304 +++++++++++++++++++++
 drivers/usb/host/ohci-brcm.c                       | 204 ++++++++++++++
 drivers/usb/host/xhci-brcm.c                       | 294 ++++++++++++++++++++
 9 files changed, 912 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,ehci-brcm.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,ohci-brcm.txt
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,xhci-brcm.txt
 create mode 100644 drivers/usb/host/ehci-brcm.c
 create mode 100644 drivers/usb/host/ohci-brcm.c
 create mode 100644 drivers/usb/host/xhci-brcm.c

-- 
1.9.0.138.g2de3478
