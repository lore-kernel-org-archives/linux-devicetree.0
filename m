From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/2 v3] device-tree: nexus7: Remove power gpio key entry and use pmic8xxx-pwrkey
Date: Tue, 26 Apr 2016 10:44:13 -0700
Message-ID: <1461692654-27448-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Since the pmic8xxx-pwrkey driver is already supported in the
qcom-apq8064.dtsi, and the pmic8xxx-pwrkey supports logic to
configure proper device shutdown when ps_hold goes low, it is
better to use that driver then a generic gpio button.

Thus this patch remove the gpio power key entry here, so we
don't get double input events from having two drivers enabled.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Acked-by: Rob Herring <robh@kernel.org>
Acked-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
v2:
- Added wakeup-source entry as suggested by
   Sudeep Holla <sudeep.holla@arm.com>
v3:
- Dropped the entire debounce override, as
  that was found to be a bug in the driver
  that Stephen has since fixed

 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index c535b3f..751aded 100644
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
-- 
1.9.1
