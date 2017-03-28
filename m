From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [PATCH v3 0/7] Platform driver support for 'amd5536udc' driver
Date: Tue, 28 Mar 2017 16:32:02 +0530
Message-ID: <1490698929-10915-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Changes in PATCH v3:
===================
1. Updated bindings documentation and platform driver to add
   "brcm,iproc-udc" compatibility string.

2. Added a patch to replace references of struct pci_pool with
   struct dma_pool so that it is compatibile with non-pci drivers.

Changes in PATCH v2:
===================
1. Updated bindings documentation:
   -- compatibility string for each supported SoC
   -- removed extcon node
   -- rename the file name to just iproc-udc.txt

2. Modified comptability strings in platform driver file
   to reflect the change made in 1.

3 Kconfig
   -- Resolved warnings shown by kbuild-test-robot  

The changes are being submitted as PATCH this time. Below are the
details of main changes with respect to previous RFC versions.

Changes in PATCH v1:
===================
Patch 1/6 now splits the driver into amd5536udc_pci_.c (which
contains only the PCI device registration part), and amd5536udc.c
will still be driver that does the rest of UDC driver functionality.

Patch 2/6 renames amd5536udc.c to snps_udc_core.c.

The DT compatibilty string is changed to "brcm,iproc-snps-udc"
as per review comments for RFCv2. The driver and bindings
documentation is modified to reflect this.

This is RFC for the changes made as per the review comments made for
the previous version. I would like to know  if this approach (the way
the driver is split and the naming and all)looks good to be submitted.


Changes in RFC v2:
=================
1. Split the driver into platform/pci specific drivers with a core driver
   file that handles the common driver routines that are exported.

2. Split the driver into number of patches as suggested in previous
   review comments.

3. Added the devicetree bindings documentation for Synopsys platform
   driver.

Introduction (RFC v1):
=====================
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

Repo: https://github.com/Broadcom/arm64-linux.git
Branch: udc_snps_v3

Raviteja Garimella (7):
  UDC: Split the driver into amd (pci) and Synopsys core IP driver
  UDC: Rename amd5536udc driver file based on IP
  UDC: make debug prints compatible with both pci and platform devices
  UDC: Provide correct arguments for 'dma_pool_create'
  UDC: Use struct dma_pool instead of pci_pool
  DT bindings documentation for Broadcom IPROC USB Device controller.
  UDC: Add Synopsys UDC Platform driver

 .../devicetree/bindings/usb/iproc-udc.txt          |   21 +
 drivers/usb/gadget/udc/Kconfig                     |   32 +
 drivers/usb/gadget/udc/Makefile                    |    4 +-
 drivers/usb/gadget/udc/amd5536udc.c                | 3413 --------------------
 drivers/usb/gadget/udc/amd5536udc.h                |   58 +-
 drivers/usb/gadget/udc/amd5536udc_pci.c            |  218 ++
 drivers/usb/gadget/udc/snps_udc_core.c             | 3239 +++++++++++++++++++
 drivers/usb/gadget/udc/snps_udc_plat.c             |  344 ++
 8 files changed, 3912 insertions(+), 3417 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/iproc-udc.txt
 delete mode 100644 drivers/usb/gadget/udc/amd5536udc.c
 create mode 100644 drivers/usb/gadget/udc/amd5536udc_pci.c
 create mode 100644 drivers/usb/gadget/udc/snps_udc_core.c
 create mode 100644 drivers/usb/gadget/udc/snps_udc_plat.c

-- 
2.1.0
