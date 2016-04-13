From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] device-tree: nexus7-flo: Remove power gpio key entry and use pmic8xxx-pwrkey
Date: Wed, 13 Apr 2016 10:16:24 -0700
Message-ID: <1460567784-28017-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd.bergmann@linaro.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, Vinay Simha BN <simhavcs@gmail.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since the pmic8xxx-pwrkey driver is already supported in the
qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
configure proper device shutdown when ps_hold goes low, it is
better to use that driver then a generic gpio button.

Thus this patch remove the gpio power key entry here, so we
don't get double input events from having two drivers enabled.

The one gotcha with the pmic8xxx-pwrkey is it has a fairly
long debounce delay, which we shorten here to make the button
behave as expected.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Arnd Bergmann <arnd.bergmann@linaro.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Andy Gross <agross@codeaurora.org>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index c535b3f..7ac1c65 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -29,12 +29,6 @@
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		power {
-			label = "Power";
-			gpios = <&tlmm_pinmux 26 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_POWER>;
-			gpio-key,wakeup;
-		};
 		volume_up {
 			label = "Volume Up";
 			gpios = <&pm8921_gpio 4 GPIO_ACTIVE_HIGH>;
@@ -190,6 +184,15 @@
 			};
 		};
 
+		/* override default debounce for power-key */
+		qcom,ssbi@500000 {
+			pmic@0 {
+				pwrkey@1c {
+					debounce = <1>;
+				};
+			};
+		};
+
 		gsbi@16200000 {
 			status = "okay";
 			qcom,mode = <GSBI_PROT_I2C>;
-- 
1.9.1
