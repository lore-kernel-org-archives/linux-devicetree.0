From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 1/2] devicetree: qcom-apq8064.dtsi: Add i2c3 address-cells and size-cells values
Date: Fri, 11 Dec 2015 17:22:06 -0800
Message-ID: <1449883327-7423-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Vinay Simha BN <simhavcs@gmail.com>, devicetree@vger.kernel.org, Bjorn Andersson <bjorn.andersson@sonymobile.com>
List-Id: devicetree@vger.kernel.org

This adds address-cell and size-cell values to the i2c3 bus
in the qcom-apq8064.dtsi, which is needed to describe devices
on that bus.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Pawel Moll <pawel.moll@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Ian Campbell <ijc+devicetree@hellion.org.uk>
Cc: Kumar Gala <galak@codeaurora.org>
Cc: Russell King <linux@arm.linux.org.uk>
Cc: Vinay Simha BN <simhavcs@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Acked-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 4e7f5cc..b61b754 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -337,6 +337,8 @@
 				clocks = <&gcc GSBI3_QUP_CLK>,
 					 <&gcc GSBI3_H_CLK>;
 				clock-names = "core", "iface";
+				#address-cells = <1>;
+				#size-cells = <0>;
 			};
 		};
 
-- 
1.9.1
