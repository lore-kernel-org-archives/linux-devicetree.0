From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] device-tree: nexus7: Add bq27541 battery interface to dts
Date: Tue, 26 Apr 2016 10:44:14 -0700
Message-ID: <1461692654-27448-2-git-send-email-john.stultz@linaro.org>
References: <1461692654-27448-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1461692654-27448-1-git-send-email-john.stultz@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add support for battery level reading on the Nexus7 by
enabling the bq27541 driver in the nexus7 dts

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
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 751aded..7b05f07 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -218,6 +218,12 @@
 					reg = <0x52>;
 					pagesize = <32>;
 				};
+
+				bq27541@55 {
+					compatible = "ti,bq27541";
+					reg = <0x55>;
+				};
+
 			};
 		};
 
-- 
1.9.1
