From: Vignesh R <vigneshr@ti.com>
Subject: [PATCH v4 1/6] mtd: spi-nor: cadence-quadspi: Add TI 66AK2G SoC specific compatible
Date: Tue, 3 Oct 2017 10:49:20 +0530
Message-ID: <20171003051925.8821-2-vigneshr@ti.com>
References: <20171003051925.8821-1-vigneshr@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171003051925.8821-1-vigneshr@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Vasut <marek.vasut@gmail.com>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vignesh R <vigneshr@ti.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Update binding documentation to add a new compatible for TI 66AK2G SoC,
to handle TI SoC specific quirks in the driver.

Signed-off-by: Vignesh R <vigneshr@ti.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/cadence-quadspi.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
index f248056da24c..7dbe3bd9ac56 100644
--- a/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/cadence-quadspi.txt
@@ -1,7 +1,9 @@
 * Cadence Quad SPI controller
 
 Required properties:
-- compatible : Should be "cdns,qspi-nor".
+- compatible : should be one of the following:
+	Generic default - "cdns,qspi-nor".
+	For TI 66AK2G SoC - "ti,k2g-qspi", "cdns,qspi-nor".
 - reg : Contains two entries, each of which is a tuple consisting of a
 	physical address and length. The first entry is the address and
 	length of the controller register set. The second entry is the
-- 
2.14.1
