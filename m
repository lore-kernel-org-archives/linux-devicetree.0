From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] hwmon: ina2xx: Document compatible for INA231
Date: Wed, 01 Jun 2016 11:43:12 +0200
Message-ID: <1464774192-21887-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: devicetree@vger.kernel.org

Document the compatible for INA231 sensor.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 Documentation/devicetree/bindings/hwmon/ina2xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/ina2xx.txt b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
index 9bcd5e87830d..02af0d94e921 100644
--- a/Documentation/devicetree/bindings/hwmon/ina2xx.txt
+++ b/Documentation/devicetree/bindings/hwmon/ina2xx.txt
@@ -7,6 +7,7 @@ Required properties:
 	- "ti,ina220" for ina220
 	- "ti,ina226" for ina226
 	- "ti,ina230" for ina230
+	- "ti,ina231" for ina231
 - reg: I2C address
 
 Optional properties:
-- 
1.9.1
