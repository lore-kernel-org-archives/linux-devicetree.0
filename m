From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v4 1/5] ARM: dts: vfxxx: Add device tree node for OCOTP
Date: Thu,  7 Jul 2016 12:09:26 +0530
Message-ID: <06549a1c2183391a840ab02af705cbd4857b7f49.1467872014.git.maitysanchayan@gmail.com>
References: <cover.1467872014.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1467872014.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1467872014.git.maitysanchayan@gmail.com>
References: <cover.1467872014.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, shawnguo@kernel.org
Cc: stefan@agner.ch, robh+dt@kernel.org, srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>
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
2.9.0
