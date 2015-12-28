From: Bjorn Andersson <bjorn@kryo.se>
Subject: [PATCH] ARM: dts: qcom: msm8974: Add additional reserved regions
Date: Sun, 27 Dec 2015 17:17:40 -0800
Message-ID: <1451265460-15106-1-git-send-email-bjorn.andersson@sonymobile.com>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

This adds the additional reserved regions found on 8974 based devices.

Signed-off-by: Bjorn Andersson <bjorn.andersson@sonymobile.com>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 40 +++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 578fa77ae331..3f6b8f2022c4 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -14,10 +14,50 @@
 		#size-cells = <1>;
 		ranges;
 
+		mpss@08000000 {
+			reg = <0x08000000 0x5100000>;
+			no-map;
+		};
+
+		mba@00d100000 {
+			reg = <0x0d100000 0x100000>;
+			no-map;
+		};
+
+		reserved@0d200000 {
+			reg = <0x0d200000 0xa00000>;
+			no-map;
+		};
+
+		adsp@0dc00000 {
+			reg = <0x0dc00000 0x1900000>;
+			no-map;
+		};
+
+		venus@0f500000 {
+			reg = <0x0f500000 0x500000>;
+			no-map;
+		};
+
 		smem_region: smem@fa00000 {
 			reg = <0xfa00000 0x200000>;
 			no-map;
 		};
+
+		tz@0fc00000 {
+			reg = <0x0fc00000 0x160000>;
+			no-map;
+		};
+
+		efs@0fd600000 {
+			reg = <0x0fd60000 0x1a0000>;
+			no-map;
+		};
+
+		unused@0ff00000 {
+			reg = <0x0ff00000 0x10100000>;
+			no-map;
+		};
 	};
 
 	firmware {
-- 
2.5.0
