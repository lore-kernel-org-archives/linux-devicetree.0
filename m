From: Al Cooper <alcooperx@gmail.com>
Subject: [PATCH V2 0/9] Bug fixes and improvements to Broadcom BDC driver
Date: Wed, 19 Jul 2017 15:11:39 -0400
Message-ID: <1500491508-9783-1-git-send-email-alcooperx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Al Cooper <alcooperx@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Felipe Balbi <balbi@kernel.org>, yuan linyu <Linyu.Yuan@alcatel-sbell.com.cn>, Florian Fainelli <f.fainelli@gmail.com>, "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, bcm-kernel-feedback-list@broadcom.com
List-Id: devicetree@vger.kernel.org

V2 Changes:
- Add support for USB phys. We need to handle systems with either
  a single phy or systems with both a USB2.0 and USB3.0 phy
- Fixes to the dt-bindings document based on feedback from 
  Rob Herring. Changes include changing the compatible base
  name to "brcm,bdc" because "brcm,bdc-udc" seemed redundant
- Add proper suspend/resume support with clock control
- Split out code cleanup into separate patch

Bug fixes and improvements to the Broadcom USB STB BDC driver.

Al Cooper (8):
  usb: bdc: Fix misleading register names
  dt-bindings: usb: bdc: Add Device Tree binding for Broadcom UDC driver
  usb: bdc: Add clock enable for new chips with a separate BDC clock
  usb: bdc: Small code cleanup
  usb: bdc: Add support for suspend/resume
  usb: bdc: fix "xsf for ep not enabled" errror
  usb: bdc: Enable in Kconfig for ARCH_BRCMSTB systems
  usb: bdc: Add support for USB phy

Florian Fainelli (1):
  usb: bdc: hook a quick Device Tree compatible string

 Documentation/devicetree/bindings/usb/brcm,bdc.txt |  29 ++++
 drivers/usb/gadget/udc/bdc/Kconfig                 |   1 +
 drivers/usb/gadget/udc/bdc/bdc.h                   |  24 ++--
 drivers/usb/gadget/udc/bdc/bdc_core.c              | 148 +++++++++++++++++++--
 drivers/usb/gadget/udc/bdc/bdc_dbg.c               |  16 +--
 drivers/usb/gadget/udc/bdc/bdc_ep.c                |   4 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c               |   7 +-
 7 files changed, 197 insertions(+), 32 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc.txt

-- 
1.9.0.138.g2de3478
