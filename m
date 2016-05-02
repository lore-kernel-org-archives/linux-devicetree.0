From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v2 2/5] ARM: dts: vfxxx: Add device tree node for OCOTP
Date: Mon,  2 May 2016 12:35:01 +0530
Message-ID: <b5c1ff5a805eae3e53f07f8d0161f0af51586c00.1462171990.git.maitysanchayan@gmail.com>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1462171989.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1462171989.git.maitysanchayan@gmail.com>
References: <cover.1462171989.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, shawnguo@kernel.org
Cc: stefan@agner.ch, robh+dt@kernel.org, lee.jones@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Add device tree node for the OCOTP peripheral on Vybrid.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 2c13ec6..0e34d44 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -520,6 +520,22 @@
 				status = "disabled";
 			};
 
+			ocotp@400a5000 {
+				compatible = "fsl,vf610-ocotp";
+				#address-cells = <1>;
+				#size-cells = <1>;
+				reg = <0x400a5000 0xCF0>;
+				clocks = <&clks VF610_CLK_OCOTP>;
+
+				ocotp_cfg0: cfg0@410 {
+					reg = <0x410 0x4>;
+				};
+
+				ocotp_cfg1: cfg1@420 {
+					reg = <0x420 0x4>;
+				};
+			};
+
 			snvs0: snvs@400a7000 {
 			    compatible = "fsl,sec-v4.0-mon", "syscon", "simple-mfd";
 				reg = <0x400a7000 0x2000>;
-- 
2.8.2
