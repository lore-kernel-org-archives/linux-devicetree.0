From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 1/2] dt-bindings: hwmon: Add optional regulator support to pwm-fan
Date: Fri, 22 Feb 2019 14:45:23 +0100
Message-ID: <1550843124-10992-2-git-send-email-stefan.wahren@i2se.com>
References: <1550843124-10992-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1550843124-10992-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds an optional regulator support (e.g. switchable supply) to the
pwm fan binding.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index c6d5332..49ca5d8 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -6,6 +6,9 @@ Required properties:
 - cooling-levels      : PWM duty cycle values in a range from 0 to 255
 			which correspond to thermal cooling states
 
+Optional properties:
+- fan-supply    : phandle to the regulator that provides power to the fan
+
 Example:
 	fan0: pwm-fan {
 		compatible = "pwm-fan";
-- 
2.7.4
