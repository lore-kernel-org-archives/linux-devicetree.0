From: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/8] Bugs fixes and improvements to Broadcom BDC driver
Date: Tue, 27 Jun 2017 14:23:18 -0400
Message-ID: <1498587806-24781-1-git-send-email-alcooperx@gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Al Cooper <alcooperx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, yuan linyu <Linyu.Yuan-cfy2TCaE7SHLM0G2K2Xlo2/U75nxZMCp@public.gmane.org>, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "open list:USB SUBSYSTEM" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org
List-Id: devicetree@vger.kernel.org

Bug fixes and improvements to the USB Broadcom Device
Controller (BDC) driver.

Al Cooper (7):
  usb: gadget: bdc: Fix misleading register names
  usb: bdc: Add Device Tree binding document for Broadcom BDC driver
  usb: bdc: Add clock enable for new chips with a separate BDC clock
  usb: bdc: Small code cleanup
  usb: bdc: Add support for suspend/resume
  usb: bdc: fix "xsf for ep not enabled" errror
  usb: bdc: Enable in Kconfig for ARCH_BRCMSTB systems

Florian Fainelli (1):
  usb: gadget: bdc: hook a quick Device Tree compatible string

 .../devicetree/bindings/usb/brcm,bdc-udc.txt       | 28 ++++++++
 drivers/usb/gadget/udc/bdc/Kconfig                 |  1 +
 drivers/usb/gadget/udc/bdc/bdc.h                   | 17 ++---
 drivers/usb/gadget/udc/bdc/bdc_core.c              | 74 ++++++++++++++++++++--
 drivers/usb/gadget/udc/bdc/bdc_dbg.c               | 16 ++---
 drivers/usb/gadget/udc/bdc/bdc_ep.c                |  4 +-
 drivers/usb/gadget/udc/bdc/bdc_udc.c               |  7 +-
 7 files changed, 119 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/brcm,bdc-udc.txt

-- 
1.9.0.138.g2de3478

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
