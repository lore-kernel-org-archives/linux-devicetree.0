From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH v3 0/3] dmaengine: bindings/edma: dma-channel-mask to array
Date: Thu, 26 Sep 2019 14:19:51 +0300
Message-ID: <20190926111954.9184-1-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: vkoul@kernel.org, robh+dt@kernel.org
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi,

Changes since v2:
- Fix dma-common.yaml documentation patch and extend the description of the
  dma-channel-mask array
- The edma documentation now includes information on the dma-channel-mask array
  size for EDMAs with 32 or 64 channels

Changes since v1:
- Extend the common dma-channel-mask to uint32-array to be usable for
  controllers with more than 32 channels
- Use the dma-channel-mask instead custom property for available channels for
  EDMA.

The original patch was part of the EDMA multicore usage series.

Rob: I'm not sure if I got the dma-common.yaml update correctly...

EDMAs can have 32 or 64 channels depending on the SoC, the dma-channel-mask
needs to be an array to be usable for the driver.

Regards,
Peter
---
Peter Ujfalusi (3):
  dt-bindings: dmaengine: dma-common: Change dma-channel-mask to
    uint32-array
  dt-bindings: dma: ti-edma: Document dma-channel-mask for EDMA
  dmaengine: ti: edma: Add support for handling reserved channels

 .../devicetree/bindings/dma/dma-common.yaml   |  9 ++-
 .../devicetree/bindings/dma/ti-edma.txt       |  8 +++
 drivers/dma/ti/edma.c                         | 59 +++++++++++++++++--
 3 files changed, 69 insertions(+), 7 deletions(-)

-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
