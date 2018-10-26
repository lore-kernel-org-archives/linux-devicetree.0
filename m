From: Sibi Sankar <sibis@codeaurora.org>
Subject: [PATCH] arm64: dts: qcom: sdm845: Add reserve-memory nodes
Date: Fri, 26 Oct 2018 17:57:45 +0530
Message-ID: <20181026122745.5094-1-sibis@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: andy.gross@linaro.org, david.brown@linaro.org, robh+dt@kernel.org
Cc: bjorn.andersson@linaro.org, dianders@chromium.org, evgreen@chromium.org, benchan@chromium.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tsoni@codeaurora.org, Sibi Sankar <sibis@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add reserve-memory nodes for mpss and mba required for
remoteproc mss pil.

Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index d3fe012ad84e..f74892e447f9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -88,6 +88,16 @@
 			reg = <0 0x86200000 0 0x2d00000>;
 			no-map;
 		};
+
+		mpss_region: reserved-memory@8e000000 {
+			no-map;
+			reg = <0 0x8e000000 0 0x7800000>;
+		};
+
+		mba_region: reserved-memory@96500000 {
+			no-map;
+			reg = <0 0x96500000 0 0x200000>;
+		};
 	};
 
 	cpus {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
