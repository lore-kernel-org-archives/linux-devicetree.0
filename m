From: Milo Kim <milo.kim@ti.com>
Subject: [PATCH 03/16] Documentation: dt-bindings: hwmon: add TI LMU HWMON binding information
Date: Mon, 2 Nov 2015 14:01:10 +0900
Message-ID: <1446440483-6948-4-git-send-email-milo.kim@ti.com>
References: <1446440483-6948-1-git-send-email-milo.kim@ti.com>
 <1446440483-6948-2-git-send-email-milo.kim@ti.com>
 <1446440483-6948-3-git-send-email-milo.kim@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1446440483-6948-3-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, lee.jones@linaro.org, linux-kernel@vger.kernel.org
Cc: Milo Kim <milo.kim@ti.com>, Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, lm-sensors@lm-sensors.org
List-Id: devicetree@vger.kernel.org

Hardware fault monitoring driver is used in LM3633 and LM3697 device.
Just 'compatible' property is required to describe the driver.

Cc: devicetree@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: lm-sensors@lm-sensors.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt

diff --git a/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt b/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
new file mode 100644
index 0000000..99cb241
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/ti-lmu-hwmon.txt
@@ -0,0 +1,12 @@
+TI LMU Hardware Monotoring device tree bindings
+
+LMU HWON driver monitors hardware fault situation of LMU devices,
+LM3633 and LM3697.
+
+Required properties:
+  - compatible: Should be one of lists below.
+                "ti,lm3633-hwmon"
+                "ti,lm3697-hwmon"
+
+Examples: Please refer to ti-lmu dt-bindings.
+          Documentation/devicetree/bindings/mfd/ti-lmu.txt
-- 
1.9.1
