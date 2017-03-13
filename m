From: Eva Rachel Retuya <eraretuya@gmail.com>
Subject: [PATCH 1/4] dt-bindings: iio: accel: adxl345: Add optional interrupt-names support
Date: Mon, 13 Mar 2017 19:11:34 +0800
Message-ID: <1489403497-27849-2-git-send-email-eraretuya@gmail.com>
References: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1489403497-27849-1-git-send-email-eraretuya@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jic23@kernel.org, linux-iio@vger.kernel.org
Cc: knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net, dmitry.torokhov@gmail.com, michael.hennerich@analog.com, daniel.baluta@gmail.com, amsfield22@gmail.com, florian.vaussard@heig-vd.ch, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, Eva Rachel Retuya <eraretuya@gmail.com>
List-Id: devicetree@vger.kernel.org

Add interrupt-names property in order to specify interrupt pin in use.

Signed-off-by: Eva Rachel Retuya <eraretuya@gmail.com>
---
 Documentation/devicetree/bindings/iio/accel/adxl345.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/accel/adxl345.txt b/Documentation/devicetree/bindings/iio/accel/adxl345.txt
index e7111b0..a7c9022 100644
--- a/Documentation/devicetree/bindings/iio/accel/adxl345.txt
+++ b/Documentation/devicetree/bindings/iio/accel/adxl345.txt
@@ -15,6 +15,8 @@ Optional properties:
    in Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
  - interrupts: interrupt mapping for IRQ as documented in
    Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
+ - interrupt-names: specify INTx pin in use. Should be "INT1" for INT1 pin or
+   "INT2" for INT2 pin.
 
 Example for a I2C device node:
 
@@ -23,6 +25,7 @@ Example for a I2C device node:
 		reg = <0x53>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "INT1";
 	};
 
 Example for a SPI device node:
@@ -35,4 +38,5 @@ Example for a SPI device node:
 		spi-cpha;
 		interrupt-parent = <&gpio1>;
 		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "INT1";
 	};
-- 
2.7.4
