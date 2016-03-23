From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH 09/12] ARM: dts: dragonboard-600c: add on board sata support.
Date: Wed, 23 Mar 2016 19:47:57 +0000
Message-ID: <1458762477-9722-1-git-send-email-srinivas.kandagatla@linaro.org>
References: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1458762366-9233-1-git-send-email-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-soc@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
List-Id: devicetree@vger.kernel.org

This patch enables sata and regulators required to get on board sata
working.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
index d3e6193..52f742c 100644
--- a/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-dragonboard-600c.dts
@@ -135,6 +135,10 @@
 				lvs6 {
 					bias-pull-down;
 				};
+
+				lvs7 {
+					bias-pull-down;
+				};
 			};
 		};
 
@@ -171,6 +175,15 @@
 			perst-gpio = <&tlmm_pinmux 27 GPIO_ACTIVE_LOW>;
 		};
 
+		phy@1b400000 {
+			status = "okay";
+		};
+
+		sata@29000000 {
+			status	= "okay";
+			target-supply	= <&pm8921_lvs7>;
+		};
+
 		/* OTG */
 		phy@12500000 {
 			status		= "okay";
-- 
2.5.0
