From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 2/4] ARM: dts: msm8974: Split efs in rfsa and rmtfs
Date: Mon, 28 Mar 2016 18:32:37 -0700
Message-ID: <1459215159-2576-2-git-send-email-bjorn.andersson@linaro.org>
References: <1459215159-2576-1-git-send-email-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459215159-2576-1-git-send-email-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

One part of the efs memory region is used specifically for sharing file system
buffers between the apps and modem cpus (aka rmtfs), so better reflect this
split.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 927075137b76..1afee408a923 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -49,8 +49,13 @@
 			no-map;
 		};
 
-		efs@0fd600000 {
-			reg = <0x0fd60000 0x1a0000>;
+		rfsa@0fd60000 {
+			reg = <0x0fd60000 0x20000>;
+			no-map;
+		};
+
+		rmtfs@0fd80000 {
+			reg = <0x0fd80000 0x180000>;
 			no-map;
 		};
 
-- 
2.5.0
