Return-Path: <SRS0=dKdi=SG=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57150 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729261AbfDDQCw (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 4 Apr 2019 12:02:52 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsr device bindings
Date: Thu,  4 Apr 2019 18:02:35 +0200
Message-Id: <d72fe86f431bbf68ebeec0b234f4c57881e86c82.1554393394.git.lorenzo@kernel.org>
In-Reply-To: <cover.1554393393.git.lorenzo@kernel.org>
References: <cover.1554393393.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 4640a012c17a..efec9ece034a 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -10,6 +10,7 @@ Required properties:
   "st,lsm6dso"
   "st,asm330lhh"
   "st,lsm6dsox"
+  "st,lsm6dsr"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
