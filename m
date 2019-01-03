From: Srinath Mannam <srinath.mannam@broadcom.com>
Subject: [PATCH v6 3/3] arm64: dts: stingray: Add Stingray Thermal DT support.
Date: Thu,  3 Jan 2019 14:25:34 +0530
Message-ID: <1546505734-24527-4-git-send-email-srinath.mannam@broadcom.com>
References: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1546505734-24527-1-git-send-email-srinath.mannam@broadcom.com>
Sender: linux-kernel-owner@vger.kernel.org
To: daniel.lezcano@linaro.org, Zhang Rui <rui.zhang@intel.com>, Eduardo Valentin <edubezval@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, Pramod Kumar <pramod.kumar@broadcom.com>, Srinath Mannam <srinath.mannam@broadcom.com>
List-Id: devicetree@vger.kernel.org

From: Pramod Kumar <pramod.kumar@broadcom.com>

Add DT nodes for thermal zones memory base address
to read temperature.

Signed-off-by: Pramod Kumar <pramod.kumar@broadcom.com>
Signed-off-by: Srinath Mannam <srinath.mannam@broadcom.com>
Reviewed-by: Ray Jui <ray.jui@broadcom.com>
Reviewed-by: Scott Branden <scott.branden@broadcom.com>
---
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi | 89 ++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
index cfeaa85..4fd06ed 100644
--- a/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
+++ b/arch/arm64/boot/dts/broadcom/stingray/stingray.dtsi
@@ -612,4 +612,93 @@
 			status = "disabled";
 		};
 	};
+
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
 };
-- 
2.7.4
