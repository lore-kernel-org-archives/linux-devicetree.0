From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 1/3] ARM: dts: apq8064: remove temporary fixed regulator for mmc
Date: Tue, 28 Jul 2015 09:12:51 +0100
Message-ID: <1438071171-30108-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438071116-30065-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438071116-30065-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch removes temporary fixed regluator use for mmc.
Board files should use the regulators which are wiredup appropriately.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index bc5de9b..cba4ccb 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -523,14 +523,6 @@
 		};
 
 		/* Temporary fixed regulator */
-		vsdcc_fixed: vsdcc-regulator {
-			compatible = "regulator-fixed";
-			regulator-name = "SDCC Power";
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-			regulator-always-on;
-		};
-
 		sdcc1bam:dma@12402000{
 			compatible = "qcom,bam-v1.3.0";
 			reg = <0x12402000 0x8000>;
@@ -580,7 +572,6 @@
 				non-removable;
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
-				vmmc-supply = <&vsdcc_fixed>;
 				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
 				dma-names = "tx", "rx";
 			};
@@ -599,7 +590,6 @@
 				cap-mmc-highspeed;
 				max-frequency	= <192000000>;
 				no-1-8-v;
-				vmmc-supply = <&vsdcc_fixed>;
 				dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
 				dma-names = "tx", "rx";
 			};
@@ -617,8 +607,6 @@
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
 				max-frequency	= <48000000>;
-				vmmc-supply = <&vsdcc_fixed>;
-				vqmmc-supply = <&vsdcc_fixed>;
 				dmas = <&sdcc4bam 2>, <&sdcc4bam 1>;
 				dma-names = "tx", "rx";
 				pinctrl-names = "default";
-- 
1.9.1
