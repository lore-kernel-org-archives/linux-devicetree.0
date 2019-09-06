From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [RFC 0/3] dmaengine: Support for DMA domain controllers
Date: Fri, 6 Sep 2019 17:18:13 +0300
Message-ID: <20190906141816.24095-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

More and more SoC have more than one DMA controller integrated.

If a device needs none slave DMA channel for operation (block copy from/to
memory mapped regions for example) at the moment when they request a channel it
is going to be taken from the first DMA controller which was registered, but
this might be not optimal for the device.

For example on AM654 we have two DMAs: main_udmap and mcu_udmap.
DDR to DDR memcpy is twice as fast on main_udmap compared to mcu_udmap, while
devices on MCU domain (OSPI for example) are more than twice as fast on
mcu_udmap than with main_udmap.

Because of probing order (mcu_udmap is probing first) modules would use
mcu_udmap instead of the better main_udmap. Currently the only solution is to
make a choice and disable the MEM_TO_MEM functionality on one of them which is
not a great solution.

With the introduction of DMA domain controllers we can utilize the best DMA
controller for the job around the SoC without the need to degrade performance.

If the dma-domain-controller is not present in DT or booted w/o DT the none
slave channel request will work as it does today.

The last patch introduces a new dma_domain_request_chan_by_mask() function and
I have a define for dma_request_chan_by_mask() to avoid breaking users of the
dma_request_chan_by_mask, but looking at the kernel we have small amount of
users:
drivers/gpu/drm/vc4/vc4_dsi.c
drivers/media/platform/omap/omap_vout_vrfb.c
drivers/media/platform/omap3isp/isphist.c
drivers/mtd/spi-nor/cadence-quadspi.c
drivers/spi/spi-ti-qspi.c

If it is acceptable we can modify the parameters of dma_request_chan_by_mask()
to include ther device pointer and at the same time change all of the clients
by giving NULL or in case of the last two their dev.

Regards,
Peter
---
Peter Ujfalusi (3):
  dt-bindings: dma: Add documentation for DMA domains
  dmaengine: of_dma: Function to look up the DMA domain of a client
  dmaengine: Support for requesting channels preferring DMA domain
    controller

 .../devicetree/bindings/dma/dma-domain.yaml   | 59 +++++++++++++++++++
 drivers/dma/dmaengine.c                       | 17 ++++--
 drivers/dma/of-dma.c                          | 42 +++++++++++++
 include/linux/dmaengine.h                     |  9 ++-
 include/linux/of_dma.h                        |  7 +++
 5 files changed, 126 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
