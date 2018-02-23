Return-Path: <SRS0=V9ZR=FR=samsung.com=jh80.chung@kernel.org>
From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: [PATCH 3/6] ARM: dts: socfpga: remove 'num-slots' property for
 dwmmc
Date: Fri, 23 Feb 2018 15:41:35 +0900
Message-id: <20180223064138.18401-3-jh80.chung@samsung.com>
In-reply-to: <20180223064138.18401-1-jh80.chung@samsung.com>
References: <20180223064138.18401-1-jh80.chung@samsung.com>
	<CGME20180223064140epcas2p2145faef6a2c44d7d20bb3d6099f12d18@epcas2p2.samsung.com>
To: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: ulf.hansson@linaro.org, robh+dt@kernel.org, mark.rutland@arm.com, manabian@gmail.com, dinguyen@kernel.org, will.deacon@arm.com, xuwei5@hisilicon.com, Jaehoon Chung <jh80.chung@samsung.com>
List-ID: <devicetree@vger.kernel.org>

Since 'num-slots' had already deprecated, remove the property in
device-tree file.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts | 1 -
 arch/arm/boot/dts/socfpga_arria5.dtsi             | 1 -
 arch/arm/boot/dts/socfpga_cyclone5.dtsi           | 1 -
 arch/arm/boot/dts/socfpga_vt.dts                  | 1 -
 4 files changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
index 040a164ba148..5822fd2085db 100644
--- a/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
+++ b/arch/arm/boot/dts/socfpga_arria10_socdk_sdmmc.dts
@@ -20,7 +20,6 @@
 
 &mmc {
 	status = "okay";
-	num-slots = <1>;
 	cap-sd-highspeed;
 	broken-cd;
 	bus-width = <4>;
diff --git a/arch/arm/boot/dts/socfpga_arria5.dtsi b/arch/arm/boot/dts/socfpga_arria5.dtsi
index 8c037297296c..e59461f5416e 100644
--- a/arch/arm/boot/dts/socfpga_arria5.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria5.dtsi
@@ -30,7 +30,6 @@
 		};
 
 		mmc0: dwmmc0@ff704000 {
-			num-slots = <1>;
 			broken-cd;
 			bus-width = <4>;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/socfpga_cyclone5.dtsi b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
index a05e3df23103..68ced67f8bfb 100644
--- a/arch/arm/boot/dts/socfpga_cyclone5.dtsi
+++ b/arch/arm/boot/dts/socfpga_cyclone5.dtsi
@@ -31,7 +31,6 @@
 		};
 
 		mmc0: dwmmc0@ff704000 {
-			num-slots = <1>;
 			broken-cd;
 			bus-width = <4>;
 			cap-mmc-highspeed;
diff --git a/arch/arm/boot/dts/socfpga_vt.dts b/arch/arm/boot/dts/socfpga_vt.dts
index dfe2193cd4d5..547c38632c68 100644
--- a/arch/arm/boot/dts/socfpga_vt.dts
+++ b/arch/arm/boot/dts/socfpga_vt.dts
@@ -42,7 +42,6 @@
 		};
 
 		dwmmc0@ff704000 {
-			num-slots = <1>;
 			broken-cd;
 			bus-width = <4>;
 			cap-mmc-highspeed;
-- 
2.15.1
