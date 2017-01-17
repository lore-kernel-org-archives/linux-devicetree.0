From: Raviteja Garimella <raviteja.garimella-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>
Subject: [RFC v2 0/5] Platform driver support for 'amd5536udc' driver
Date: Tue, 17 Jan 2017 13:35:03 +0530
Message-ID: <1484640308-25976-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, bcm-kernel-feedback-list-dY08KVG/lbpWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

This is RFC for the changes made as per the review comments made for
the previous version. I would like to know  if this approach (the way
the driver is split and the naming and all)looks good to be submitted.

Changes from v1:
===============
1. Split the driver into platform/pci specific drivers with a core driver
   file that handles the common driver routines that are exported.

2. Split the driver into number of patches as suggested in previous
   review comments.

3. Added the devicetree bindings documentation for Synopsys platform
   driver.

Introduction from previous version:
===================================
This patch adds platform device support to the existing 'amd5536udc'
driver.

The UDC is based on Synopsys Designware core USB (2.0) Device controller
IP.

The driver so far supports UDCs that are a part of AMD southbridge
and is connected through PCI bus.

The same driver can be used with UDCs that are integrated into SoCs
like Broadcom's Northstar2/Cygnus platforms by adding platform device
suooprt.

This patch contains all the changes that were required to get the driver
functional on Broadcom's Northstar2 platform. 

This is a request for comments from maintainers/others regarding approach
on whether to have 2 different drivers (one each for AMD and Broadcom)
with a common library (3 files in total), or have a single driver like
it's done in this patch and have the driver filename changed to some
common name based on ther underlying IP, like snps_udc.c.

Below are the main changes done:

1. Added OF based platform device registration -- so that the driver gets
   probed based on the device tree entry. Like wise, remove routine and
   platform PM ops are supported.

2. Modified debug prints to be compatible with both pci and platform
   devices.

3. Added members to 'struct udc' in header file for extcon and phy support.
   This is required if the UDC is connected to a Dual Role Device Phy
   where the Phy can be configured to be in Device mode or Host mode based
   on the type of external cable that is connected to the port.
 
4. Added checks in udc connect/disconnect routines so as to return if the
   routine is already called.

5. Modified the arguments passed to dma_pool_create routine -- which
   expects struct device, whereas NULL is passed in the existing version.
 
6. Kconfig changes are done so that the driver now depends on either of
   CONFIG_OF or CONFIG_PCI. More description about the Synopsys IP is
   provided.

Raviteja Garimella (5):
  UDC: Split the driver into amd (pci) and Synopsys core driver
  UDC: make debug prints compatible with both pci and platform devices
  UDC: Provide correct arguments for 'dma_pool_create'
  DT bindings documentation for Synopsys UDC platform driver
  UDC: Add Synopsys UDC Platform driver

 .../devicetree/bindings/usb/snps,dw-ahb-udc.txt    |   27 +
 drivers/usb/gadget/udc/Kconfig                     |   32 +
 drivers/usb/gadget/udc/Makefile                    |    2 +
 drivers/usb/gadget/udc/amd5536udc.c                | 3249 +-------------------
 drivers/usb/gadget/udc/amd5536udc.h                |   54 +-
 drivers/usb/gadget/udc/snps_udc_core.c             | 3232 +++++++++++++++++++
 drivers/usb/gadget/udc/snps_udc_plat.c             |  342 +++
 7 files changed, 3714 insertions(+), 3224 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/snps,dw-ahb-udc.txt
 create mode 100644 drivers/usb/gadget/udc/snps_udc_core.c
 create mode 100644 drivers/usb/gadget/udc/snps_udc_plat.c

-- 
2.1.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
