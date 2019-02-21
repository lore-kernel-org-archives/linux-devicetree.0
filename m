Return-Path: <SRS0=TIRm=Q4=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725866AbfBUPUm (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Thu, 21 Feb 2019 10:20:42 -0500
From: Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH 2/2] dt-bindings: iio: imu: st_lsm6dsx: add asm330lhh device bindings
Date: Thu, 21 Feb 2019 16:20:21 +0100
Message-Id: <1df29add6d5a0fcdd51594f8cf4366c9086f6fc9.1550753006.git.lorenzo@kernel.org>
In-Reply-To: <cover.1550753006.git.lorenzo@kernel.org>
References: <cover.1550753006.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, mario.tesi@st.com, lorenzo.bianconi@redhat.com
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 69d53d98d0f0..8f1b09e39c72 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -8,6 +8,7 @@ Required properties:
   "st,lsm6dsm"
   "st,ism330dlc"
   "st,lsm6dso"
+  "st,asm330lhh"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.20.1
