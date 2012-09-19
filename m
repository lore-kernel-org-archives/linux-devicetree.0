From: Matt Porter <mporter@ti.com>
Subject: [PATCH] of: dma: fix typos in generic dma binding definition
Date: Wed, 19 Sep 2012 09:52:23 -0400
Message-ID: <1348062743-26544-1-git-send-email-mporter@ti.com>
Return-path: <linux-omap-owner@vger.kernel.org>
Sender: linux-omap-owner@vger.kernel.org
To: Jon Hunter <jon-hunter@ti.com>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Linux OMAP List <linux-omap@vger.kernel.org>, Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>, Nicolas Ferre <nicolas.ferre@atmel.com>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Benoit Cousson <b-cousson@ti.com>, Russell King <linux@arm.linux.org.uk>, Rob Herring <rob.herring@calxeda.com>, Arnd Bergmann <arnd@arndb.de>, Vinod Koul <vinod.koul@intel.com>, Dan Williams <djbw@fb.com>
List-Id: devicetree@vger.kernel.org

Some semicolons were left out in the examples.

Signed-off-by: Matt Porter <mporter@ti.com>
---
 Documentation/devicetree/bindings/dma/dma.txt |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/dma/dma.txt b/Documentation/devicetree/bindings/dma/dma.txt
index a4f59a5..b4cde0b 100644
--- a/Documentation/devicetree/bindings/dma/dma.txt
+++ b/Documentation/devicetree/bindings/dma/dma.txt
@@ -20,7 +20,7 @@ Optional properties:
 Example:
 
 	dma: dma@48000000 {
-		compatible = "ti,omap-sdma"
+		compatible = "ti,omap-sdma";
 		reg = <0x48000000 0x1000>;
 		interrupts = <0 12 0x4
 			      0 13 0x4
@@ -61,7 +61,7 @@ Examples:
 		...
 		dmas = <&dma 2		/* read channel */
 			&dma 3>;	/* write channel */
-		dma-names = "rx", "tx"
+		dma-names = "rx", "tx";
 		...
 	};
 
@@ -70,7 +70,7 @@ Examples:
 	dmas = <&dma1 5
 		&dma2 7
 		&dma3 2>;
-	dma-names = "rx-tx", "rx-tx", "rx-tx"
+	dma-names = "rx-tx", "rx-tx", "rx-tx";
 
 3. A device with three channels, one of which has two alternatives:
 
-- 
1.7.9.5

