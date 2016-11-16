From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/4] usb: dwc2: Add AHB burst configuration
Date: Tue, 15 Nov 2016 16:36:05 -0800
Message-ID: <cover.1479256193.git.johnyoun__41369.1569738605$1479256590$gmane$org@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series adds a binding for AHB burst, reads it in, and configures
the controller for the specified burst type.

Tested on HAPS platform with DWC_hsotg IP version 3.30a.


John Youn (4):
  usb: dwc2: Fix AHB burst type for bcm2835
  usb: dwc2: Add binding for AHB burst
  usb: dwc2: Use the ahb_burst param
  usb: dwc2: pci: Add AHB burst property for HAPS

 Documentation/devicetree/bindings/usb/dwc2.txt |  2 +
 drivers/usb/dwc2/core.h                        |  9 ++++
 drivers/usb/dwc2/gadget.c                      |  2 +-
 drivers/usb/dwc2/hcd.c                         |  8 ++-
 drivers/usb/dwc2/params.c                      | 68 +++++++++++++++++++++-----
 drivers/usb/dwc2/pci.c                         |  1 +
 6 files changed, 73 insertions(+), 17 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
