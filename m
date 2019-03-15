Return-Path: <SRS0=qIkx=RS=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59628 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728820AbfCOKIv (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Fri, 15 Mar 2019 06:08:51 -0400
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add lsm6dsox device bindings
Date: Fri, 15 Mar 2019 11:08:25 +0100
Message-Id: <a633a5633b93d4a131a88b94d29ea263eea64fe9.1552643968.git.lorenzo@kernel.org>
In-Reply-To: <cover.1552643968.git.lorenzo@kernel.org>
References: <cover.1552643968.git.lorenzo@kernel.org>
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
index 8f1b09e39c72..4640a012c17a 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -9,6 +9,7 @@ Required properties:
   "st,ism330dlc"
   "st,lsm6dso"
   "st,asm330lhh"
+  "st,lsm6dsox"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
