From: Raviteja Garimella <raviteja.garimella@broadcom.com>
Subject: [RFC 0/1] Platform driver support for 'amd5536udc' driver
Date: Thu,  5 Jan 2017 13:53:16 +0530
Message-ID: <1483604597-26160-1-git-send-email-raviteja.garimella@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, linux-usb@vger.kernel.org
List-Id: devicetree@vger.kernel.org

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

Raviteja Garimella (1):
  Changes to support the driver for platform device registration

 drivers/usb/gadget/udc/Kconfig      |   6 +-
 drivers/usb/gadget/udc/amd5536udc.c | 397 +++++++++++++++++++++++++++++++++---
 drivers/usb/gadget/udc/amd5536udc.h |  17 +-
 3 files changed, 387 insertions(+), 33 deletions(-)

-- 
2.1.0
