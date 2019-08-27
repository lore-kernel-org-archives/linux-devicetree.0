From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v2 0/3] dt-bindings: mtd: cadence-qspi:add support for Intel lgm-qspi
Date: Tue, 27 Aug 2019 11:58:24 +0800
Message-ID: <20190827035827.21024-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, jwboyer@gmail.com, boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com, tudor.ambarus@gmail.com, vigneshr@ti.com, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

mtd: spi-nor: cadence-quadspi: disable DMA and DAC for Intel LGM
mtd: spi-nor: cadence-quadspi: disable the auto-poll for Intel LGM

changes from V1:
  - many thanks to Vignesh for review comments.
  - split 2 patches one for DMA and DAC and other one
    is disable the auto-poll
  - removed ahb_phy_addr and used existing trigger_address
  - trigger_address property used.
  
Ramuthevar Vadivel Murugan (3):
  dt-bindings: mtd: cadence-qspi:add support for Intel lgm-qspi
  mtd: spi-nor: cadence-quadspi: disable DMA and DAC for Intel LGM
  mtd: spi-nor: cadence-quadspi: disable the auto-poll for Intel LGM

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  1 +
 drivers/mtd/spi-nor/Kconfig                        |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c              | 45 ++++++++++++++++++++--
 3 files changed, 44 insertions(+), 4 deletions(-)

-- 
2.11.0
