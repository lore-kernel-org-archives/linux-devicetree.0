Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lj1-f196.google.com ([209.85.208.196]:41184 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726859AbfA1VGv (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Jan 2019 16:06:51 -0500
Received: by mail-lj1-f196.google.com with SMTP id k15-v6so15528979ljc.8
        for <devicetree@vger.kernel.org>; Mon, 28 Jan 2019 13:06:50 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] hwmon: (ad741x) Add DT bindings for Analog Devices AD741x
Date: Mon, 28 Jan 2019 22:06:36 +0100
Message-Id: <20190128210637.22323-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds device tree bindings for Analog Devices AD741x
as found in Gateway routers.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/hwmon/ad741x.txt          | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ad741x.txt b/Documentation/devicetree/bindings/hwmon/ad741x.txt
new file mode 100644
index 000000000000..9102152c8410
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ad741x.txt
@@ -0,0 +1,15 @@
+* AD7416/AD7417/AD7418 Temperature Sensor Device Tree Bindings
+
+Required properties:
+- compatible: one of
+		"adi,ad7416"
+		"adi,ad7417"
+		"adi,ad7418"
+- reg: I2C address
+
+Example:
+
+hwmon@28 {
+	compatible = "adi,ad7418";
+	reg = <0x28>;
+};
-- 
2.20.1
