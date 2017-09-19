From: Vignesh R <vigneshr@ti.com>
Subject: [RESEND PATCH v2 0/5] K2G: Add QSPI support
Date: Tue, 19 Sep 2017 16:26:00 +0530
Message-ID: <20170919105605.18533-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

This series adds support for Cadence QSPI IP present in TI's 66AK2G SoC.
The patches enhance the existing cadence-quadspi driver to support
loopback clock circuit, pm_runtime support and tweaks for 66AK2G SoC.

Change log:

Resend:
* Rebase to latest linux-next.
* Collect Acked-bys

v2:
* Drop DT patches. Will be sent as separate series as requested by
 maintainer.
* Split binding docs into separate patches.
* Address comments by Rob Herring.


Vignesh R (5):
  mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
  mtd: spi-nor: cadence-quadspi: add a delay in write sequence
  mtd: spi-nor: cadence-quadspi: Add new binding to enable loop-back
    circuit
  mtd: spi-nor: cadence-quadspi: Add support to enable loop-back clock
    circuit
  mtd: spi-nor: cadence-quadspi: Add runtime PM support

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  7 +++-
 drivers/mtd/spi-nor/cadence-quadspi.c              | 46 ++++++++++++++++++++--
 2 files changed, 49 insertions(+), 4 deletions(-)

-- 
2.14.1
