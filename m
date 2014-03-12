From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: [PATCH 1/3] dt-bindings: document gpio-charger bindings
Date: Wed, 12 Mar 2014 14:46:32 +0100
Message-ID: <2194340.F9etmr5mIo@phil>
References: <12569216.pGctOhkhxz@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <12569216.pGctOhkhxz@phil>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@bq.com>

This documents the binding for the gpio-charger power-supply.

Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>
---
 .../bindings/power_supply/gpio-charger.txt         | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power_supply/gpio-charger.txt

diff --git a/Documentation/devicetree/bindings/power_supply/gpio-charger.txt b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
new file mode 100644
index 0000000..fad87a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/power_supply/gpio-charger.txt
@@ -0,0 +1,23 @@
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
+	charger {
+		compatible = "gpio-charger";
+		charger-type = "usb-sdp";
+		gpios = <&gpf0 2 0 0 0>;
+	}
-- 
1.8.5.3
