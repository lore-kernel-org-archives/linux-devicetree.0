Return-Path: <SRS0=OP5l=QE=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-lf1-f66.google.com ([209.85.167.66]:41942 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726668AbfA1WZp (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Mon, 28 Jan 2019 17:25:45 -0500
Received: by mail-lf1-f66.google.com with SMTP id c16so13115327lfj.8
        for <devicetree@vger.kernel.org>; Mon, 28 Jan 2019 14:25:44 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] i2c: Add DT bindings for Xscale I2C masters
Date: Mon, 28 Jan 2019 23:25:33 +0100
Message-Id: <20190128222534.32213-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, devicetree@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

This adds a device tree binding for Intel XScale I2C
masters. We define compatible strings for the iop3xx and
ixp4xx chip families.

Cc: devicetree@vger.kernel.org
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 .../devicetree/bindings/i2c/i2c-xscale.txt    | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-xscale.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-xscale.txt b/Documentation/devicetree/bindings/i2c/i2c-xscale.txt
new file mode 100644
index 000000000000..dcc8390e0d24
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-xscale.txt
@@ -0,0 +1,20 @@
+i2c Controller on XScale platforms such as IOP3xx and IXP4xx
+
+Required properties:
+- compatible : Must be one of
+  "intel,iop3xx-i2c"
+  "intel,ixp4xx-i2c";
+- reg
+- #address-cells = <1>;
+- #size-cells = <0>;
+
+Optional properties:
+- Child nodes conforming to i2c bus binding
+
+Example:
+
+i2c@c8011000 {
+	compatible = "intel,ixp4xx-i2c";
+	reg = <0xc8011000 0x18>;
+	interrupts = <33 IRQ_TYPE_LEVEL_LOW>;
+};
-- 
2.20.1
