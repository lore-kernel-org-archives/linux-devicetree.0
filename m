From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH] device-tree: aqp8064.dtsi: Remove usb phy dr_mode = "host"
Date: Tue, 12 Jul 2016 15:39:55 -0700
Message-ID: <1468363195-11730-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Most 8064 devices have micro-usb ports for phy1, so setting
the dr_mode to host here seems incorrect.

Leaving it unspecified should default to otg, and then
any boards that wish to specify something else, can
override it in their dts file.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index df96ccd..cc816d4 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -705,7 +705,6 @@
 			reg		= <0x12500000 0x400>;
 			interrupts	= <GIC_SPI 100 IRQ_TYPE_NONE>;
 			status		= "disabled";
-			dr_mode		= "host";
 
 			clocks		= <&gcc USB_HS1_XCVR_CLK>,
 					  <&gcc USB_HS1_H_CLK>;
-- 
1.9.1
