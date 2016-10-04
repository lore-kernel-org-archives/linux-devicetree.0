From: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Subject: [PATCH 1/5] ARM: DT: STiH407-family: sti sound card field cleaning
Date: Tue, 4 Oct 2016 18:11:53 +0200
Message-ID: <1475597517-14225-2-git-send-email-arnaud.pouliquen@st.com>
References: <1475597517-14225-1-git-send-email-arnaud.pouliquen@st.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1475597517-14225-1-git-send-email-arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Patrice Chotard <patrice.chotard-qxv4g6HH51o@public.gmane.org>, Moise Gergaud <moise.gergaud-qxv4g6HH51o@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Cleaning of some uni-players and uni-reader fields.
Associated configurations are now handled in driver based
on compatible string.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen-qxv4g6HH51o@public.gmane.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 91096a4..d29960b 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -900,7 +900,7 @@
 		};
 
 		sti_uni_player0: sti-uni-player@8d80000 {
-			compatible = "st,sti-uni-player";
+			compatible = "st,stih407-uni-player-hdmi";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			clocks = <&clk_s_d0_flexgen CLK_PCM_0>;
@@ -910,17 +910,13 @@
 			reg = <0x8d80000 0x158>;
 			interrupts = <GIC_SPI 84 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 2 0 1>;
-			dai-name = "Uni Player #0 (HDMI)";
 			dma-names = "tx";
-			st,uniperiph-id = <0>;
-			st,version = <5>;
-			st,mode = "HDMI";
 
 			status		= "disabled";
 		};
 
 		sti_uni_player1: sti-uni-player@8d81000 {
-			compatible = "st,sti-uni-player";
+			compatible = "st,stih407-uni-player-pcm-out";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			clocks = <&clk_s_d0_flexgen CLK_PCM_1>;
@@ -930,17 +926,13 @@
 			reg = <0x8d81000 0x158>;
 			interrupts = <GIC_SPI 85 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 3 0 1>;
-			dai-name = "Uni Player #1 (PIO)";
 			dma-names = "tx";
-			st,uniperiph-id = <1>;
-			st,version = <5>;
-			st,mode = "PCM";
 
 			status = "disabled";
 		};
 
 		sti_uni_player2: sti-uni-player@8d82000 {
-			compatible = "st,sti-uni-player";
+			compatible = "st,stih407-uni-player-dac";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			clocks = <&clk_s_d0_flexgen CLK_PCM_2>;
@@ -950,17 +942,13 @@
 			reg = <0x8d82000 0x158>;
 			interrupts = <GIC_SPI 86 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 4 0 1>;
-			dai-name = "Uni Player #1 (DAC)";
 			dma-names = "tx";
-			st,uniperiph-id = <2>;
-			st,version = <5>;
-			st,mode = "PCM";
 
 			status = "disabled";
 		};
 
 		sti_uni_player3: sti-uni-player@8d85000 {
-			compatible = "st,sti-uni-player";
+			compatible = "st,stih407-uni-player-spdif";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			clocks = <&clk_s_d0_flexgen CLK_SPDIFF>;
@@ -971,38 +959,30 @@
 			interrupts = <GIC_SPI 89 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 7 0 1>;
 			dma-names = "tx";
-			dai-name = "Uni Player #1 (PIO)";
-			st,uniperiph-id = <3>;
-			st,version = <5>;
-			st,mode = "SPDIF";
 
 			status = "disabled";
 		};
 
 		sti_uni_reader0: sti-uni-reader@8d83000 {
-			compatible = "st,sti-uni-reader";
+			compatible = "st,stih407-uni-reader-pcm_in";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			reg = <0x8d83000 0x158>;
 			interrupts = <GIC_SPI 87 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 5 0 1>;
 			dma-names = "rx";
-			dai-name = "Uni Reader #0 (PCM IN)";
-			st,version = <3>;
 
 			status = "disabled";
 		};
 
 		sti_uni_reader1: sti-uni-reader@8d84000 {
-			compatible = "st,sti-uni-reader";
+			compatible = "st,stih407-uni-reader-hdmi";
 			#sound-dai-cells = <0>;
 			st,syscfg = <&syscfg_core>;
 			reg = <0x8d84000 0x158>;
 			interrupts = <GIC_SPI 88 IRQ_TYPE_NONE>;
 			dmas = <&fdma0 6 0 1>;
 			dma-names = "rx";
-			dai-name = "Uni Reader #1 (HDMI RX)";
-			st,version = <3>;
 
 			status = "disabled";
 		};
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
