Return-Path: <SRS0=oGub=MD=vger.kernel.org=devicetree-owner@kernel.org>
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53616 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbeIUQDB (ORCPT
        <rfc822;devicetree@vger.kernel.org>); Fri, 21 Sep 2018 12:03:01 -0400
From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] arm64: tegra: I2C on Tegra194 is not compatible with Tegra114
Date: Fri, 21 Sep 2018 12:14:46 +0200
Message-Id: <20180921101446.12302-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: devicetree-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-ID: <devicetree@vger.kernel.org>

From: Thierry Reding <treding@nvidia.com>

Tegra194 contains a version of the I2C controller that is no longer
compatible with the version found in Tegra114.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra194.dtsi b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
index a827e94523ec..96421b089df5 100644
--- a/arch/arm64/boot/dts/nvidia/tegra194.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra194.dtsi
@@ -468,7 +468,7 @@
 		};
 
 		gen1_i2c: i2c@3160000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x03160000 0x10000>;
 			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -493,7 +493,7 @@
 		};
 
 		cam_i2c: i2c@3180000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x03180000 0x10000>;
 			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -507,7 +507,7 @@
 
 		/* shares pads with dpaux1 */
 		dp_aux_ch1_i2c: i2c@3190000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x03190000 0x10000>;
 			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -521,7 +521,7 @@
 
 		/* shares pads with dpaux0 */
 		dp_aux_ch0_i2c: i2c@31b0000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x031b0000 0x10000>;
 			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -534,7 +534,7 @@
 		};
 
 		gen7_i2c: i2c@31c0000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x031c0000 0x10000>;
 			interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -547,7 +547,7 @@
 		};
 
 		gen9_i2c: i2c@31e0000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x031e0000 0x10000>;
 			interrupts = <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -614,7 +614,7 @@
 		};
 
 		gen2_i2c: i2c@c240000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x0c240000 0x10000>;
 			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
@@ -627,7 +627,7 @@
 		};
 
 		gen8_i2c: i2c@c250000 {
-			compatible = "nvidia,tegra194-i2c", "nvidia,tegra114-i2c";
+			compatible = "nvidia,tegra194-i2c";
 			reg = <0x0c250000 0x10000>;
 			interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 			#address-cells = <1>;
-- 
2.19.0
