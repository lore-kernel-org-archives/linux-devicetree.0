From: zoro <long17.cool@163.com>
Subject: [PATCH 3/4] dt-bindings: rtc: sd3078: add device tree documentation
Date: Mon, 12 Nov 2018 13:45:14 +0800
Message-ID: <1542001514-8167-3-git-send-email-long17.cool@163.com>
References: <1542001514-8167-1-git-send-email-long17.cool@163.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542001514-8167-1-git-send-email-long17.cool@163.com>
Sender: linux-kernel-owner@vger.kernel.org
To: alexandre.belloni@bootlin.com
Cc: a.zummo@towertech.it, mark.rutland@arm.com, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, zoro <long17.cool@163.com>
List-Id: devicetree@vger.kernel.org

The devicetree documentation for the SD3078 device tree
binding is added with a short example.

Signed-off-by: zoro <long17.cool@163.com>
---
 .../devicetree/bindings/rtc/rtc-sd3078.txt         |   15 +++++++++++++++
 MAINTAINERS                                        |    1 +
 2 files changed, 16 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/rtc-sd3078.txt

diff --git a/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
new file mode 100644
index 0000000..9b45c8e
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
@@ -0,0 +1,15 @@
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
+
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 002fcd7..50c038d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16130,6 +16130,7 @@ M:	Zoro Li <long17.cool@163.com>
 L:	linux-rtc@vger.kernel.org
 S:	Maintained
 F:	drivers/rtc/rtc-sd3078.c
+F:	Documentation/devicetree/bindings/rtc/rtc-sd3078.txt
 
 WIIMOTE HID DRIVER
 M:	David Herrmann <dh.herrmann@googlemail.com>
-- 
1.7.9.5
