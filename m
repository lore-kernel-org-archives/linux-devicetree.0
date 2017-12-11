From: =?UTF-8?q?Myl=C3=A8ne=20Josserand?=
        <mylene.josserand@free-electrons.com>
Subject: [PATCH 3/4] arm: dts: sun8i: a83t: Add CCI-400 node
Date: Mon, 11 Dec 2017 08:50:00 +0100
Message-ID: <20171211075001.6100-4-mylene.josserand@free-electrons.com>
References: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171211075001.6100-1-mylene.josserand@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: maxime.ripard@free-electrons.com, wens@csie.org, linux@armlinux.org.uk, robh+dt@kernel.org, mark.rutland@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, mylene.josserand@free-electrons.com, thomas.petazzoni@free-electrons.com
List-Id: devicetree@vger.kernel.org

Add CCI-400 node and control-port on CPUs needed by MCPM (ie SMP).

Signed-off-by: Mylène Josserand <mylene.josserand@free-electrons.com>
---
 arch/arm/boot/dts/sun8i-a83t.dtsi | 41 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-a83t.dtsi
index eeb2e7d0d6dc..3e2aad537972 100644
--- a/arch/arm/boot/dts/sun8i-a83t.dtsi
+++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
@@ -62,48 +62,56 @@
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu@1 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <1>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu@2 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <2>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu@3 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <3>;
+			cci-control-port = <&cci_control0>;
 		};
 
 		cpu@100 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0x100>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu@101 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0x101>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu@102 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0x102>;
+			cci-control-port = <&cci_control1>;
 		};
 
 		cpu@103 {
 			compatible = "arm,cortex-a7";
 			device_type = "cpu";
 			reg = <0x103>;
+			cci-control-port = <&cci_control1>;
 		};
 	};
 
@@ -314,6 +322,39 @@
 			status = "disabled";
 		};
 
+		cci: cci@1790000 {
+			compatible = "arm,cci-400";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0x01790000 0x1000>;
+			ranges = <0x0 0x01790000 0x10000>;
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
+				compatible = "arm,cci-400-pmu,r1";
+				reg = <0x9000 0x5000>;
+				interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 151 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>,
+				<GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		ccu: clock@1c20000 {
 			compatible = "allwinner,sun8i-a83t-ccu";
 			reg = <0x01c20000 0x400>;
-- 
2.11.0
