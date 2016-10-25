From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/6] usb: dwc3: Interrupt moderation
Date: Tue, 25 Oct 2016 12:42:38 -0700
Message-ID: <cover.1477424426.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series implements interrupt moderation and also uses it in
implementing a workaround for STAR 9000961433.


John Youn (6):
  usb: dwc3: Add a check for the DWC_usb3 core
  usb: dwc3: Add a function to check properties
  Documentation: devicetree: dwc3: Add interrupt moderation
  usb: dwc3: gadget: Write the event count in interrupt
  usb: dwc3: Implement interrupt moderation
  usb: dwc3: Workaround for irq mask issue

 Documentation/devicetree/bindings/usb/dwc3.txt |  1 +
 drivers/usb/dwc3/core.c                        | 89 ++++++++++++++++++--------
 drivers/usb/dwc3/core.h                        | 21 ++++++
 drivers/usb/dwc3/gadget.c                      | 20 +++++-
 4 files changed, 103 insertions(+), 28 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
