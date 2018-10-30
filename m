From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] arm64: dts: qcom: msm8998: Reserve gpio ranges on MTP
Date: Mon, 29 Oct 2018 22:45:54 -0700
Message-ID: <20181030054554.1954-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

GPIOs 0 through 3 and 81 through 84 are configured to not be accessible
from the application CPUs. Mark them as reserved to allow the MSM8998
MTP to boot after the introduction of 3edfb7bd76bd ("gpiolib: Show
correct direction from the beginning").

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
index b4276da1fb0d..11fd1fe8bdb5 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
@@ -241,3 +241,7 @@
 		};
 	};
 };
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+};
-- 
2.18.0
