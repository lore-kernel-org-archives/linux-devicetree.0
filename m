From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3.1 2/2] dt-bindings: extcon: Add support for cros-ec device
Date: Mon, 17 Jul 2017 11:41:40 +0200
Message-ID: <20170717094140.6596-2-enric.balletbo@collabora.com>
References: <20170717094140.6596-1-enric.balletbo@collabora.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170717094140.6596-1-enric.balletbo@collabora.com>
Sender: linux-kernel-owner@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>, Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Benson Leung <bleung@chromium.org>, groeck@chromium.org
List-Id: devicetree@vger.kernel.org

From: Benson Leung <bleung@chromium.org>

This patch add documentation for binding of USB Type C cable detection
mechanism is using EXTCON subsystem. The device can detect the presence
of display out but it may also detect other external accessories when
external accessories is attached or detached.

Signed-off-by: Benson Leung <bleung@chromium.org>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes since v3:
 - Fix rebase.
Changes since v2:
 - Rebase on top v4.13-rc1
Changes since v1:
 - Added Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
 Requested by Rob Herring
 - Remove the Extcon word in the binding and replace it to describe better the
   h/w.
 - 'google,extcon-cros-ec' renamed to 'google,extcon-usbc-cros-ec' to indicate
   this is USB Type C related.

 .../bindings/extcon/extcon-usbc-cros-ec.txt        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt

diff --git a/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt
new file mode 100644
index 0000000..8e8625c
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/extcon-usbc-cros-ec.txt
@@ -0,0 +1,24 @@
+ChromeOS EC USB Type-C cable and accessories detection
+
+On ChromeOS systems with USB Type C ports, the ChromeOS Embedded Controller is
+able to detect the state of external accessories such as display adapters
+or USB devices when said accessories are attached or detached.
+
+The node for this device must be under a cros-ec node like google,cros-ec-spi
+or google,cros-ec-i2c.
+
+Required properties:
+- compatible:		Should be "google,extcon-usbc-cros-ec".
+- google,usb-port-id:	Specifies the USB port ID to use.
+
+Example:
+	cros-ec@0 {
+		compatible = "google,cros-ec-i2c";
+
+		...
+
+		extcon {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
+	}
-- 
2.9.3
