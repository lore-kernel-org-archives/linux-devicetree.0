From: ahaslam@baylibre.com
Subject: [RFC 3/3] regulator: fixed: dt: Allow an optional over current pin
Date: Wed, 26 Oct 2016 21:00:54 +0200
Message-ID: <20161026190054.11968-4-ahaslam@baylibre.com>
References: <20161026190054.11968-1-ahaslam@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161026190054.11968-1-ahaslam@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org, lgirdwood@gmail.com, khilman@baylibre.com, nsekhar@ti.com, david@lechnology.com
Cc: linux-kernel@vger.kernel.org, Axel Haslam <ahaslam@baylibre.com>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Axel Haslam <ahaslam@baylibre.com>

Add support for an optional over current input pin which
can be used to send an over current event to the regulator
consumer.

Cc: devicetree@vger.kernel.org
Signed-off-by: Axel Haslam <ahaslam@baylibre.com>
---
 Documentation/devicetree/bindings/regulator/fixed-regulator.txt | 4 ++++
 drivers/regulator/fixed.c                                       | 8 ++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
index 4fae41d..0c140cb 100644
--- a/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
+++ b/Documentation/devicetree/bindings/regulator/fixed-regulator.txt
@@ -11,6 +11,8 @@ If this property is missing, the default assumed is Active low.
 - gpio-open-drain: GPIO is open drain type.
   If this property is missing then default assumption is false.
 -vin-supply: Input supply name.
+- oc-gpio: Input gpio that signals an over current condition.
+- oc-active-high: The polarity of the over current pin is high.
 
 Any property defined as part of the core regulator
 binding, defined in regulator.txt, can also be used.
@@ -26,9 +28,11 @@ Example:
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 		gpio = <&gpio1 16 0>;
+		oc-gpio = <&gpio1 18 0>;
 		startup-delay-us = <70000>;
 		enable-active-high;
 		regulator-boot-on;
 		gpio-open-drain;
+		oc-active-high;
 		vin-supply = <&parent_reg>;
 	};
diff --git a/drivers/regulator/fixed.c b/drivers/regulator/fixed.c
index 9937139..f02d24c 100644
--- a/drivers/regulator/fixed.c
+++ b/drivers/regulator/fixed.c
@@ -86,6 +86,14 @@ struct fixed_voltage_data {
 	if ((config->gpio < 0) && (config->gpio != -ENOENT))
 		return ERR_PTR(config->gpio);
 
+	config->oc_gpio = of_get_named_gpio(np, "oc-gpio", 0);
+	if (gpio_is_valid(config->oc_gpio))
+		config->has_oc_gpio = true;
+	else if (config->oc_gpio != -ENOENT)
+		return ERR_PTR(config->oc_gpio);
+
+	config->oc_high = of_property_read_bool(np, "oc-active-high");
+
 	of_property_read_u32(np, "startup-delay-us", &config->startup_delay);
 
 	config->enable_high = of_property_read_bool(np, "enable-active-high");
-- 
1.9.1
