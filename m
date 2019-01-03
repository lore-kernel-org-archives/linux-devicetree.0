From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v6 1/3] dt-bindings: thermal: Add binding document for SR thermal
Date: Thu,  3 Jan 2019 14:25:32 +0530
Message-ID: <1546505734-24527-2-git-send-email-srinath.mannam@broadcom.com>
References: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar@broadcom.com>

Add binding document for supported thermal implementation
in Stingray.

Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../bindings/thermal/brcm,sr-thermal.txt           | 105 +++++++++++++++++++++
 1 file changed, 105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt

diff --git a/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
new file mode 100644
index 0000000..3ab3302
--- /dev/null
+++ b/Documentation/devicetree/bindings/thermal/brcm,sr-thermal.txt
@@ -0,0 +1,105 @@
+* Broadcom Stingray Thermal
+
+This binding describes thermal sensors that is part of Stingray SoCs.
+
+Required properties:
+- compatible : Must be "brcm,sr-thermal"
+- reg : Memory where tmon data will be available.
+- brcm,tmon-mask: A one cell bit mask of valid TMON sources.
+                  Each bit represents single TMON source.
+- #thermal-sensor-cells : Thermal sensor phandler
+- polling-delay: Max number of milliseconds to wait between polls.
+- thermal-sensors: A list of thermal sensor phandles and specifier.
+                   specifier value is tmon ID and it should be
+                   in correspond with brcm,tmon-mask.
+- temperature: trip temperature threshold in millicelsius.
+
+Example:
+	tmons {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x0 0x8f100000 0x100>;
+
+		tmon: tmon@0 {
+			compatible = "brcm,sr-thermal";
+			reg = <0x0 0x40>;
+			brcm,tmon-mask = <0x3f>;
+			#thermal-sensor-cells = <1>;
+		};
+	};
+
+	thermal-zones {
+		ihost0_thermal: ihost0-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 0>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+		ihost1_thermal: ihost1-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 1>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+		ihost2_thermal: ihost2-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 2>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+		ihost3_thermal: ihost3-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 3>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+		crmu_thermal: crmu-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 4>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+		nitro_thermal: nitro-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <1000>;
+			thermal-sensors = <&tmon 5>;
+			trips {
+				cpu-crit {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
-- 
2.7.4
