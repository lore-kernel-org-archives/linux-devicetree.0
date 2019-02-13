From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 06/11] dt-bindings: mtd: atmel-nand: add sam9x60 compatible
Date: Wed, 13 Feb 2019 09:00:01 +0000
Message-ID: <20190213085930.31578-7-tudor.ambarus@microchip.com>
References: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190213085930.31578-1-tudor.ambarus@microchip.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com, Ludovic.Desroches@microchip.com, dwmw2@infradead.org, computersforpeace@gmail.com, bbrezillon@kernel.org, marek.vasut@gmail.com, richard@nod.at, miquel.raynal@bootlin.com, lee.jones@linaro.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor.Ambarus@microchip.com
List-Id: devicetree@vger.kernel.org

From: Tudor Ambarus <tudor.ambarus@microchip.com>

Add compatibility string for the sam9x60 nand controller.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 Documentation/devicetree/bindings/mtd/atmel-nand.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documen=
tation/devicetree/bindings/mtd/atmel-nand.txt
index 9bb66e476672..68b51dc58816 100644
--- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
+++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
@@ -14,6 +14,7 @@ Required properties:
 	"atmel,at91sam9261-nand-controller"
 	"atmel,at91sam9g45-nand-controller"
 	"atmel,sama5d3-nand-controller"
+	"microchip,sam9x60-nand-controller"
 - ranges: empty ranges property to forward EBI ranges definitions.
 - #address-cells: should be set to 2.
 - #size-cells: should be set to 1.
--=20
2.9.5
