From: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: [PATCH] iio: proximity: as3935: add missing required spi-max-frequency
Date: Tue, 16 May 2017 19:03:10 -0700
Message-ID: <20170517020310.21355-1-matt.ranostay@konsulko.com>
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

spi-max-frequency is required to be set for the as3935 part, and
document such usage.

Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Signed-off-by: Matt Ranostay <matt.ranostay-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
---
 Documentation/devicetree/bindings/iio/proximity/as3935.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/proximity/as3935.txt b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
index ae23dd8da736..96dad93fccca 100644
--- a/Documentation/devicetree/bindings/iio/proximity/as3935.txt
+++ b/Documentation/devicetree/bindings/iio/proximity/as3935.txt
@@ -3,6 +3,7 @@ Austrian Microsystems AS3935 Franklin lightning sensor device driver
 Required properties:
 	- compatible: must be "ams,as3935"
 	- reg: SPI chip select number for the device
+	- spi-max-frequency: specifies maximum SPI clock frequency
 	- spi-cpha: SPI Mode 1. Refer to spi/spi-bus.txt for generic SPI
 	slave node bindings.
 	- interrupt-parent : should be the phandle for the interrupt controller
@@ -21,6 +22,7 @@ Example:
 as3935@0 {
 	compatible = "ams,as3935";
 	reg = <0>;
+	spi-max-frequency = <400000>;
 	spi-cpha;
 	interrupt-parent = <&gpio1>;
 	interrupts = <16 1>;
-- 
2.11.0
