From: =?UTF-8?q?Randolph=20Maa=C3=9Fen?= <gaireg@gaireg.de>
Subject: [PATCH v2 1/2] dt-bindings: iio: imu: add icm20602 bindings to mpu6050
Date: Mon, 28 Jan 2019 19:50:02 +0100
Message-ID: <20190128185010.8275-1-gaireg@gaireg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gaireg@gaireg.de
Cc: Jonathan Cameron <jic23@kernel.org>, Hartmut Knaack <knaack.h@gmx.de>, Lars-Peter Clausen <lars@metafoo.de>, Peter Meerwald-Stadler <pmeerw@pmeerw.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Brian Masney <masneyb@onstation.org>, Jonathan Marek <jonathan@marek.ca>, Douglas Fischer <fischerdouglasc@gmail.com>, Martin Kelly <mkelly@xevo.com>, Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Hans de Goede <hdegoede@redhat.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Adding the invensense ICM-20602 to the compatible list of the mpu6050
driver

Signed-off-by: Randolph Maaßen <gaireg@gaireg.de>

---
Changes in v2:
- write i2c disable register using reg_set instead of define
- decide to write to i2c disable register based on reg_set instead of
  chip type
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
