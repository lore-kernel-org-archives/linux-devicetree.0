From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 0/3] dmaengine: Support for DMA domain controllers
Date: Tue, 10 Sep 2019 14:50:34 +0300
Message-ID: <20190910115037.23539-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes since RFC:
- Extended the binding document's example
- Changed the API to dma_request_chan_by_domain(dev, mask)
 - Fixed certain crash if the dev parameter would be NULL
- Add missing parenthesis in of_dma.c
- typo fix.

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

Regards,
Peter
---
Peter Ujfalusi (3):
  dt-bindings: dma: Add documentation for DMA domains
  dmaengine: of_dma: Function to look up the DMA domain of a client
  dmaengine: Support for requesting channels preferring DMA domain
    controller

 .../devicetree/bindings/dma/dma-domain.yaml   | 88 +++++++++++++++++++
 drivers/dma/dmaengine.c                       | 21 +++--
 drivers/dma/of-dma.c                          | 42 +++++++++
 include/linux/dmaengine.h                     |  9 +-
 include/linux/of_dma.h                        |  7 ++
 5 files changed, 159 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/dma-domain.yaml

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
