From: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v3 1/2] dt-bindings: hwmon: ina3221: Add ti,single-shot property
Date: Thu, 17 Jan 2019 15:12:52 -0800
Message-ID: <20190117231253.8828-2-nicoleotsuka@gmail.com>
References: <20190117231253.8828-1-nicoleotsuka@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117231253.8828-1-nicoleotsuka@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: jdelvare@suse.com, linux@roeck-us.net
Cc: robh+dt@kernel.org, mark.rutland@arm.com, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

By default, ina3221, as a hardware monitor, continuously measures
the inputs and generates corresponding data. However, for battery
powered devices, this mode might be power consuming.

This patch adds a "ti,single-shot" property to allow changing the
default continuous mode to single-shot operating mode.

Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changelog
v2->v3:
 * Added "Reviewed-by" from Rob
v1->v2:
 * N/A

 Documentation/devicetree/bindings/hwmon/ina3221.txt | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina3221.txt b/Documentation/devicetree/bindings/hwmon/ina3221.txt
index a7b25caa2b8e..fa63b6171407 100644
--- a/Documentation/devicetree/bindings/hwmon/ina3221.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina3221.txt
@@ -6,6 +6,16 @@ Texas Instruments INA3221 Device Tree Bindings
   - reg: I2C address
 
   Optional properties:
+  - ti,single-shot: This chip has two power modes: single-shot (chip takes one
+                    measurement and then shuts itself down) and continuous (
+                    chip takes continuous measurements). The continuous mode is
+                    more reliable and suitable for hardware monitor type device,
+                    but the single-shot mode is more power-friendly and useful
+                    for battery-powered device which cares power consumptions
+                    while still needs some measurements occasionally.
+                    If this property is present, the single-shot mode will be
+                    used, instead of the default continuous one for monitoring.
+
   = The node contains optional child nodes for three channels =
   = Each child node describes the information of input source =
 
-- 
2.17.1
