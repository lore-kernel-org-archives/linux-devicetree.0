From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 0/3] mtd: cadence-qspi:add support for Intel lgm-qspi
Date: Mon,  9 Sep 2019 18:47:30 +0800
Message-ID: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, jwboyer@gmail.com, boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com, tudor.ambarus@gmail.com, vigneshr@ti.com, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

Thank you Vignesh for the valuable review comments.

changes from v2:
The following review comments are addressed.
 1. implemented quirks for intel lgm soc.
 2. removed the DT entry based checks.
 3. removed the trigger_address in unneccessary places.
 4. qspi string removed instead add NULL(originally)
 5. removed CQSPI_REG_CONFIG_DMA_MASK   
 6. changed the commit message.

Ramuthevar Vadivel Murugan (3):
  dt-bindings: mtd: cadence-qspi:add support for Intel lgm-qspi
  mtd: spi-nor: cadence-quadspi: Disable the DAC for Intel LGM SoC
  mtd: spi-nor: cadence-quadspi: disable the auto-poll for Intel LGM

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  1 +
 drivers/mtd/spi-nor/Kconfig                        |  2 +-
 drivers/mtd/spi-nor/cadence-quadspi.c              | 45 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 1 deletion(-)

-- 
2.11.0
