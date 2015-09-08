From: Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: [PATCHv2 2/3] devicetree: Add new ANX7814 SlimPort transmitter binding.
Date: Tue,  8 Sep 2015 09:25:20 +0200
Message-ID: <1441697120-3876-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, devel@driverdev.osuosl.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, airlied@linux.ie, gregkh@linuxfoundation.org, sjoerd.simons@collabora.co.uk, javier@dowhile0.org, span@analogixsemi.com, nathan.chung@mediatek.com
List-Id: devicetree@vger.kernel.org

The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
designed for portable devices.

You can add support to your board with current binding.

Example:

	anx7814: anx7814@38 {
		compatible = "analogix,anx7814";
		reg = <0x38>;
		pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
		reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
	};

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 .../devicetree/bindings/video/anx7814.txt          | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/anx7814.txt

diff --git a/Documentation/devicetree/bindings/video/anx7814.txt b/Documentation/devicetree/bindings/video/anx7814.txt
new file mode 100644
index 0000000..a8cc746
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/anx7814.txt
@@ -0,0 +1,22 @@
+Analogix ANX7814 SlimPort (Full-HD Transmitter)
+-----------------------------------------------
+
+The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
+designed for portable devices.
+
+Required properties:
+
+ - compatible	: "analogix,anx7814"
+ - reg		: I2C address of the device
+ - pd-gpios	: Which GPIO to use for power down
+ - reset-gpios	: Which GPIO to use for reset
+
+Example:
+
+	anx7814: anx7814@38 {
+		compatible = "analogix,anx7814";
+		reg = <0x38>;
+		pd-gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpio0 2 GPIO_ACTIVE_HIGH>;
+	};
+
-- 
2.1.0
