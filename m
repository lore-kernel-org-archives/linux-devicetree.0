From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH RFC 1/2] dt-bindings: hwmon: Add RPi PoE HAT documentation
Date: Sun,  2 Sep 2018 13:20:50 +0200
Message-ID: <1535887251-29515-2-git-send-email-stefan.wahren@i2se.com>
References: <1535887251-29515-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535887251-29515-1-git-send-email-stefan.wahren@i2se.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, Serge Schneider <serge@raspberrypi.org>, Stefan Wahren <stefan.wahren@i2se.com>, Phil Elwell <phil@raspberrypi.org>, linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Serge Schneider <serge@raspberrypi.org>

This patch adds the binding for the fan on the Raspberry Pi Power over
Ethernet HAT.

Signed-off-by: Serge Schneider <serge@raspberrypi.org>
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 .../devicetree/bindings/hwmon/rpi-poe-fan.txt      | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/rpi-poe-fan.txt

diff --git a/Documentation/devicetree/bindings/hwmon/rpi-poe-fan.txt b/Documentation/devicetree/bindings/hwmon/rpi-poe-fan.txt
new file mode 100644
index 0000000..c71f856
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/rpi-poe-fan.txt
@@ -0,0 +1,55 @@
+Bindings for the Raspberry Pi PoE HAT fan
+
+Required properties:
+- compatible	: "raspberrypi,rpi-poe-fan"
+- firmware	: Reference to the RPi firmware device node
+- pwms		: the PWM that is used to control the PWM fan
+- cooling-levels      : PWM duty cycle values in a range from 0 to 255
+			which correspond to thermal cooling states
+
+Example:
+	fan0: rpi-poe-fan@0 {
+		compatible = "raspberrypi,rpi-poe-fan";
+		firmware = <&firmware>;
+		cooling-min-state = <0>;
+		cooling-max-state = <3>;
+		#cooling-cells = <2>;
+		cooling-levels = <0 50 150 255>;
+		status = "okay";
+	};
+
+	thermal-zones {
+		cpu_thermal: cpu-thermal {
+			trips {
+				threshold: trip-point@0 {
+					temperature = <45000>;
+					hysteresis = <5000>;
+					type = "active";
+				};
+				target: trip-point@1 {
+					temperature = <50000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+				cpu_hot: cpu_hot@0 {
+					temperature = <55000>;
+					hysteresis = <2000>;
+					type = "active";
+				};
+			};
+			cooling-maps {
+				map0 {
+					trip = <&threshold>;
+					cooling-device = <&fan0 0 1>;
+				};
+				map1 {
+					trip = <&target>;
+					cooling-device = <&fan0 1 2>;
+				};
+				map2 {
+					trip = <&cpu_hot>;
+					cooling-device = <&fan0 2 3>;
+				};
+			};
+		};
+	};
-- 
2.7.4
