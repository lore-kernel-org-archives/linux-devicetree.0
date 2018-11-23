From: zoro <long17.cool@163.com>
Subject: [PATCH 3/3] dt-bindings: rtc: sd3078: add device tree documentation
Date: Fri, 23 Nov 2018 18:14:44 +0800
Message-ID: <1542968084-3982-3-git-send-email-long17.cool@163.com>
References: <1542968084-3982-1-git-send-email-long17.cool@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542968084-3982-1-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com
Cc: a.zummo@towertech.it, robh@kernel.org, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zoro <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

The devicetree documentation for the SD3078 device tree
binding is added with a short example.

Signed-off-by: zoro <long17.cool@163.com>
---
 .../devicetree/bindings/rtc/rtc-sd3078.txt         |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sd3078.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
new file mode 100644
index 0000000..676cee8
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
@@ -0,0 +1,13 @@
+SD3078 Real Time Clock
+============================
+
+Required properties:
+- compatible: Should contain "whwave,sd3078".
+- reg: I2C address for chip.
+
+Example:
+
+sd3078: sd3078@32 {
+       compatible = "whwave,sd3078";
+       reg = <0x32>;
+};
-- 
1.7.9.5
