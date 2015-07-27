From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v1 1/7] ARM: dts: apq8064: remove temporary fixed regulator
 for mmc
Date: Mon, 27 Jul 2015 14:50:02 +0100
Message-ID: <1438005002-16219-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1438004945-16175-1-git-send-email-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: agross@codeaurora.org, linux-arm-msm@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Kumar Gala <galak@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

This patch removes temporary fixed regluator use for mmc.
Board files should use the regulators which are wiredup appropriately.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index df2061e..1e1706e 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -448,14 +448,6 @@
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
@@ -505,7 +497,6 @@
 				non-removable;
 				cap-sd-highspeed;
 				cap-mmc-highspeed;
-				vmmc-supply = <&vsdcc_fixed>;
 				dmas = <&sdcc1bam 2>, <&sdcc1bam 1>;
 				dma-names = "tx", "rx";
 			};
@@ -524,7 +515,6 @@
 				cap-mmc-highspeed;
 				max-frequency	= <192000000>;
 				no-1-8-v;
-				vmmc-supply = <&vsdcc_fixed>;
 				dmas = <&sdcc3bam 2>, <&sdcc3bam 1>;
 				dma-names = "tx", "rx";
 			};
@@ -542,8 +532,6 @@
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
