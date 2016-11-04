From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 00/13] usb: dwc2: Fix up, consolidate, and simplify driver parameters
Date: Thu, 03 Nov 2016 17:55:43 -0700
Message-ID: <cover.1478220875.git.johnyoun__6824.8315751136$1478220974$gmane$org@synopsys.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch series cleans up and simplifies the parameter handling in
the dwc2 driver so that it is easier to set these parameters and
easier to maintain the driver and support more platforms in the long
run.

The long-term goal is to remove all static and legacy parameters in
favor of autodetection and/or devicetree properties.

However, this patch series is mostly a cleanup and refactoring to
allow for this. Then, it adds the current gadget-specific properties.
And for host-mode, it adds the DMA property. Lastly, it adds the
ability to set properties from the PCI driver so that we can perform
IP validation with the HAPS platform.

Later patch series will address the other properties and also allow
for them to be set by the PCI driver via debugfs.

Tested on DWC_hsotg IP version 3.30a on Synopsys HAPS platform.

v2:
* Renamed host-dma to "snps,host-dma-disable".
* Removed params->host_dma from being set statically.
* Reverted descriptor dma params renaming (to be addressed in the
  future).
* Simplified and removed unused code.

Regards,
John


John Youn (12):
  usb: dwc2: Remove unnecessary kfree
  usb: dwc2: Remove unused hardware parameter
  usb: dwc2: Add params.c file
  usb: dwc2: Declare the core params struct statically
  usb: dwc2: Move parameter initialization into params.c
  usb: dwc2: Remove dwc2_set_all_params function
  usb: dwc2: Remove unnecessary prototypes
  usb: dwc2: Rename host_rx_fifo_size hardware parameter
  usb: dwc2: Move gadget settings into core_params
  usb: dwc2: Rename the dma_enable parameter to host_dma
  Documentation: devicetree: dwc2: Add host DMA binding
  usb: dwc2: Get host DMA device properties

Vahram Aharonyan (1):
  usb: dwc2: Add PCI properties

 Documentation/devicetree/bindings/usb/dwc2.txt |    1 +
 drivers/usb/dwc2/Makefile                      |    1 +
 drivers/usb/dwc2/core.c                        |  930 +---------------
 drivers/usb/dwc2/core.h                        |  280 +----
 drivers/usb/dwc2/core_intr.c                   |    6 +-
 drivers/usb/dwc2/gadget.c                      |   95 +-
 drivers/usb/dwc2/hcd.c                         |  193 ++--
 drivers/usb/dwc2/hcd_ddma.c                    |    4 +-
 drivers/usb/dwc2/hcd_intr.c                    |   48 +-
 drivers/usb/dwc2/hcd_queue.c                   |   18 +-
 drivers/usb/dwc2/params.c                      | 1412 ++++++++++++++++++++++++
 drivers/usb/dwc2/pci.c                         |   19 +
 drivers/usb/dwc2/platform.c                    |  207 +---
 13 files changed, 1653 insertions(+), 1561 deletions(-)
 create mode 100644 drivers/usb/dwc2/params.c

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
