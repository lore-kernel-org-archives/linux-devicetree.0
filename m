From: Jan Kotas <jank@cadence.com>
Subject: [PATCH v3 1/2] dt-bindings: rtc: Add bindings for Cadence RTC
Date: Tue, 22 Jan 2019 10:42:15 +0000
Message-ID: <20190122104216.12077-2-jank@cadence.com>
References: <20190122104216.12077-1-jank@cadence.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190122104216.12077-1-jank@cadence.com>
Sender: linux-kernel-owner@vger.kernel.org
To: a.zummo@towertech.it, alexandre.belloni@bootlin.com, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Jan Kotas <jank@cadence.com>
List-Id: devicetree@vger.kernel.org

This patch adds a DT binding documentation for
Cadence RTC controller.

Signed-off-by: Jan Kotas <jank@cadence.com>
---
 Documentation/devicetree/bindings/rtc/cdns,rtc.txt | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/cdns,rtc.txt

diff --git a/Documentation/devicetree/bindings/rtc/cdns,rtc.txt b/Documentation/devicetree/bindings/rtc/cdns,rtc.txt
new file mode 100644
index 000000000..14a04487b
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/cdns,rtc.txt
@@ -0,0 +1,25 @@
+Cadence Real Time Clock
+
+The Cadence RTC controller with date, time and alarm capabilities.
+The alarm may wake the system from low-power state.
+
+Required properties:
+- compatible: Should be "cdns,rtc-r109v3"
+- reg: Specifies base physical address and size of the register area.
+- interrupts: A single interrupt specifier.
+- clocks: Must contain two entries:
+	- pclk: APB registers clock
+	- ref_clk: reference 1Hz or 100Hz clock, depending on IP configuration
+	See ../clocks/clock-bindings.txt for details.
+
+Example:
+        rtc0: rtc@fd080000 {
+        	compatible = "cdns,rtc-r109v3";
+        	reg = <0xfd080000 0x1000>;
+
+        	clock-names = "pclk", "ref_clk";
+        	clocks = <&sysclock>, <&refclock>;
+
+        	interrupt-parent = <&gic>;
+        	interrupts = <0 6 IRQ_TYPE_LEVEL_HIGH>;
+        };
-- 
2.15.0
