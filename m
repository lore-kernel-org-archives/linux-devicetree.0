Return-Path: <SRS0=dUsd=NW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:35412 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbeKLAEo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Sun, 11 Nov 2018 19:04:44 -0500
Received: by mail-wr1-f68.google.com with SMTP id z16-v6so6568301wrv.2
        for <devicetree@vger.kernel.org>; Sun, 11 Nov 2018 06:16:02 -0800 (PST)
From: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 9/9] dt-bindings: iio: imu: st_lsm6dsx: add support to i2c pullup resistors
Date: Sun, 11 Nov 2018 15:15:36 +0100
Message-Id: <97543627e6e0a26d7ea6b4daa160f10813c05335.1541945612.git.lorenzo.bianconi@redhat.com>
In-Reply-To: <cover.1541945612.git.lorenzo.bianconi@redhat.com>
References: <cover.1541945612.git.lorenzo.bianconi@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: jic23@kernel.org
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>
---
 Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
index 879322ad50fd..69d53d98d0f0 100644
--- a/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
+++ b/Documentation/devicetree/bindings/iio/imu/st_lsm6dsx.txt
@@ -13,6 +13,7 @@ Required properties:
 Optional properties:
 - st,drdy-int-pin: the pin on the package that will be used to signal
   "data ready" (valid values: 1 or 2).
+- st,pullups : enable/disable internal i2c controller pullup resistors.
 - drive-open-drain: the interrupt/data ready line will be configured
   as open drain, which is useful if several sensors share the same
   interrupt line. This is a boolean property.
-- 
2.19.1
