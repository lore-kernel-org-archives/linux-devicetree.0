From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: msm8996: Correct slpi region reg definition
Date: Wed, 26 Oct 2016 10:54:50 -0700
Message-ID: <1477504490-7818-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sarangdhar Joshi <spjoshi@codeaurora.org>
List-Id: devicetree@vger.kernel.org

I missed the missing cell in the reg property of the slpi region in my review,
so let's add it.

Fixes: 2b7f0de19648 ("arm64: dts: msm8996: Add reserve-memory nodes")
Cc: Sarangdhar Joshi <spjoshi@codeaurora.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index b97647d29842..215de91e802d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -42,7 +42,7 @@
 		};
 
 		slpi_region: slpi@90b00000 {
-			reg = <0x0 0x90b00000 0xa00000>;
+			reg = <0x0 0x90b00000 0x0 0xa00000>;
 			no-map;
 		};
 
-- 
2.5.0
