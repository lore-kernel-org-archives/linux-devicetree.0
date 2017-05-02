From: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: [PATCH] qcom: ipq4019: fix i2c_0 node
Date: Tue,  2 May 2017 21:19:24 +0200
Message-ID: <20170502191924.32585-1-chunkeey@googlemail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, chrisrblake93-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, David Brown <david.brown-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

This patch fixes two typos in the i2c_0 node for the ipq4019.
The reg property length is just 0x600. The core clock is
GCC_BLSP1_QUP1_I2C_APPS_CLK. GCC_BLSP1_QUP2_I2C_APPS_CLK is
used by the second i2c.

Fixes: e76b4284b520ba3 ("qcom: ipq4019: add i2c node to ipq4019 SoC and DK01 device tree")
Signed-off-by: Christian Lamparter <chunkeey-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index b7a24af8f47b..4b7d97275c62 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -154,10 +154,10 @@
 
 		i2c_0: i2c@78b7000 {
 			compatible = "qcom,i2c-qup-v2.2.1";
-			reg = <0x78b7000 0x6000>;
+			reg = <0x78b7000 0x600>;
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_AHB_CLK>,
-				 <&gcc GCC_BLSP1_QUP2_I2C_APPS_CLK>;
+				 <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>;
 			clock-names = "iface", "core";
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
