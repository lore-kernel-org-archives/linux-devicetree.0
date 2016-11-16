From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 0/4] usb: dwc2: Add AHB burst configuration
Date: Wed, 16 Nov 2016 15:47:13 -0800
Message-ID: <cover.1479339900.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a binding for AHB burst, reads it in, and configures
the controller for the specified burst type.

Tested on HAPS platform with DWC_hsotg IP version 3.30a.

v2:
* Don't remove the bcm2835 ahbcfg param and document why.


John Youn (4):
  usb: dwc2: Document the AHB burst value for bcm2835
  usb: dwc2: Add binding for AHB burst
  usb: dwc2: Use the ahb_burst param
  usb: dwc2: pci: Add AHB burst property for HAPS

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 +
 drivers/usb/dwc2/core.h                        |  9 ++++
 drivers/usb/dwc2/gadget.c                      |  2 +-
 drivers/usb/dwc2/hcd.c                         |  8 ++-
 drivers/usb/dwc2/params.c                      | 73 ++++++++++++++++++++++----
 drivers/usb/dwc2/pci.c                         |  1 +
 6 files changed, 79 insertions(+), 16 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
