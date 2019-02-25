From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC V2 1/3] dt-bindings: hwmon: Add tachometer interrupt to pwm-fan
Date: Mon, 25 Feb 2019 16:59:17 +0100
Message-ID: <1551110359-19860-2-git-send-email-stefan.wahren@i2se.com>
References: <1551110359-19860-1-git-send-email-stefan.wahren@i2se.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1551110359-19860-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kamil Debski <kamil@wypas.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Stefan Wahren <stefan.wahren@i2se.com>
List-Id: devicetree@vger.kernel.org

This adds the tachometer interrupt to the pwm-fan binding, which is
necessary for RPM support.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 Documentation/devicetree/bindings/hwmon/pwm-fan.txt | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
index 49ca5d8..7d09623 100644
--- a/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
+++ b/Documentation/devicetree/bindings/hwmon/pwm-fan.txt
@@ -8,6 +8,14 @@ Required properties:
 
 Optional properties:
 - fan-supply    : phandle to the regulator that provides power to the fan
+- interrupts      : This contains a single interrupt specifier which
+		    describes the tachometer output of the fan as an
+		    interrupt source. The output signal must generate a
+		    defined number of interrupts per fan revolution, which
+		    require that it must be self resetting edge interrupts.
+		    See interrupt-controller/interrupts.txt for the format.
+- interrupt-ratio : defines the ratio interrupts per fan revolution as an
+		    integer (default is 2 interrupts per revolution)
 
 Example:
 	fan0: pwm-fan {
@@ -38,3 +46,14 @@ Example:
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
+		interrupt-ratio = <2>;
+	};
-- 
2.7.4
