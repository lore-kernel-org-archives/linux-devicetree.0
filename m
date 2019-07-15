From: Martin Kepplinger <martin.kepplinger@puri.sm>
Subject: [PATCH 3/3] dt-bindings: iio: imu: st_lsm6dsx: add lsm9ds1 device bindings
Date: Mon, 15 Jul 2019 15:19:19 +0200
Message-ID: <20190715131919.31938-3-martin.kepplinger@puri.sm>
References: <20190715131919.31938-1-martin.kepplinger@puri.sm>
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715131919.31938-1-martin.kepplinger@puri.sm>
Sender: linux-kernel-owner@vger.kernel.org
To: lorenzo.bianconi83@gmail.com, jic23@kernel.org, knaack.h@gmx.de, lars@metafoo.de, pmeerw@pmeerw.net
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Martin Kepplinger <martin.kepplinger@puri.sm>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index efec9ece034a..c5ac1730ad22 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -11,6 +11,7 @@ Required properties:
   "st,asm330lhh"
   "st,lsm6dsox"
   "st,lsm6dsr"
+  "st,lsm9ds1"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
