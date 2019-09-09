From: "Ramuthevar,Vadivel MuruganX"
        <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: [PATCH v3 1/3] dt-bindings: mtd: cadence-qspi:add support for Intel lgm-qspi
Date: Mon,  9 Sep 2019 18:47:31 +0800
Message-ID: <20190909104733.14273-2-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190909104733.14273-1-vadivel.muruganx.ramuthevar@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, dwmw2@infradead.org, computersforpeace@gmail.com, richard@nod.at, jwboyer@gmail.com, boris.brezillon@free-electrons.com, cyrille.pitchen@atmel.com, david.oberhollenzer@sigma-star.at, miquel.raynal@bootlin.com, tudor.ambarus@gmail.com, vigneshr@ti.com, andriy.shevchenko@intel.com, cheol.yong.kim@intel.com, qi-ming.wu@intel.com, Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
List-Id: devicetree@vger.kernel.org

From: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>

Add new vendor specific compatible string to check Intel's Lightning
Mountain(LGM) QSPI features enablement in cadence-quadspi driver.

Signed-off-by: Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index 945be7d5b236..8ace832a2d80 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -5,6 +5,7 @@ Required properties:
 	Generic default - "cdns,qspi-nor".
 	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
 	For TI AM654 SoC  - "ti,am654-ospi", "cdns,qspi-nor".
+	For Intel LGM SoC - "intel,lgm-qspi", "cdns,qspi-nor".
 - reg : Contains two entries, each of which is a tuple consisting of a
 	physical address and length. The first entry is the address and
 	length of the controller register set. The second entry is the
-- 
2.11.0
