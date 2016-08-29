From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/6] usb: dwc2: gadget: Fix TX FIFO handling
Date: Mon, 29 Aug 2016 13:38:46 -0700
Message-ID: <cover.1472502978.git.johnyoun@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi,

This is a resend of a patch series originally submitted by Robert
Baldyga back in February.

Somehow I missed it back then. Sorry about that.

It should fix some FIFO programming related issues on RPi and maybe
other platforms.

Also, this series makes the g-tx-fifo-size DT property obsolete. I've
added a patch at the end of the series to document that.

Regards,
John

John Youn (1):
  Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size

Robert Baldyga (5):
  usb: dwc2: gadget: use ep->fifo_index in context of FIFO registers
  usb: dwc2: gadget: fix TX FIFO size and address initialization
  usb: dwc2: gadget: change variable name to more meaningful
  usb: dwc2: gadget: remove dead code from dwc2_hsotg_ep_enable()
  usb: dwc2: gadget: free TX FIFO after killing requests

 Documentation/devicetree/bindings/usb/dwc2.txt |  5 +-
 drivers/usb/dwc2/core.h                        |  7 ---
 drivers/usb/dwc2/gadget.c                      | 79 +++++++-------------------
 3 files changed, 23 insertions(+), 68 deletions(-)

-- 
2.9.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
