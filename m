From: Sanchayan Maity <maitysanchayan@gmail.com>
Subject: [PATCH v3 1/2] ARM: dts: vfxxx: Add OCOTP and OCROM nodes
Date: Fri, 22 May 2015 16:21:53 +0530
Message-ID: <958427d37a2e4ca8fd60d7f150a22299abfed127.1432290463.git.maitysanchayan@gmail.com>
References: <cover.1432290463.git.maitysanchayan@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1432290463.git.maitysanchayan@gmail.com>
In-Reply-To: <cover.1432290463.git.maitysanchayan@gmail.com>
References: <cover.1432290463.git.maitysanchayan@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: arnd@arndb.de, linux-arm-kernel@lists.infradead.org
Cc: stefan@agner.ch, shawn.guo@linaro.org, kernel@pengutronix.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sanchayan Maity <maitysanchayan@gmail.com>
List-Id: devicetree@vger.kernel.org

Add a device tree node for the On-Chip One Time Programmable
Controller (OCOTP) and the On-Chip ROM.

Signed-off-by: Sanchayan Maity <maitysanchayan@gmail.com>
---
 arch/arm/boot/dts/vfxxx.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
index 2f4b04d..66c529f 100644
--- a/arch/arm/boot/dts/vfxxx.dtsi
+++ b/arch/arm/boot/dts/vfxxx.dtsi
@@ -57,6 +57,11 @@
 		interrupt-parent = <&mscm_ir>;
 		ranges;
 
+		ocrom: ocrom {
+			compatible = "fsl,vf610-ocrom", "syscon";
+			reg = <0x00000000 0x18000>;
+		};
+
 		aips0: aips-bus@40000000 {
 			compatible = "fsl,aips-bus", "simple-bus";
 			#address-cells = <1>;
@@ -403,6 +408,11 @@
 				status = "disabled";
 			};
 
+			ocotp: ocotp@400a5000 {
+				compatible = "fsl,vf610-ocotp", "syscon";
+				reg = <0x400a5000 0x1000>;
+			};
+
 			snvs0: snvs@400a7000 {
 			    compatible = "fsl,sec-v4.0-mon", "simple-bus";
 				#address-cells = <1>;
-- 
2.4.1
