From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 12/13] ARM: dts: db600c: add spi support
Date: Tue, 12 Apr 2016 10:34:01 +0100
Message-ID: <1460453642-5809-13-git-send-email-srinivas.kandagatla@linaro.org>
References: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1460453642-5809-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, srinivas.kandagatla@linaro.org
List-Id: devicetree@vger.kernel.org

This patch adds spi nodes required to provide spi bus support on LS
expansion.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
index 2f0dfff..34bb415 100644
--- a/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-arrow-db600c.dts
@@ -13,6 +13,7 @@
 		i2c1 = &gsbi3_i2c;
 		i2c2 = &gsbi4_i2c;
 		i2c3 = &gsbi7_i2c;
+		spi0 = &gsbi5_spi;
 	};
 
 	regulators {
@@ -181,6 +182,15 @@
 			};
 		};
 
+		gsbi@1a200000 {
+			status = "okay";
+			spi@1a280000 {
+				/* On Low speed expansion */
+				label = "LS-SPI0";
+				status = "okay";
+			};
+		};
+
 		/* DEBUG UART  */
 		gsbi@16600000 {
 			status = "okay";
-- 
2.5.0
