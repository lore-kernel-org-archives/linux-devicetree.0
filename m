From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v3 6/8] dt-bindings: iio: adc: max1027: Mark interrupts as optional
Date: Mon,  7 Oct 2019 15:26:55 +0200
Message-ID: <20191007132657.4190-7-miquel.raynal@bootlin.com>
References: <20191007132657.4190-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191007132657.4190-1-miquel.raynal@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

The chips have a 'start conversion' and a 'end of conversion' pair of
pins. They can be used but this is absolutely not mandatory as regular
polling is supported by the chip depending on its internal clocking
setup.

There is no physical reason to force the use of interrupts so turn
them optional.

Also, once the interrupt turned optional, these devices fit perfectly
the "trivial devices" described in the generic (yaml) bindings file, so
instead of converting this text file to json schema, we can just add
the relevant compatibles in:
Documentation/devicetree/bindings/trivial-devices.yaml.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/iio/adc/max1027-adc.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt b/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
index e680c61dfb84..7b23d68f655c 100644
--- a/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
+++ b/Documentation/devicetree/bindings/iio/adc/max1027-adc.txt
@@ -3,6 +3,8 @@
 Required properties:
   - compatible: Should be "maxim,max1027" or "maxim,max1029" or "maxim,max1031"
   - reg: SPI chip select number for the device
+
+Optional properties:
   - interrupts: IRQ line for the ADC
   see: Documentation/devicetree/bindings/interrupt-controller/interrupts.txt
 
-- 
2.20.1
