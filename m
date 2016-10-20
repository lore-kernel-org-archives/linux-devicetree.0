From: Sarangdhar Joshi <spjoshi@codeaurora.org>
Subject: [PATCH 2/4] arm64: dts: msm8996: Add reserve-memory nodes
Date: Thu, 20 Oct 2016 11:56:03 -0700
Message-ID: <1476989765-7524-2-git-send-email-spjoshi@codeaurora.org>
References: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1476989765-7524-1-git-send-email-spjoshi@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Trilok Soni <tsoni@codeaurora.org>
List-Id: devicetree@vger.kernel.org

Add reserve-memory nodes required for Qualcomm
Peripheral Image Loaders

Signed-off-by: Sarangdhar Joshi <spjoshi@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 36216ae..949b096 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -36,6 +36,31 @@
 		#size-cells = <2>;
 		ranges;
 
+		mba_region: mba@91500000 {
+			reg = <0x0 0x91500000 0x0 0x200000>;
+			no-map;
+		};
+
+		slpi_region: slpi@90b00000 {
+			reg = <0x0 0x90b00000 0xa00000>;
+			no-map;
+		};
+
+		venus_region: venus@90400000 {
+			reg = <0x0 0x90400000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_region: adsp@8ea00000 {
+			reg = <0x0 0x8ea00000 0x0 0x1a00000>;
+			no-map;
+		};
+
+		mpss_region: mpss@88800000 {
+			reg = <0x0 0x88800000 0x0 0x6200000>;
+			no-map;
+		};
+
 		smem_mem: smem-mem@86000000 {
 			reg = <0x0 0x86000000 0x0 0x200000>;
 			no-map;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
