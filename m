From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 1/3] dt-bindings: hwmon: Add tachometer interrupt to pwm-fan
Date: Wed, 30 Jan 2019 16:07:05 +0100
Message-ID: <1548860827-29796-2-git-send-email-stefan.wahren@i2se.com>
References: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548860827-29796-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds the tachometer interrupt to the pwm-fan binding, which is
necessary for RPM support.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 49ca5d8..7f69b0b 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -8,6 +8,9 @@ Required properties:
 
 Optional properties:
 - fan-supply    : phandle to the regulator that provides power to the fan
+- interrupts    : contains a single interrupt specifier which describes the
+                  tachometer pin output of a 2 pulse-per-revolution fan.
+                  See interrupt-controller/interrupts.txt for the format.
 
 Example:
 	fan0: pwm-fan {
-- 
2.7.4
