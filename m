Return-Path: <SRS0=IqaF=OU=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:37198 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbeLKPRo (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 11 Dec 2018 10:17:44 -0500
Received: by mail-lf1-f68.google.com with SMTP id p17so11077200lfh.4
        for <devicetree@vger.kernel.org>; Tue, 11 Dec 2018 07:17:43 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v4 1/2] media: dt-bindings: media: video-i2c: add melexis mlx90640 documentation
Date: Tue, 11 Dec 2018 07:17:00 -0800
Message-Id: <20181211151701.10002-2-matt.ranostay@konsulko.com>
In-Reply-To: <20181211151701.10002-1-matt.ranostay@konsulko.com>
References: <20181211151701.10002-1-matt.ranostay@konsulko.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Matt Ranostay <matt.ranostay@konsulko.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Cc: devicetree@vger.kernel.org
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../bindings/media/i2c/melexis,mlx90640.txt   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
new file mode 100644
index 000000000000..060d2b7a5893
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/melexis,mlx90640.txt
@@ -0,0 +1,20 @@
+* Melexis MLX90640 FIR Sensor
+
+Melexis MLX90640 FIR sensor support which allows recording of thermal data
+with 32x24 resolution excluding 2 lines of coefficient data that is used by
+userspace to render processed frames.
+
+Required Properties:
+ - compatible : Must be "melexis,mlx90640"
+ - reg : i2c address of the device
+
+Example:
+
+	i2c0@1c22000 {
+		...
+		mlx90640@33 {
+			compatible = "melexis,mlx90640";
+			reg = <0x33>;
+		};
+		...
+	};
-- 
2.17.1
