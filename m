From: =?UTF-8?q?Randolph=20Maa=C3=9Fen?= <gaireg@gaireg.de>
Subject: [PATCH 1/2] dt-bindings: iio: imu: add icm20602 bindings to mpu6050
Date: Tue, 22 Jan 2019 13:02:13 +0100
Message-ID: <20190122120221.27187-1-gaireg@gaireg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gaireg@gaireg.de
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Masney <masneyb@onstation.org>, Jonathan Marek <jonathan@marek.ca>, Martin Kelly <mkelly@xevo.com>, Douglas Fischer <fischerdouglasc@gmail.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adding the invensense ICM-20602 to the compatible list of the mpu6050
driver

Signed-off-by: Randolph Maaßen <gaireg@gaireg.de>
---
 Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
index 6ab9a9d196b0..268bf7568e19 100644
--- a/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
+++ b/Documentation/devicetree/bindings/iio/imu/inv_mpu6050.txt
@@ -11,6 +11,7 @@ Required properties:
 		"invensense,mpu9250"
 		"invensense,mpu9255"
 		"invensense,icm20608"
+		"invensense,icm20602"
  - reg : the I2C address of the sensor
  - interrupts: interrupt mapping for IRQ. It should be configured with flags
    IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_EDGE_RISING, IRQ_TYPE_LEVEL_LOW or
-- 
2.11.0
