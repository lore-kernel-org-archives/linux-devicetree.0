From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH 0/7] K2G: Add QSPI support
Date: Tue, 1 Aug 2017 10:24:27 +0530
Message-ID: <20170801045434.8733-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vignesh R <vigneshr@ti.com>
List-Id: devicetree@vger.kernel.org

This series adds support for Cadence QSPI for 66AK2G SoC. The first
three patches enhance the cadence-quadspi driver to support loopback
clock and pm_runtime and tweaks for 66AK2G SoC. Remaining patches add
DT nodes and enable the driver in defconfig.

Tested on 66AK2G GP and ICE boards.

Vignesh R (7):
  mtd: spi-nor: cadence-quadspi: add a delay in write sequence
  mtd: spi-nor: cadence-quadspi: Add support to enable loopback clock
    circuit
  mtd: spi-nor: cadence-quadspi: Add runtime PM support
  ARM: dts: keystone-k2g: Add QSPI DT entry
  ARM: dts: keystone-k2g-evm: Add QSPI node
  ARM: dts: keystone-k2g-ice: Add QSPI node
  ARM: configs: keystone: Enable Cadence QSPI driver

 .../devicetree/bindings/mtd/cadence-quadspi.txt    |  4 ++
 arch/arm/boot/dts/keystone-k2g-evm.dts             | 69 ++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g-ice.dts             | 69 ++++++++++++++++++++++
 arch/arm/boot/dts/keystone-k2g.dtsi                | 15 +++++
 arch/arm/configs/keystone_defconfig                |  1 +
 drivers/mtd/spi-nor/cadence-quadspi.c              | 32 +++++++++-
 6 files changed, 188 insertions(+), 2 deletions(-)

-- 
2.13.3
