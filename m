From: Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 3/3] ARM: dts: sun8i: a83t: add stable OPP
 tables and CPUfreq
Date: Wed, 28 Feb 2018 14:11:22 +0100
Message-ID: <97c8e53f8cc1dbf9f83e147c5296feaa8b463d18.1519823347.git-series.quentin.schulz@bootlin.com>
References: <cover.f1ec43f8d2a0151c52434f0952e973b19626f285.1519823347.git-series.quentin.schulz@bootlin.com>
Reply-To: quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-sunxi+bncBCLZXSNY5IDBBF6V3LKAKGQE2FEMIHA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <cover.f1ec43f8d2a0151c52434f0952e973b19626f285.1519823347.git-series.quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
In-Reply-To: <cover.f1ec43f8d2a0151c52434f0952e973b19626f285.1519823347.git-series.quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
References: <cover.f1ec43f8d2a0151c52434f0952e973b19626f285.1519823347.git-series.quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, maxime.ripard-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, thomas.petazzoni-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, mylene.josserand-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org, Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

The Allwinner A83T is an octacore A7 divided in two clusters of 4 A7,
each cluster having its own regulator and clock.

The operating points were found in Allwinner BSP and fex files.

Note that there are a few OPPs that are missing:

1608000000Hz with 920000mV
1800000000Hz with 1000000mV
2016000000Hz with 1080000mV

These OPPs are pretty unstable but it might be due to the SoC quickly
overheating (till the board completely shuts down).
It seems impossible to reach those frequencies with none or passive
cooling, so better leave them out by default.

It's still possible to add those OPPs on a per-board basis though.

Signed-off-by: Quentin Schulz <quentin.schulz-LDxbnhwyfcJBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 118 +++++++++++++++++++++++++++++++-
 1 file changed, 118 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index 016d22f..05d5dd7 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -56,55 +56,173 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	cpu0_opp_table: opp_table0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-864000000 {
+			opp-hz = /bits/ 64 <864000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1128000000 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+
+	cpu1_opp_table: opp_table1 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-480000000 {
+			opp-hz = /bits/ 64 <480000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-720000000 {
+			opp-hz = /bits/ 64 <720000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-864000000 {
+			opp-hz = /bits/ 64 <864000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-912000000 {
+			opp-hz = /bits/ 64 <912000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1128000000 {
+			opp-hz = /bits/ 64 <1128000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+
+		opp-1200000000 {
+			opp-hz = /bits/ 64 <1200000000>;
+			opp-microvolt = <840000>;
+			clock-latency-ns = <244144>; /* 8 32k periods */
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
 		cpu0: cpu@0 {
+			clocks = <&ccu CLK_C0CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
 			reg = <0>;
 		};
 
 		cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
 			reg = <1>;
 		};
 
 		cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
 			reg = <2>;
 		};
 
 		cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu0_opp_table>;
 			reg = <3>;
 		};
 
 		cpu100: cpu@100 {
+			clocks = <&ccu CLK_C1CPUX>;
+			clock-names = "cpu";
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu1_opp_table>;
 			reg = <0x100>;
 		};
 
 		cpu@101 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu1_opp_table>;
 			reg = <0x101>;
 		};
 
 		cpu@102 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu1_opp_table>;
 			reg = <0x102>;
 		};
 
 		cpu@103 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
+			operating-points-v2 = <&cpu1_opp_table>;
 			reg = <0x103>;
 		};
 	};
-- 
git-series 0.9.1
