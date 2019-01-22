Return-Path: <>
From: Martin Kelly <martin@martingkelly.com>
Subject: [PATCH v2 3/6] dt-bindings: fix incorrect bmi160 IRQ note
Date: Mon, 21 Jan 2019 18:04:28 -0800
Message-Id: <20190122020431.5338-3-martin@martingkelly.com>
In-Reply-To: <20190122020431.5338-1-martin@martingkelly.com>
References: <20190122020431.5338-1-martin@martingkelly.com>
To: linux-iio@vger.kernel.org
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Daniel Baluta <daniel.baluta@gmail.com>, devicetree@vger.kernel.org, Martin Kelly <martin@martingkelly.com>
List-ID: <devicetree@vger.kernel.org>

From: Martin Kelly <martin@martingkelly.com>

The bmi160 bindings say that the BMI160 requires level-triggered,
active-low interrupts, but it actually supports all interrupt types, so fix
the note to reflect that.

Signed-off-by: Martin Kelly <martin@martingkelly.com>
---
 Documentation/devicetree/bindings/iio/imu/bmi160.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/imu/bmi160.txt b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
index 0c1c105fb503..1aec19997fb5 100644
--- a/Documentation/devicetree/bindings/iio/imu/bmi160.txt
+++ b/Documentation/devicetree/bindings/iio/imu/bmi160.txt
@@ -9,7 +9,7 @@ Required properties:
  - spi-max-frequency : set maximum clock frequency (only for SPI)
 
 Optional properties:
- - interrupts : interrupt mapping for IRQ, must be IRQ_TYPE_LEVEL_LOW
+ - interrupts : interrupt mapping for IRQ
  - interrupt-names : set to "INT1" if INT1 pin should be used as interrupt
    input, set to "INT2" if INT2 pin should be used instead
 
@@ -20,7 +20,7 @@ bmi160@68 {
 	reg = <0x68>;
 
 	interrupt-parent = <&gpio4>;
-	interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+	interrupts = <12 IRQ_TYPE_EDGE_RISING>;
 	interrupt-names = "INT1";
 };
 
-- 
2.11.0
