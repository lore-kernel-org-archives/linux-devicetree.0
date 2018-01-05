From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/15] usb: dwc3: Add new updates for DWC_usb31
Date: Fri, 5 Jan 2018 12:13:34 -0800
Message-ID: <cover.1515182391.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vamsi Krishna Samavedam <vskrishn-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "Gustavo A. R. Silva" <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds new updates and some fixes for DWC_usb31.


Thinh Nguyen (15):
  usb: dwc3: Device SoftReset PHY synchonization delay
  usb: core: urb: Check SSP isoc ep comp descriptor
  usb: dwc3: Update DWC_usb31 GTXFIFOSIZ reg fields
  usb: dwc3: Check IP revision for GTXFIFOSIZ
  usb: dwc3: Add DWC_usb31 GRXTHRCFG bit fields
  usb: dwc3: gadget: Check IP revision for GRXTHRCFG
  usb: dwc3: Add DWC_usb31 GTXTHRCFG reg fields
  usb: dwc3: Make RX/TX threshold configurable
  usb: dwc3: Check for ESS TX/RX threshold config
  usb: dwc3: gadget: Set maxpacket size for ep0 IN
  usb: dwc3: ep0: Reset TRB counter for ep0 IN
  usb: dwc3: Dump LSP and BMU debug info
  usb: dwc3: Track DWC_usb31 VERSIONTYPE
  usb: dwc3: Add disabling of start_transfer failure quirk
  usb: dwc3: Add workaround for isoc start transfer failure

 Documentation/devicetree/bindings/usb/dwc3.txt |   9 ++
 drivers/usb/core/urb.c                         |   8 +
 drivers/usb/dwc3/core.c                        |  74 ++++++++-
 drivers/usb/dwc3/core.h                        |  57 +++++++
 drivers/usb/dwc3/debugfs.c                     |   5 +
 drivers/usb/dwc3/ep0.c                         |   7 +-
 drivers/usb/dwc3/gadget.c                      | 202 ++++++++++++++++++++++++-
 7 files changed, 353 insertions(+), 9 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
