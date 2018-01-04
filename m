From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: [PATCH v2 2/8] ARM: dts: sun9i: Add CCI-400 device
 nodes for A80
Date: Thu,  4 Jan 2018 22:37:48 +0800
Message-ID: <20180104143754.2425-3-wens@csie.org>
References: <20180104143754.2425-1-wens@csie.org>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCMILY6JWQBBBVHYXDJAKGQE5B2ZSJA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <20180104143754.2425-1-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Mylene JOSSERAND <mylene.josserand-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Dave Martin <Dave.Martin-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The A80 includes an ARM CCI-400 interconnect to support multi-cluster
CPU caches.

Also add the maximum clock frequency for the CPUs, as listed in the
A80 Optimus Board FEX file.

Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
---
 arch/arm/boot/dts/sun9i-a80.dtsi | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm/boot/dts/sun9i-a80.dtsi b/arch/arm/boot/dts/sun9i-a80.dtsi
index 90eac0b2a193..85fb800af8ab 100644
--- a/arch/arm/boot/dts/sun9i-a80.dtsi
+++ b/arch/arm/boot/dts/sun9i-a80.dtsi
@@ -63,48 +63,64 @@
 		cpu0: cpu@0 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			cci-control-port = <&cci_control0>;
+			clock-frequency = <12000000>;
 			reg = <0x0>;
 		};
 
 		cpu1: cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			cci-control-port = <&cci_control0>;
+			clock-frequency = <12000000>;
 			reg = <0x1>;
 		};
 
 		cpu2: cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			cci-control-port = <&cci_control0>;
+			clock-frequency = <12000000>;
 			reg = <0x2>;
 		};
 
 		cpu3: cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			cci-control-port = <&cci_control0>;
+			clock-frequency = <12000000>;
 			reg = <0x3>;
 		};
 
 		cpu4: cpu@100 {
 			compatible = "arm,cortex-a15";
 			device_type = "cpu";
+			cci-control-port = <&cci_control1>;
+			clock-frequency = <18000000>;
 			reg = <0x100>;
 		};
 
 		cpu5: cpu@101 {
 			compatible = "arm,cortex-a15";
 			device_type = "cpu";
+			cci-control-port = <&cci_control1>;
+			clock-frequency = <18000000>;
 			reg = <0x101>;
 		};
 
 		cpu6: cpu@102 {
 			compatible = "arm,cortex-a15";
 			device_type = "cpu";
+			cci-control-port = <&cci_control1>;
+			clock-frequency = <18000000>;
 			reg = <0x102>;
 		};
 
 		cpu7: cpu@103 {
 			compatible = "arm,cortex-a15";
 			device_type = "cpu";
+			cci-control-port = <&cci_control1>;
+			clock-frequency = <18000000>;
 			reg = <0x103>;
 		};
 	};
@@ -431,6 +447,36 @@
 			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
 
+		cci: cci@1c90000 {
+			compatible = "arm,cci-400";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x01c90000 0x1000>;
+			ranges = <0x0 0x01c90000 0x10000>;
+
+			cci_control0: slave-if@4000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x4000 0x1000>;
+			};
+
+			cci_control1: slave-if@5000 {
+				compatible = "arm,cci-400-ctrl-if";
+				interface-type = "ace";
+				reg = <0x5000 0x1000>;
+			};
+
+			pmu@9000 {
+				 compatible = "arm,cci-400-pmu,r1";
+				 reg = <0x9000 0x5000>;
+				 interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		de_clocks: clock@3000000 {
 			compatible = "allwinner,sun9i-a80-de-clks";
 			reg = <0x03000000 0x30>;
-- 
2.15.1
