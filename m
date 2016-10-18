From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: usb: dwc2: Revert incorrect FIFO changes
Date: Mon, 17 Oct 2016 17:36:20 -0700
Message-ID: <cover.1476750819.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stefan Wahren <stefan.wahren-eS4NqCHxEME@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series reverts patches that incorrectly removed some FIFO
programming.

Hi Felipe,

This fixes a regression on 4.9-rc1, could you queue them in your fixes
tree?

Thanks,
John

v2:
* Added Rob Herring's Acked-by


John Youn (3):
  Revert "usb: dwc2: gadget: change variable name to more meaningful"
  Revert "usb: dwc2: gadget: fix TX FIFO size and address
    initialization"
  Revert "Documentation: devicetree: dwc2: Deprecate g-tx-fifo-size"

 Documentation/devicetree/bindings/usb/dwc2.txt |  5 +--
 drivers/usb/dwc2/core.h                        |  7 ++++
 drivers/usb/dwc2/gadget.c                      | 53 ++++++++++++++++++++------
 3 files changed, 50 insertions(+), 15 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
