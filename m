Return-Path: <SRS0=aoSJ=GU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35996 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752749AbeC3UeC (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 30 Mar 2018 16:34:02 -0400
Received: by mail-wm0-f67.google.com with SMTP id x82so18279056wmg.1
        for <devicetree@vger.kernel.org>; Fri, 30 Mar 2018 13:34:02 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] Documentation: dt: iio: imu: st_lsm6dsx: add ism330dlc sensor device binding
Date: Fri, 30 Mar 2018 22:33:51 +0200
Message-Id: <20180330203351.22681-3-lorenzo.bianconi@redhat.com>
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 1ff1af799c76..ef8a8566c63f 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -6,6 +6,7 @@ Required properties:
   "st,lsm6ds3h"
   "st,lsm6dsl"
   "st,lsm6dsm"
+  "st,ism330dlc"
 - reg: i2c address of the sensor / spi cs line
 
 Optional properties:
-- 
2.16.2

