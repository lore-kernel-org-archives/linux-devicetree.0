From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v3 0/2] cadence-quadspi: Add Octal mode support
Date: Wed, 16 Jan 2019 16:00:25 +0530
Message-ID: <20190116103027.22657-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Boris Brezillon <bbrezillon@kernel.org>, Tudor.Ambarus@microchip.com
Cc: Marek Vasut <marek.vasut@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for OSPI version of Cadence QSPI controller IP.
Based on top of [1][2] that add Octal mode support in spi-nor core:

[1] https://patchwork.ozlabs.org/patch/1025081/
[2] https://patchwork.ozlabs.org/patch/1025082/

Changes:
v3:
Rebase on top of v7 of Yogesh's series[1]

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
2.20.1
