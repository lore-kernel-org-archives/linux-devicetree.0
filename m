From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v4 0/2] cadence-quadspi: Add Octal mode support
Date: Tue, 22 Jan 2019 12:11:35 +0530
Message-ID: <20190122064137.17114-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>, Tudor.Ambarus@microchip.com
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for OSPI version of Cadence QSPI controller IP.
Tested with AM654 EVM with MT35x512 Octal flash

Changes:
v4:
Fix comments on v3 by Tudor.
Rebase on top latest linux-next(all dependencies are now part of -next)

v3:
Rebase on top of v7 of Yogesh's series[1]

v2:
spi-nor core patches dropped, are now part of Yogesh's series [1]
Declare Octal mode capability based on compatible.

Vignesh R (2):
  dt-bindings: cadence-quadspi: Add new compatible for AM654 SoC
  mtd: spi-nor: cadence-quadspi: Add support for Octal SPI controller

 .../bindings/mtd/cadence-quadspi.txt          |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c         | 53 ++++++++++++++-----
 2 files changed, 42 insertions(+), 12 deletions(-)

-- 
2.20.1
