From: Thara Gopinath <thara.gopinath@linaro.org>
Subject: [PATCH 2/2] arm64: dts: qcom: Extend AOSS QMP node
Date: Mon, 29 Jul 2019 12:33:21 -0400
Message-ID: <1564418001-24940-3-git-send-email-thara.gopinath@linaro.org>
References: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1564418001-24940-1-git-send-email-thara.gopinath@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-msm@vger.kernel.org, agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

AOSS hosts resources that can be used to warm up the SoC.
Add nodes for these resources.

Signed-off-by: Thara Gopinath <thara.gopinath@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 4babff5..d0c0d4f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2411,6 +2411,14 @@
 
 			#clock-cells = <0>;
 			#power-domain-cells = <1>;
+
+			cx_cdev: cx {
+				#cooling-cells = <2>;
+			};
+
+			ebi_cdev: ebi {
+				#cooling-cells = <2>;
+			};
 		};
 
 		spmi_bus: spmi@c440000 {
-- 
2.1.4
