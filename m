Return-Path: <SRS0=Ax0d=F6=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:37664 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752111AbeCHSVs (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 8 Mar 2018 13:21:48 -0500
Received: by mail-pg0-f67.google.com with SMTP id y26so2536190pgv.4
        for <devicetree@vger.kernel.org>; Thu, 08 Mar 2018 10:21:48 -0800 (PST)
From: Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v5 1/2] media: dt-bindings: Add bindings for panasonic,amg88xx
Date: Thu,  8 Mar 2018 10:21:40 -0800
Message-Id: <20180308182141.28997-2-matt.ranostay@konsulko.com>
In-Reply-To: <20180308182141.28997-1-matt.ranostay@konsulko.com>
References: <20180308182141.28997-1-matt.ranostay@konsulko.com>
Sender: devicetree-owner@vger.kernel.org
To: linux-media@vger.kernel.org
Cc: Matt Ranostay <matt.ranostay@konsulko.com>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

Define the device tree bindings for the panasonic,amg88xx i2c
video driver.

Cc: devicetree@vger.kernel.org
Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
---
 .../bindings/media/i2c/panasonic,amg88xx.txt          | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt

diff --git a/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt b/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt
new file mode 100644
index 000000000000..4a3181a3dd7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/panasonic,amg88xx.txt
@@ -0,0 +1,19 @@
+* Panasonic AMG88xx
+
+The Panasonic family of AMG88xx Grid-Eye sensors allow recording
+8x8 10Hz video which consists of thermal datapoints
+
+Required Properties:
+ - compatible : Must be "panasonic,amg88xx"
+ - reg : i2c address of the device
+
+Example:
+
+	i2c0@1c22000 {
+		...
+		amg88xx@69 {
+			compatible = "panasonic,amg88xx";
+			reg = <0x69>;
+		};
+		...
+	};
-- 
2.14.1

