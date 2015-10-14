From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] iio: adc: mcp320x: Deprecated compatible strings with no vendor prefix
Date: Wed, 14 Oct 2015 14:54:38 +0200
Message-ID: <1444827279-23163-2-git-send-email-javier@osg.samsung.com>
References: <1444827279-23163-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1444827279-23163-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Michael Welling <mwelling@ieee.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Andrea Galbusera <gizero@gmail.com>, devicetree@vger.kernel.org, Kumar Gala <galak@codeaurora.org>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Jonathan Cameron <jic23@kernel.org>, =?UTF-8?q?S=C3=B8ren=20Andersen?= <san@rosetechnology.dk>
List-Id: devicetree@vger.kernel.org

The Microchip Analog to Digital Converter (ADC) Device Tree binding
documents compatible strings with no vendor prefix. Since it should
compatible strings with also a vendor, add these to the binding doc
and mark the old ones as deprecated.

The driver says that the device is from Microchip Technology which
is listed in Documentation/devicetree/bindings/vendor-prefixes.txt
so use the documented prefix.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 .../devicetree/bindings/iio/adc/mcp320x.txt        | 30 +++++++++++++++-------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
index 2a1f3af30155..bcd3ac8e6e0c 100644
--- a/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
+++ b/Documentation/devicetree/bindings/iio/adc/mcp320x.txt
@@ -10,16 +10,28 @@ must be specified.
 Required properties:
 	- compatible:  	Must be one of the following, depending on the
 			model:
-				"mcp3001"
-				"mcp3002"
-				"mcp3004"
-				"mcp3008"
-				"mcp3201"
-				"mcp3202"
-				"mcp3204"
-				"mcp3208"
-				"mcp3301"
+				"mcp3001" (DEPRECATED)
+				"mcp3002" (DEPRECATED)
+				"mcp3004" (DEPRECATED)
+				"mcp3008" (DEPRECATED)
+				"mcp3201" (DEPRECATED)
+				"mcp3202" (DEPRECATED)
+				"mcp3204" (DEPRECATED)
+				"mcp3208" (DEPRECATED)
+				"mcp3301" (DEPRECATED)
 
+				"microchip,mcp3001"
+				"microchip,mcp3002"
+				"microchip,mcp3004"
+				"microchip,mcp3008"
+				"microchip,mcp3201"
+				"microchip,mcp3202"
+				"microchip,mcp3204"
+				"microchip,mcp3208"
+				"microchip,mcp3301"
+
+			NOTE: The use of the compatibles with no vendor prefix
+			is deprecated and only listed because old DT use them.
 
 Examples:
 spi_controller {
-- 
2.4.3
