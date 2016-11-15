From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 0/3] usb: dwc2: params revert and rework
Date: Mon, 14 Nov 2016 18:29:50 -0800
Message-ID: <cover.1479176826.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Felipe,

This reverts and fixes a few commits that are queued on your
testing/next, removing the previously added DT bindings, and the code
that reads them in.

The feedback was that IP validation is not reason enough to add these.
So we'll leave them out for now.

Regards,
John


John Youn (3):
  Revert "usb: dwc2: Add bindings to disable gadget DMA modes"
  Revert "Documentation: devicetree: dwc2: Add host DMA binding"
  usb: dwc2: Remove reading in of invalid property

 Documentation/devicetree/bindings/usb/dwc2.txt |  3 ---
 drivers/usb/dwc2/params.c                      | 16 +++-------------
 2 files changed, 3 insertions(+), 16 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
