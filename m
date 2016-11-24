From: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Subject: [PATCH v5 0/2] DW DMAC: update device tree
Date: Thu, 24 Nov 2016 18:04:36 +0300
Message-ID: <1479999878-19120-1-git-send-email-Eugeniy.Paltsev@synopsys.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-kernel@vger.kernel.org, andriy.shevchenko@linux.intel.com, vinod.koul@intel.com, dmaengine@vger.kernel.org, arnd@arndb.de, linux-snps-arc@lists.infradead.org, vireshk@kernel.org, shiraz.linux.kernel@gmail.com, christian.ruppert@alitech.com, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

It wasn't possible to enable some features like
memory-to-memory transfers or multi block transfers via DT.
It is fixed by these patches.

Changes for v5:
 * Update existing DTS. Pointed by Andy Shevchenko. 
 * Read multi-block per chanel instead of per master (Move 
   DW_DMA_MAX_NR_CHANNELS define from regs.h to dma-dw.h to
   implement this) Pointed by Andy Shevchenko.

Changes for v4:
 * Fix setting inverted value to "dwc->nollp". My fault - I 
   tested with wrong DTS, so DMAC was configured from autoconfig
   instead of device tree. Pointed by Andy Shevchenko.
 * Update "multi-block" diescription in documentation to be more 
   clear. Pointed by Arnd Bergmann.

Changes for v3:
 * Update existing platform data.
   We don't need to update existing DTS because default logic 
   wasn't change: we don't set "is_nollp" if we read 
   configuration from DT before. And we don't set it now if
   "multi-block" property doesn't exist in DTS.

Changes for v2:
 * I thought about is_memcpy DT property: all known devices, which 
   use DT for configuration, support memory-to-memory transfers. 
   So we don't need to read it from DT. So enable it by default, 
   if we read configuration from DT.
 * Use "multi-block" instead of "hw-llp" name to be more clear.
 * Move adding DT property and adding documentation for this
   property to one patch.

Eugeniy Paltsev (2):
  DW DMAC: enable memory-to-memory transfers support
  DW DMAC: add multi-block property to device tree

 Documentation/devicetree/bindings/dma/snps-dma.txt |  2 ++
 arch/arc/boot/dts/abilis_tb10x.dtsi                |  1 +
 arch/arm/boot/dts/spear13xx.dtsi                   |  2 ++
 drivers/dma/dw/core.c                              |  2 +-
 drivers/dma/dw/platform.c                          | 15 ++++++++++++++-
 drivers/dma/dw/regs.h                              |  3 ++-
 drivers/tty/serial/8250/8250_lpss.c                |  2 +-
 include/linux/platform_data/dma-dw.h               |  5 +++--
 8 files changed, 26 insertions(+), 6 deletions(-)

-- 
2.5.5
