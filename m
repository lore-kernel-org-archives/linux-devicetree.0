From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH V3 1/3] dt-bindings: hwmon: Add tachometer interrupt to pwm-fan
Date: Fri, 22 Mar 2019 09:24:01 +0100
Message-ID: <1553243043-19486-2-git-send-email-stefan.wahren@i2se.com>
References: <1553243043-19486-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1553243043-19486-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Robin Murphy <robin.murphy@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds the tachometer interrupt to the pwm-fan binding, which is
necessary for RPM support.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/hwmon/pwm-fan.txt          | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 49ca5d8..722005f 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -7,7 +7,16 @@ Required properties:
 			which correspond to thermal cooling states
 
 Optional properties:
-- fan-supply    : phandle to the regulator that provides power to the fan
+- fan-supply		: phandle to the regulator that provides power to the fan
+- interrupts		: This contains a single interrupt specifier which
+			  describes the tachometer output of the fan as an
+			  interrupt source. The output signal must generate a
+			  defined number of interrupts per fan revolution, which
+			  require that it must be self resetting edge interrupts.
+			  See interrupt-controller/interrupts.txt for the format.
+- pulses-per-revolution : define the tachometer pulses per fan revolution as
+			  an integer (default is 2 interrupts per revolution).
+			  The value must be greater than zero.
 
 Example:
 	fan0: pwm-fan {
@@ -38,3 +47,14 @@ Example:
 					};
 			     };
 		};
+
+Example 2:
+	fan0: pwm-fan {
+		fan0: pwm-fan {
+		compatible = "pwm-fan";
+		pwms = <&pwm 0 40000 0>;
+		fan-supply = <&reg_fan>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+		pulses-per-revolution = <2>;
+	};
-- 
2.7.4
