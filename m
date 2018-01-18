From: Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v3 00/15] usb: dwc3: Add new updates for DWC_usb31
Date: Wed, 17 Jan 2018 17:51:43 -0800
Message-ID: <cover.1516239813.git.thinhn@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thinh Nguyen <Thinh.Nguyen-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Vamsi Krishna Samavedam <vskrishn-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Li Jun <jun.li-3arQi8VN3Tc@public.gmane.org>, "Gustavo A. R. Silva" <garsilva-L1vi/lXTdts+Va1GwOuvDg@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>
Cc: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series adds new updates and some fixes for DWC_usb31.

Changes in v3:
 - Add "usb: dwc3: Check controller type before setting speed" to series

Changes in v2:
 - Add another patch to the series to increase mass_storage max_speed
 - Separate "usb: dwc3: ep0: Reset TRB counter for ep0 IN" from series
 - Separate "usb: dwc3: gadget: Set maxpacket size for ep0 IN" from series
 - Use msleep() instead of mdelay() for SoftReset PHY sync delay
 - Rename new USB31 macros from DWC3_USB31_* to DWC31_*
 - Rename device properties and replace '_' with '-'
 - Minor fixes in the commit messages


Thinh Nguyen (15):
  usb: dwc3: Add SoftReset PHY synchonization delay
  usb: core: urb: Check SSP isoc ep comp descriptor
  usb: dwc3: Update DWC_usb31 GTXFIFOSIZ reg fields
  usb: dwc3: Check IP revision for GTXFIFOSIZ
  usb: dwc3: Add DWC_usb31 GRXTHRCFG bit fields
  usb: dwc3: gadget: Check IP revision for GRXTHRCFG
  usb: dwc3: Add DWC_usb31 GTXTHRCFG reg fields
  usb: dwc3: Make TX/RX threshold configurable
  usb: dwc3: Check for ESS TX/RX threshold config
  usb: dwc3: Dump LSP and BMU debug info
  usb: dwc3: Track DWC_usb31 VERSIONTYPE
  usb: dwc3: Add disabling of start_transfer failure quirk
  usb: dwc3: Add workaround for isoc start transfer failure
  usb: dwc3: Check controller type before setting speed
  usb: gadget: mass_storage: Set max_speed to SSP

 Documentation/devicetree/bindings/usb/dwc3.txt |   7 +
 drivers/usb/core/urb.c                         |   8 +
 drivers/usb/dwc3/core.c                        |  72 ++++++++-
 drivers/usb/dwc3/core.h                        |  53 +++++++
 drivers/usb/dwc3/debugfs.c                     |   5 +
 drivers/usb/dwc3/gadget.c                      | 205 ++++++++++++++++++++++++-
 drivers/usb/gadget/legacy/mass_storage.c       |   2 +-
 7 files changed, 342 insertions(+), 10 deletions(-)

-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
