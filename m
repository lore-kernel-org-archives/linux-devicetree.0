From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/3] spi-nor: Add Octal SPI support
Date: Wed, 3 Oct 2018 22:26:00 +0530
Message-ID: <20181003165603.2579-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Brian Norris <computersforpeace@gmail.com>, Yogesh Gaur <yogeshnarayan.gaur@nxp.com>, Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for octal mode of mt35x flash. Also, adds
support for OSPI version of Cadence QSPI controller.

Based on top of patches adding basic support for mt35xu512aba here:
https://patchwork.ozlabs.org/cover/971437/

Vignesh R (3):
  mtd: spi-nor: Add Octal mode support for mt35xu512aba
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../devicetree/bindings/mtd/cadence-quadspi.txt       |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c                 |  9 +++++++++
 drivers/mtd/spi-nor/spi-nor.c                         | 11 ++++++++++-
 include/linux/mtd/spi-nor.h                           |  2 ++
 4 files changed, 22 insertions(+), 1 deletion(-)

-- 
2.19.0
