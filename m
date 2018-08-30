From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v3 29/30] ARM: dts: sun8i: a83t: add thermal
 zone to A83T
Date: Thu, 30 Aug 2018 17:45:17 +0200
Message-ID: <20180830154518.29507-30-embed3d@gmail.com>
References: <20180830154518.29507-1-embed3d@gmail.com>
Reply-To: embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBD257DPK24NRBMFCUDOAKGQELWGPZNI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180830154518.29507-1-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, knaack.h-Mmb7MZpHnFY@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, pmeerw-jW+XmwGofnusTnJN9+BGXg@public.gmane.org, eugen.hristev-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org, rdunlap-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, vilhelm.gray-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, clabbe.montjoie-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org, icenowy-h8G6r0blFSE@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, arnaud.pouliquen-qxv4g6HH51o@public.gmane.org
Cc: linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch adds the thermal zones to the A83T. Sensor 0 is located
besides the cpu cluster 0. Sensor 1 is located besides cluster 1 and
sensor 2 is located besides in the gpu.

Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 103 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index f2f745930b08..78aa448e869f 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -50,6 +50,7 @@
 #include <dt-bindings/reset/sun8i-a83t-ccu.h>
 #include <dt-bindings/reset/sun8i-de2.h>
 #include <dt-bindings/reset/sun8i-r-ccu.h>
+#include <dt-bindings/thermal/thermal.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -69,6 +70,9 @@
 			cci-control-port = <&cci_control0>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0>;
+			#cooling-cells = <2>;
+			cooling-min-level = <0>;
+			cooling-max-level = <7>;
 		};
 
 		cpu@1 {
@@ -107,6 +111,9 @@
 			cci-control-port = <&cci_control1>;
 			enable-method = "allwinner,sun8i-a83t-smp";
 			reg = <0x100>;
+			#cooling-cells = <2>;
+			cooling-min-level = <0>;
+			cooling-max-level = <7>;
 		};
 
 		cpu@101 {
@@ -1035,4 +1042,100 @@
 			#size-cells = <0>;
 		};
 	};
+
+	thermal-zones {
+		cpu0_thermal: cpu0-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 0>;
+
+			trips {
+				cpu0_warm: cpu_warm {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_hot: cpu_hot {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_very_hot: cpu_very_hot {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu0_crit: cpu_crit {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				cpu_warm_limit_cpu {
+					trip = <&cpu0_warm>;
+					cooling-device = <&cpu0 THERMAL_NO_LIMIT 4>;
+				};
+				cpu_hot_limit_cpu {
+					trip = <&cpu0_hot>;
+					cooling-device = <&cpu0 5 5>;
+				};
+				cpu_very_hot_limit_cpu {
+					trip = <&cpu0_very_hot>;
+					cooling-device = <&cpu0 7 THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		cpu1_thermal: cpu1-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 1>;
+
+			trips {
+				cpu1_warm: cpu_warm {
+					temperature = <70000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu1_hot: cpu_hot {
+					temperature = <80000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu1_very_hot: cpu_very_hot {
+					temperature = <90000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+				cpu1_crit: cpu_crit {
+					temperature = <105000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+
+			cooling-maps {
+				cpu_warm_limit_cpu {
+					trip = <&cpu1_warm>;
+					cooling-device = <&cpu100 THERMAL_NO_LIMIT 4>;
+				};
+				cpu_hot_limit_cpu {
+					trip = <&cpu1_hot>;
+					cooling-device = <&cpu100 5 5>;
+				};
+				cpu_very_hot_limit_cpu {
+					trip = <&cpu1_very_hot>;
+					cooling-device = <&cpu100 7 THERMAL_NO_LIMIT>;
+				};
+			};
+		};
+
+		gpu_thermal: gpu-thermal {
+			polling-delay-passive = <1000>;
+			polling-delay = <5000>;
+			thermal-sensors = <&ths 2>;
+		};
+	};
 };
-- 
2.11.0
