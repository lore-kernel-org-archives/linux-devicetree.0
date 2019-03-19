Return-Path: <SRS0=L7Fd=RW=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46728 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725934AbfCSHkT (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Tue, 19 Mar 2019 03:40:19 -0400
Received: by mail-lf1-f67.google.com with SMTP id y62so5529510lfc.13
        for <devicetree@vger.kernel.org>; Tue, 19 Mar 2019 00:40:18 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2 v2] rtc: x1205: Add DT bindings
Date: Tue, 19 Mar 2019 08:40:13 +0100
Message-Id: <20190319074014.20616-1-linus.walleij@linaro.org>
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
ChangeLog v1->v2:
- Rebase on v5.1-rc1
- Resend
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
