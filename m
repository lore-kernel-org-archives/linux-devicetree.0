From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH v3 5/5] dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings
Date: Thu, 25 Jul 2019 07:31:32 +0200
Message-ID: <20190725053132.9589-6-martin.kepplinger@puri.sm>
References: <20190725053132.9589-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190725053132.9589-1-martin.kepplinger@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martin.kepplinger@puri.sm>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 92b48f242356..fd1722fc93af 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -12,6 +12,7 @@ Required properties:
   "st,lsm6dsox"
   "st,lsm6dsr"
   "st,lsm6ds3tr-c"
+  "st,lsm9ds1"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
