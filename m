From: "Albert ARIBAUD (3ADEV)" <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Subject: [PATCH 2/2] fsl-quadspi: introduce per-bus spi-bus-width property
Date: Tue, 27 Sep 2016 07:59:57 +0200
Message-ID: <20160927055957.427-2-albert.aribaud@3adev.fr>
References: <20160927055957.427-1-albert.aribaud@3adev.fr>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160927055957.427-1-albert.aribaud-iEu9NFBzPZE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Han Xu <han.xu-3arQi8VN3Tc@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Introduce spi-bus-width property for bus subnodes, to
specify per-bus capability to use NORMAL, FAST, DUAL,
and/or QUAD reads.

Signed-off-by: Albert ARIBAUD (3ADEV) <albert.aribaud-iEu9NFBzPZE@public.gmane.org>
---
 Documentation/devicetree/bindings/mtd/fsl-quadspi.txt | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
index c34aa6f..82e4eb8 100644
--- a/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
+++ b/Documentation/devicetree/bindings/mtd/fsl-quadspi.txt
@@ -24,6 +24,17 @@ Optional properties:
 			      (Please check the board's schematic.)
   - big-endian : That means the IP register is big endian
 
+Required subnode properties:
+  - spi-max-frequency: maximum operating frequency of the SPI device.
+                       The controller will run at the lowest of all
+                       specified frequencies (or at the default of 66 MHz).
+
+Optional subnode properties:
+  - spi-bus-width: if present, specifies how the decide should be read.
+                   1 specifies FAST read, 2 specifies DUAL read, and 4
+                   specifies QUAD read.
+                   If absent, normal (non-FAST) reads are used.
+
 Example:
 
 qspi0: quadspi@40044000 {
@@ -37,5 +48,12 @@ qspi0: quadspi@40044000 {
 
 	flash0: s25fl128s@0 {
 		....
+		spi-max-frequency = <66000000>;
+		spi-bus-width = <2>;
+	};
+	flash1: s25fl128s@1 {
+		....
+		spi-max-frequency = <88000000>;
+		spi-bus-width = <4>;
 	};
 };
-- 
2.9.3

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
