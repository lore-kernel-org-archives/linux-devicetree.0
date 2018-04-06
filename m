Return-Path: <SRS0=U5K/=G3=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:42164 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbeDFFPI (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 6 Apr 2018 01:15:08 -0400
Received: by mail-pf0-f193.google.com with SMTP id o16so4763372pfk.9
        for <devicetree@vger.kernel.org>; Thu, 05 Apr 2018 22:15:08 -0700 (PDT)
From: Matt Ranostay <matt.ranostay@konsulko.com>
Subject: [PATCH v7 1/2] media: dt-bindings: Add bindings for panasonic,amg88xx
Date: Thu,  5 Apr 2018 22:14:48 -0700
Message-Id: <20180406051449.32157-2-matt.ranostay@konsulko.com>
In-Reply-To: <20180406051449.32157-1-matt.ranostay@konsulko.com>
References: <20180406051449.32157-1-matt.ranostay@konsulko.com>
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

