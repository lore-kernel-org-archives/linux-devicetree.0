From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: [PATCH 0/4] ARM/DT: edma: Get IP configuration from hardware
Date: Tue, 13 May 2014 10:43:44 +0300
Message-ID: <1399967028-24757-1-git-send-email-peter.ujfalusi@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: nsekhar@ti.com, joelf@ti.com
Cc: linux@arm.linux.org.uk, vinod.koul@intel.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, tony@atomide.com, bcousson@baylibre.com
List-Id: devicetree@vger.kernel.org

Hi,

We are requesting redundant information via DT for the driver since the very same
data is available in the HW: by reading and decoding the content of CCCFG
register we can get:
Number of channels: NUM_DMACH
Number of regions: NUM_REGN
Number of slots (PaRAM sets): NUM_PAENTRY
Number of TC/EQ: NUM_EVQUE

So these does not need to be provided by the DT binding.

The driver will no longer look for these properties from DT and they can be
removed from the binding documentation and from the dtsi files as well.
The change will not introduce regression when new kernel is booted using older
DTB (since we just ignore the mentioned properties).

Regards,
Peter
---
Peter Ujfalusi (4):
  ARM: edma: Get IP information from HW when booting with DT
  dt/bindings: ti,edma: Remove redundant properties from documentation
  ARM: dts: am33xx: Remove obsolete properties from edma node
  ARM: dts: am4372: Remove obsolete properties from edma node

 Documentation/devicetree/bindings/dma/ti-edma.txt |   6 -
 arch/arm/boot/dts/am33xx.dtsi                     |   3 -
 arch/arm/boot/dts/am4372.dtsi                     |   3 -
 arch/arm/common/edma.c                            | 128 +++++++++++++---------
 4 files changed, 79 insertions(+), 61 deletions(-)

-- 
1.9.3

