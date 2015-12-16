From: Mans Rullgard <mans@mansr.com>
Subject: [PATCH 1/2] devicetree: sound: add binding for WM8974 codec
Date: Wed, 16 Dec 2015 13:02:54 +0000
Message-ID: <1450270975-17955-1-git-send-email-mans@mansr.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds a binding for the Wolfson WM8974 mono audio codec.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
The Linux driver for this device currently only supports I2C, but SPI
could easily be added if necessary, and DT bindings are supposed to be
generic.
---
 Documentation/devicetree/bindings/sound/wlf,wm8974.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/wlf,wm8974.txt

diff --git a/Documentation/devicetree/bindings/sound/wlf,wm8974.txt b/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
new file mode 100644
index 0000000..01d3a7c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/wlf,wm8974.txt
@@ -0,0 +1,15 @@
+WM8974 audio CODEC
+
+This device supports both I2C and SPI (configured with pin strapping
+on the board).
+
+Required properties:
+  - compatible: "wlf,wm8974"
+  - reg: the I2C address or SPI chip select number of the device
+
+Examples:
+
+codec: wm8974@1a {
+	compatible = "wlf,wm8974";
+	reg = <0x1a>;
+};
-- 
2.6.3
