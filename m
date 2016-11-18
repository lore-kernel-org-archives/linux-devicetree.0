From: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: [PATCH] arm64: dts: qcom: msm8996: Fixup smp2p node
Date: Fri, 18 Nov 2016 12:06:49 -0800
Message-ID: <1479499609-13336-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Gross <andy.gross-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: linux-arm-msm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

The SMEM state property name changes between the integration branch and
mainline, update to use the correct one.

Fixes: 2f45d9fcd531 ("arm64: dts: msm8996: Add SMP2P and APCS nodes")
Signed-off-by: Bjorn Andersson <bjorn.andersson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
---

Seems we're still carrying this discrepancy somewhere and I missed it in my
review, sorry about that.

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index cde4114bae5a..712d5d043105 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -530,7 +530,7 @@
 
 		adsp_smp2p_out: master-kernel {
 			qcom,entry-name = "master-kernel";
-			#qcom,state-cells = <1>;
+			#qcom,smem-state-cells = <1>;
 		};
 
 		adsp_smp2p_in: slave-kernel {
-- 
2.5.0

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
