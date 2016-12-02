From: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Subject: [PATCH 0/2] Add support for Tianma TM070JDHG30 display
Date: Fri,  2 Dec 2016 09:52:06 +0100
Message-ID: <20161202085208.19459-1-gary.bisson@boundarydevices.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi all,

This series adds support for the Tianma TM070JDHG30 7" display (1280x800).
http://usa.tianma.com/products-technology/product/tm070jdhg30-00
https://boundarydevices.com/product/bd070lic2/

The first patch adds Tianma as a new vendor prefix whereas the second patch
adds the display to the simple panel driver.

Regards,
Gary

Gary Bisson (2):
  of: Add vendor prefix for Tianma Micro-electronics
  drm/panel: simple: Add support for Tianma TM070JDHG30

 .../bindings/display/panel/tianma,tm070jdhg30.txt  |  7 ++++++
 .../devicetree/bindings/vendor-prefixes.txt        |  1 +
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/tianma,tm070jdhg30.txt

-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
