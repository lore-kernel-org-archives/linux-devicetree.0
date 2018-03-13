From: Craig Tatlor <ctatlor97@gmail.com>
Subject: [PATCH v2] ARM: dts: msm8974: castor: Fix typo and add startup delay in touchscreen node
Date: Tue, 13 Mar 2018 16:46:38 +0000
Message-ID: <20180313164638.7211-1-ctatlor97@gmail.com>
References: <20180312160734.5606-1-ctatlor97@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180312160734.5606-1-ctatlor97@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
Cc: ctatlor97@gmail.com, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The compatible string was mistakenly pulled from the downstream tree and the
startup delay property is needed to prevent io errors on initial page select.

Signed-off-by: Craig Tatlor <ctatlor97@gmail.com>
---
 arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
index e87f2c99060d..701b396719c7 100644
--- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
+++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-castor.dts
@@ -491,7 +491,7 @@
 		pinctrl-0 = <&i2c8_pins>;
 
 		synaptics@2c {
-			compatible = "syna,rmi-i2c";
+			compatible = "syna,rmi4-i2c";
 			reg = <0x2c>;
 
 			interrupt-parent = <&msmgpio>;
@@ -506,6 +506,8 @@
 			pinctrl-names = "default";
 			pinctrl-0 = <&ts_int_pin>;
 
+			syna,startup-delay-ms = <10>;
+
 			rmi-f01@1 {
 				reg = <0x1>;
 				syna,nosleep = <1>;
-- 
2.16.1
