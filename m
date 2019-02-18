From: Amit Kucheria <amit.kucheria@linaro.org>
Subject: [PATCH v1 06/12] arm64: dts: msm8998: thermal: Fix the gpu sensor number
Date: Mon, 18 Feb 2019 18:05:20 +0530
Message-ID: <6c8750d78d375ed288d95fa9af8d330f9ed62958.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
In-Reply-To: <cover.1550493113.git.amit.kucheria@linaro.org>
References: <cover.1550493113.git.amit.kucheria@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, bjorn.andersson@linaro.org, edubezval@gmail.com, andy.gross@linaro.org, David Brown <david.brown@linaro.org>
Cc: devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The GPU sensor is sensor ID 13 on controller 0

Fixes: 4449b6f248d9a1 ("arm64: dts: qcom: msm8998: Add tsens and thermal-zones")
Signed-off-by: Amit Kucheria <amit.kucheria@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 662ca458e64a..ba579cf10254 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -504,7 +504,7 @@
 			polling-delay-passive = <250>;
 			polling-delay = <1000>;
 
-			thermal-sensors = <&tsens1 3>;
+			thermal-sensors = <&tsens0 13>;
 		};
 	};
 
-- 
2.17.1
