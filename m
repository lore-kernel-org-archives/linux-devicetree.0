From: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: [PATCH v2 00/30] usb: dwc2: Gadget descriptor DMA and IOT
Date: Wed, 09 Nov 2016 19:27:36 -0800
Message-ID: <cover.1478748145.git.johnyoun__7241.31422252885$1478748485$gmane$org@synopsys.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Caesar Wang <wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Shawn Lin <shawn.lin-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Matthias Brugger <mbrugger-IBi9RG/b67k@public.gmane.org>, Wei Xu <xuwei5-C8/M+/jPZTeaMJb+Lgu22Q@public.gmane.org>, Eduardo Valentin <edubezval-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Cc: Vardan Mikayelyan <mvardan-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Vahram Aharonyan <vahrama-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This series implements gadget-side descriptor DMA for the DWC_hsotg
controller.

It also includes support for DWC USB IOT controllers which use the
descriptor DMA mode of operation exclusively. These are two new
device-only USB controller IPs based on DWC_hsotg.

Tested on HAPS platform with:
* HSOTG IP version 3.30a
* FS/LS IOT IP version 1.00a
* HS IOT IP version 1.00a


v2:
* Remove the DMA 'enable' bindings and make them autodetected.
* Add DMA 'disable' bindings to override.
* Separate out commit to add '__packed' attribute.
* Don't print errors on -ENOMEM.
* Remove unnecessary GFP_ATOMIC flags.
* Remove unnecessary patch removing a WARN_ON.
* Reorganize and clarify BNA interrupt.
* Fix issue with enabling STSPHSERCVD interrupt.

Regards,
John


John Youn (4):
  usb: dwc2: Deprecate g-use-dma binding
  usb: dwc2: Update DMA descriptor structure
  usb: dwc2: Make the DMA descriptor structure packed
  usb: dwc2: Add bindings to disable gadget DMA modes

Vahram Aharonyan (23):
  usb: dwc2: gadget: Add descriptor DMA parameter
  usb: dwc2: gadget: Add DMA descriptor status quadlet fields
  usb: dwc2: gadget: Add DMA descriptor chains for EP 0
  usb: dwc2: host: Rename MAX_DMA_DESC_SIZE to HOST_DMA_NBYTES_LIMIT
  usb: dwc2: gadget: Transfer length limit checking for DDMA
  usb: dwc2: gadget: Add DDMA chain pointers to dwc2_hsotg_ep structure
  usb: dwc2: gadget: Add DDMA chain fill and parse functions
  usb: dwc2: gadget: EP 0 specific DDMA programming
  usb: dwc2: gadget: DDMA transfer start and complete
  usb: dwc2: gadget: Fixes for StsPhseRcvd interrupt
  usb: dwc2: gadget: Start DDMA IN status phase in StsPhseRcvd handler
  usb: dwc2: gadget: Enable descriptor DMA mode
  usb: dwc2: gadget: Add DDMA isoc related fields to dwc2_hsotg_ep
  usb: dwc2: gadget: Fill isoc descriptor and start transfer in DDMA
  usb: dwc2: gadget: Add completions for DDMA isoc transfers
  usb: dwc2: gadget: In DDMA keep incompISOOUT and incompISOIN masked
  usb: dwc2: gadget: Add start and complete calls for DDMA ISOC
  usb: dwc2: gadget: Enable the BNA interrupt
  usb: dwc2: gadget: Adjust ISOC OUT request's actual len for DDMA
  usb: dwc2: gadget: For DDMA parse setup only after SetUp interrupt
  usb: dwc2: gadget: Correct dwc2_hsotg_ep_stop_xfr() function
  usb: dwc2: gadget: Disable enabled HW endpoint in
    dwc2_hsotg_ep_disable
  usb: dwc2: Add support of dedicated full-speed PHY interface

Vardan Mikayelyan (3):
  usb: dwc2: gadget: Add IOT device IDs, configure core accordingly
  usb: dwc2: gadget: Program ep0_mps for LS
  usb: dwc2: gadget: Add new core parameter for low speed

 Documentation/devicetree/bindings/usb/dwc2.txt |   6 +-
 arch/arm/boot/dts/rk3036.dtsi                  |   1 -
 arch/arm/boot/dts/rk3288.dtsi                  |   1 -
 arch/arm/boot/dts/rk3xxx.dtsi                  |   1 -
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi      |   1 -
 arch/arm64/boot/dts/rockchip/rk3368.dtsi       |   1 -
 drivers/usb/dwc2/core.h                        |  50 +-
 drivers/usb/dwc2/gadget.c                      | 968 ++++++++++++++++++++++---
 drivers/usb/dwc2/hcd.c                         |  12 +-
 drivers/usb/dwc2/hcd.h                         |   2 +-
 drivers/usb/dwc2/hcd_ddma.c                    |  52 +-
 drivers/usb/dwc2/hw.h                          |  48 +-
 drivers/usb/dwc2/params.c                      |  45 +-
 drivers/usb/dwc2/pci.c                         |   1 -
 14 files changed, 1023 insertions(+), 166 deletions(-)

-- 
2.10.0

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
