From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] device-tree: nexus7: Set phy mode to otg instead of host
Date: Fri,  1 Jul 2016 22:33:25 -0700
Message-ID: <1467437605-11691-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

In order to have the usb phy work in gadget mode, override
the default host mode with otg mode.

This allows gadget mode to work w/o any hacks to the dtsi file.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 7b05f07..94e9cbb 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -253,6 +253,7 @@
 			vddcx-supply	= <&pm8921_s3>;
 			v3p3-supply	= <&pm8921_l3>;
 			v1p8-supply	= <&pm8921_l4>;
+			dr_mode		= "otg";
 		};
 
 		gadget@12500000 {
-- 
1.9.1
