From: Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v5 7/7] ARM: STiH407: Move over to using the 'reserved-memory' API for obtaining DMA memory
Date: Tue, 12 Jan 2016 12:46:21 +0000
Message-ID: <1452602781-22424-8-git-send-email-lee.jones@linaro.org>
References: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452602781-22424-1-git-send-email-lee.jones@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: kernel@stlinux.com, maxime.coquelin@st.com, ohad@wizery.com, devicetree@vger.kernel.org, Nathan_Lynch@mentor.com, f.fainelli@gmail.com, ludovic.barre@st.com, s-anna@ti.com, Lee Jones <lee.jones@linaro.org>
List-Id: devicetree@vger.kernel.org

Doing so saves quite a bit of code in the driver.

For more information on the 'reserved-memory' bindings see:

  Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt

Suggested-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 46 +++++++++++++++++++++++++++++------
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 15c20b6..27b8efc 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -15,6 +15,36 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		gp0_reserved: rproc@40000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x40000000 0x01000000>;
+			no-map;
+		};
+
+		gp1_reserved: rproc@41000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x41000000 0x01000000>;
+			no-map;
+		};
+
+		audio_reserved: rproc@42000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x42000000 0x01000000>;
+			no-map;
+		};
+
+		dmu_reserved: rproc@43000000 {
+			compatible = "shared-dma-pool";
+			reg = <0x43000000 0x01000000>;
+			no-map;
+		};
+	};
+
 	cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
@@ -651,9 +681,9 @@
 			status		= "okay";
 		};
 
-		st231_gp0: st231-gp0@40000000 {
+		st231_gp0: st231-gp0 {
 			compatible	= "st,st231-rproc";
-			reg		= <0x40000000 0x01000000>;
+			memory-region	= <&gp0_reserved>;
 			resets		= <&softreset STIH407_ST231_GP0_SOFTRESET>;
 			reset-names	= "sw_reset";
 			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_0>;
@@ -661,9 +691,9 @@
 			st,syscfg	= <&syscfg_core 0x22c>;
 		};
 
-		st231_gp1: st231-gp1@41000000 {
+		st231_gp1: st231-gp1 {
 			compatible	= "st,st231-rproc";
-			reg		= <0x41000000 0x01000000>;
+			memory-region	= <&gp1_reserved>;
 			resets		= <&softreset STIH407_ST231_GP1_SOFTRESET>;
 			reset-names	= "sw_reset";
 			clocks		= <&clk_s_c0_flexgen CLK_ST231_GP_1>;
@@ -671,9 +701,9 @@
 			st,syscfg	= <&syscfg_core 0x220>;
 		};
 
-		st231_audio: st231-audio@42000000 {
+		st231_audio: st231-audio {
 			compatible	= "st,st231-rproc";
-			reg		= <0x42000000 0x01000000>;
+			memory-region	= <&audio_reserved>;
 			resets		= <&softreset STIH407_ST231_AUD_SOFTRESET>;
 			reset-names	= "sw_reset";
 			clocks		= <&clk_s_c0_flexgen CLK_ST231_AUD_0>;
@@ -681,9 +711,9 @@
 			st,syscfg	= <&syscfg_core 0x228>;
 		};
 
-		st231_dmu: st231-dmu@43000000 {
+		st231_dmu: st231-dmu {
 			compatible	= "st,st231-rproc";
-			reg		= <0x43000000 0x01000000>;
+			memory-region	= <&dmu_reserved>;
 			resets		= <&softreset STIH407_ST231_DMU_SOFTRESET>;
 			reset-names	= "sw_reset";
 			clocks		= <&clk_s_c0_flexgen CLK_ST231_DMU>;
-- 
1.9.1
