From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v2 0/2] cadence-quadspi: Add Octal mode support
Date: Tue, 11 Dec 2018 13:21:04 +0530
Message-ID: <20181211075106.21317-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <boris.brezillon@bootlin.com>, Marek Vasut <marek.vasut@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Tudor Ambarus <tudor.ambarus@microchip.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for OSPI version of Cadence QSPI controller IP.
Based on top of [1][2] that add Octal mode support in spi-nor core:

[1] https://patchwork.ozlabs.org/patch/1006717/
[2] https://patchwork.ozlabs.org/patch/1006715/

Changes:
v2:
spi-nor core patches dropped, are now part of Yogesh's series [1]
Declare Octal mode capability based on compatible.

Vignesh R (2):
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../bindings/mtd/cadence-quadspi.txt          |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c         | 54 ++++++++++++++-----
 2 files changed, 43 insertions(+), 12 deletions(-)

-- 
2.19.2
