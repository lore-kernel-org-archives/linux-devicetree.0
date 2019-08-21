From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v5 4/4] dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings
Date: Wed, 21 Aug 2019 15:25:20 +0200
Message-ID: <20190821132520.28225-5-martin.kepplinger@puri.sm>
References: <20190821132520.28225-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190821132520.28225-1-martin.kepplinger@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martin.kepplinger@puri.sm>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 87407d110bb7..0b0a74d9ab89 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -13,6 +13,7 @@ Required properties:
   "st,lsm6dsr"
   "st,lsm6ds3tr-c"
   "st,ism330dhcx"
+  "st,lsm9ds1"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
