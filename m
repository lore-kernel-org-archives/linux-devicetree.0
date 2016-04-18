From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v4 3/4] devicetree: Add ANX7814 SlimPort transmitter binding.
Date: Mon, 18 Apr 2016 13:26:11 +0200
Message-ID: <1460978772-7569-4-git-send-email-enric.balletbo@collabora.com>
References: <1460978772-7569-1-git-send-email-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1460978772-7569-1-git-send-email-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, treding@nvidia.com
Cc: airlied@linux.ie, robh+dt@kernel.org, djkurtz@chromium.org, drinkcat@chromium.org, dan.carpenter@oracle.com, Rob Herring <robh@kernel.org>
List-Id: devicetree@vger.kernel.org

The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
designed for portable devices.

Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Rob Herring <robh@kernel.org>
---
Changes since v3:
 - Model v10 as regulator (dvdd10-supply)
 - Removed the Acked-by: Rob Herring. Guess I need your ack again if you're agree
   with the change.
Changes since v2:
 - Add Acked-by: Rob Herring <robh@kernel.org>

Changes since v1:
 - Rob Herring:
   - Rename cable-det-gpios for hpd-gpios as is more standard
   - Fix HDMI output for HDMI input

 .../devicetree/bindings/video/bridge/anx7814.txt   | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/video/bridge/anx7814.txt

diff --git a/Documentation/devicetree/bindings/video/bridge/anx7814.txt b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
new file mode 100644
index 0000000..b2a22c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/video/bridge/anx7814.txt
@@ -0,0 +1,40 @@
+Analogix ANX7814 SlimPort (Full-HD Transmitter)
+-----------------------------------------------
+
+The ANX7814 is an ultra-low power Full-HD (1080p60) SlimPort transmitter
+designed for portable devices.
+
+Required properties:
+
+ - compatible		: "analogix,anx7814"
+ - reg			: I2C address of the device
+ - interrupt-parent	: Should be the phandle of the interrupt controller
+			  that services interrupts for this device
+ - interrupts		: Should contain the INTP interrupt
+ - hpd-gpios		: Which GPIO to use for hpd
+ - pd-gpios		: Which GPIO to use for power down
+ - reset-gpios		: Which GPIO to use for reset
+
+Optional properties:
+
+ - dvdd10-supply	: Regulator for 1.0V digital core power.
+ - Video port for HDMI input, using the DT bindings defined in [1].
+
+[1]: Documentation/devicetree/bindings/media/video-interfaces.txt
+
+Example:
+
+	anx7814: anx7814@38 {
+		compatible = "analogix,anx7814";
+		reg = <0x38>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <99 IRQ_TYPE_LEVEL_LOW>;   /* INTP */
+		hpd-gpios = <&pio 36 GPIO_ACTIVE_HIGH>;
+		pd-gpios = <&pio 33 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&pio 98 GPIO_ACTIVE_HIGH>;
+		port {
+			anx7814_in: endpoint {
+				remote-endpoint = <&hdmi0_out>;
+			};
+		};
+	};
-- 
2.1.0
