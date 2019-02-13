From: <Tudor.Ambarus@microchip.com>
Subject: [PATCH 03/11] dt-bindings: memory: atmel-ebi: add sam9x60 compatible
Date: Wed, 13 Feb 2019 08:59:52 +0000
Message-ID: <20190213085930.31578-4-tudor.ambarus@microchip.com>
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

Add compatibility string for the sam9x60 EBI.

Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
---
 Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/atmel,ebi=
.txt b/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
index 9bb5f57e2066..94bf7896a688 100644
--- a/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt
@@ -15,6 +15,7 @@ Required properties:
 			"atmel,at91sam9g45-ebi"
 			"atmel,at91sam9x5-ebi"
 			"atmel,sama5d3-ebi"
+			"microchip,sam9x60-ebi"
=20
 - reg:			Contains offset/length value for EBI memory mapping.
 			This property might contain several entries if the EBI
--=20
2.9.5
