Return-Path: <SRS0=ALZF=UD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mx1.mailbox.org ([80.241.60.212]:41238 "EHLO mx1.mailbox.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727239AbfFDLeQ (ORCPT <rfc822;devicetree@vger.kernel.org>);
        Tue, 4 Jun 2019 07:34:16 -0400
From: Stefan Roese <sr@denx.de>
Subject: [PATCH 1/2 v3] dt-bindings: i2c: i2c-mt7621: Add bindings for MediaTek MT7621/28/88 I2C
Date: Tue,  4 Jun 2019 13:34:06 +0200
Message-Id: <20190604113407.8948-1-sr@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>
List-ID: <devicetree@vger.kernel.org>

Add bindings for the I2C controller that can be found in the MediaTek
MT7621/7628/7688 SoCs.

Signed-off-by: Stefan Roese <sr@denx.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v3:
- New patch

 .../devicetree/bindings/i2c/i2c-mt7621.txt    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/i2c-mt7621.txt

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
new file mode 100644
index 000000000000..bc36f0eb94cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt7621.txt
@@ -0,0 +1,25 @@
+MediaTek MT7621/MT7628 I2C master controller
+
+Required properties:
+
+- compatible: Should be one of the following:
+  - "mediatek,mt7621-i2c": for MT7621/MT7628/MT7688 platforms
+- #address-cells: should be 1.
+- #size-cells: should be 0.
+- reg: Address and length of the register set for the device
+- resets: phandle to the reset controller asserting this device in
+          reset
+  See ../reset/reset.txt for details.
+
+Optional properties :
+
+Example:
+
+i2c: i2c@900 {
+	compatible = "mediatek,mt7621-i2c";
+	reg = <0x900 0x100>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	resets = <&rstctrl 16>;
+	reset-names = "i2c";
+};
-- 
2.21.0
