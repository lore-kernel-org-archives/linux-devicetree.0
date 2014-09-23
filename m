From: Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v3 1/3] dt-bindings: document gpio-charger bindings
Date: Tue, 23 Sep 2014 13:59:03 +0200
Message-ID: <1411473545-3290-2-git-send-email-heiko@sntech.de>
References: <1411473545-3290-1-git-send-email-heiko@sntech.de>
Return-path: <linux-pm-owner@vger.kernel.org>
In-Reply-To: <1411473545-3290-1-git-send-email-heiko@sntech.de>
Sender: linux-pm-owner@vger.kernel.org
To: sre@kernel.org, dbaryshkov@gmail.com, dwmw2@infradead.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, dianders@chromium.org, heiko@sntech.de, Heiko Stuebner <heiko.stuebner@bq.com>
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@bq.com>

This documents the binding for the gpio-charger power-supply.

Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---
 .../bindings/power_supply/gpio-charger.txt         | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/gpio-charger.txt

diff --git a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
new file mode 100644
index 0000000..adbb5dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
@@ -0,0 +1,27 @@
+gpio-charger
+
+Required properties :
+ - compatible : "gpio-charger"
+ - gpios : GPIO indicating the charger presence.
+   See GPIO binding in bindings/gpio/gpio.txt .
+ - charger-type : power supply type, one of
+     unknown
+     battery
+     ups
+     mains
+     usb-sdp (USB standard downstream port)
+     usb-dcp (USB dedicated charging port)
+     usb-cdp (USB charging downstream port)
+     usb-aca (USB accessory charger adapter)
+
+Example:
+
+	usb_charger: charger {
+		compatible = "gpio-charger";
+		charger-type = "usb-sdp";
+		gpios = <&gpf0 2 0 0 0>;
+	}
+
+	battery {
+		power-supplies = <&usb_charger>;
+	};
-- 
2.1.0

