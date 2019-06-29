Return-Path: <SRS0=waX1=U4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:35036 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726895AbfF2KOH (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Sat, 29 Jun 2019 06:14:07 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6ds3tr-c device bindings
Date: Sat, 29 Jun 2019 12:13:54 +0200
Message-Id: <89edf867d6abb738527889040f030036173fd5b8.1561802767.git.lorenzo@kernel.org>
In-Reply-To: <cover.1561802767.git.lorenzo@kernel.org>
References: <cover.1561802767.git.lorenzo@kernel.org>
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
index efec9ece034a..92b48f242356 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -11,6 +11,7 @@ Required properties:
   "st,asm330lhh"
   "st,lsm6dsox"
   "st,lsm6dsr"
+  "st,lsm6ds3tr-c"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.21.0
