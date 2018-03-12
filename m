From: Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH] ARM: dts: msm8974: castor: Correct typo in touchscreen compatible string
Date: Mon, 12 Mar 2018 16:07:34 +0000
Message-ID: <20180312160734.5606-1-ctatlor97@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This was mistakenly pulled from the downstream tree.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index e87f2c99060d..d85311a0422c 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -491,7 +491,7 @@
 		pinctrl-0 = <&i2c8_pins>;
 
 		synaptics@2c {
-			compatible = "syna,rmi-i2c";
+			compatible = "syna,rmi4-i2c";
 			reg = <0x2c>;
 
 			interrupt-parent = <&msmgpio>;
-- 
2.16.1
