From: John Stultz <john.stultz@linaro.org>
Subject: [PATCH 2/2] device-tree: nexus7: Add IMEM syscon and reboot reason support
Date: Mon,  8 Aug 2016 15:34:03 -0700
Message-ID: <1470695643-32169-2-git-send-email-john.stultz@linaro.org>
References: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1470695643-32169-1-git-send-email-john.stultz@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: lkml <linux-kernel@vger.kernel.org>
Cc: John Stultz <john.stultz@linaro.org>, Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@codeaurora.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Stephen Boyd <stephen.boyd@linaro.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This patch add the IMEM syscon memory region to the DT,
as well as addds support for the magic reboot reason
values that are written to the address for each mode.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: Andy Gross <agross@codeaurora.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Stephen Boyd <stephen.boyd@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
index 7b05f07..ff856c3 100644
--- a/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
+++ b/arch/arm/boot/dts/qcom-apq8064-asus-nexus7-flo.dts
@@ -272,5 +272,19 @@
 				vqmmc-supply = <&pm8921_s4>;
 			};
 		};
+
+		imem@2a03f000 {
+			compatible = "syscon", "simple-mfd";
+			reg = <0x2a03f000 0x1000>;
+
+			reboot-mode {
+				compatible = "syscon-reboot-mode";
+				offset = <0x65c>;
+
+				mode-normal	= <0x77665501>;
+				mode-bootloader	= <0x77665500>;
+				mode-recovery	= <0x77665502>;
+			};
+		};
 	};
 };
-- 
1.9.1
