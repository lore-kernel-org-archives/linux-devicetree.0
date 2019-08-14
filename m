From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 2/2] arm64: dts: sdm845: Add interconnect properties for Venus
Date: Wed, 14 Aug 2019 11:47:01 +0300
Message-ID: <20190814084701.25455-3-stanimir.varbanov@linaro.org>
References: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190814084701.25455-1-stanimir.varbanov@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc: Vikash Garodia <vgarodia@codeaurora.org>, Andy Gross <agross@kernel.org>, Aniket Masule <amasule@codeaurora.org>, Stanimir Varbanov <stanimir.varbanov@linaro.org>
List-Id: devicetree@vger.kernel.org

Populate Venus DT node with interconnect properties.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0323e3da190a..567bfc89bd77 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2039,6 +2039,9 @@
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
 			memory-region = <&venus_mem>;
+			interconnects = <&rsc_hlos MASTER_VIDEO_P0 &rsc_hlos SLAVE_EBI1>,
+					<&rsc_hlos MASTER_APPSS_PROC &rsc_hlos SLAVE_VENUS_CFG>;
+			interconnect-names = "video-mem", "cpu-cfg";
 
 			video-core0 {
 				compatible = "venus-decoder";
-- 
2.17.1
