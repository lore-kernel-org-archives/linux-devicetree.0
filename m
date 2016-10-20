From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 00/15] usb: dwc2: Fix up, consolidate, and simplify driver parameters
Date: Wed, 19 Oct 2016 18:22:20 -0700
Message-ID: <cover.1476926069.git.johnyoun@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Currently there are multiple methods of setting parameters in the dwc2
driver.

And PCI drivers have no way of setting any paramters. For our IP
validation environment, which uses a PCIe FPGA platform, we need a way
to override hardware detected values in order to fully cover hardware
functionality. Also, on the gadget side, due to inheriting the legacy
s3c driver behavior, several important parameters are not
auto-detected at all so they must be explicitly set to fully utilize
the hardware.

This patch series cleans up and simplifies the parameter handling in
the dwc2 driver so that it is easier to set these parameters and
easier to maintain the driver and support more platforms in the long
run.

All code should rely on one source for parameters, the hsotg->params
structure. This structure will be populated on driver probe, with
values being pulled in from all other sources, while resolving any
discrepancies and HW incompatibilities.

The long-term goal is to remove all static and legacy parameters in
favor of devicetree properties.

However, this patch series is mostly a cleanup and refactoring to
allow for this. Then, it adds the current gadget-specific parameters
into the internal params structure. And for host-mode, it adds the DMA
parameters to the devicetree. Finally, it adds the ability to set
these properties in the PCI driver.

Later patch series will push more parameters into devicetree and also
allow for them to be set by the PCI driver via debugfs.

For now, we will maintain backward compatibility with the static
structures while giving priority to the devicetree bindings. For those
parameters that were not previously set via the static structures
(gadget ones, plus any new ones), they can *only* be set through
devicetree.

Tested on DWC_hsotg IP version 3.30a on Synopsys HAPS platform.

Regards,
John


John Youn (14):
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
  usb: dwc2: Rename the dma_desc_enable parameter
  usb: dwc2: Rename the dma_desc_enable_fs parameter
  Documentation: devicetree: dwc2: Add host DMA binding
  usb: dwc2: Read host DMA device properties

Vahram Aharonyan (1):
  usb: dwc2: Add PCI properties

 Documentation/devicetree/bindings/usb/dwc2.txt |    1 +
 drivers/usb/dwc2/Makefile                      |    1 +
 drivers/usb/dwc2/core.c                        |  930 +---------------
 drivers/usb/dwc2/core.h                        |  288 ++---
 drivers/usb/dwc2/core_intr.c                   |    6 +-
 drivers/usb/dwc2/gadget.c                      |   95 +-
 drivers/usb/dwc2/hcd.c                         |  193 ++--
 drivers/usb/dwc2/hcd_ddma.c                    |    4 +-
 drivers/usb/dwc2/hcd_intr.c                    |   48 +-
 drivers/usb/dwc2/hcd_queue.c                   |   18 +-
 drivers/usb/dwc2/params.c                      | 1376 ++++++++++++++++++++++++
 drivers/usb/dwc2/pci.c                         |   19 +
 drivers/usb/dwc2/platform.c                    |  207 +---
 13 files changed, 1621 insertions(+), 1565 deletions(-)
 create mode 100644 drivers/usb/dwc2/params.c

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
