Return-Path: <SRS0=/guu=QH=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34078 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfAaPG5 (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Thu, 31 Jan 2019 10:06:57 -0500
Received: by mail-lf1-f68.google.com with SMTP id p6so2600470lfc.1
        for <devicetree@vger.kernel.org>; Thu, 31 Jan 2019 07:06:55 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] rtx: x1205: Add DT bindings
Date: Thu, 31 Jan 2019 16:06:41 +0100
Message-Id: <20190131150642.26289-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds device tree bindings for the Xircom X1205 RTC found
in the Linksys NSLU2.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/rtc/xircom,x1205.txt         | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/xircom,x1205.txt

diff --git a/Documentation/devicetree/bindings/rtc/xircom,x1205.txt b/Documentation/devicetree/bindings/rtc/xircom,x1205.txt
new file mode 100644
index 000000000000..3e3102a32728
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/xircom,x1205.txt
@@ -0,0 +1,12 @@
+* Xircom X1205 I2C RTC
+
+Required properties:
+- compatible: Should be "xircom,x1205"
+- reg: I2C address
+
+Example:
+
+rtc@6f {
+	compatible = "xicor,x1205";
+	reg = <0x6f>;
+};
-- 
2.20.1
