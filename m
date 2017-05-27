From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: Specify dload address for msm8916 and msm8996
Date: Fri, 26 May 2017 23:33:08 -0700
Message-ID: <20170527063308.10483-3-bjorn.andersson@linaro.org>
References: <20170527063308.10483-1-bjorn.andersson@linaro.org>
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <20170527063308.10483-1-bjorn.andersson@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, David Brown <david.brown@linaro.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

On msm8916 and msm8996 boards a secure io-write is used to write the
magic for selecting "download mode", specify this address in the
DeviceTree.

Note that qcom_scm.download_mode=1 must be specified on the kernel
command line for the kernel to attempt selecting download mode.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Add msm8916 to the patch

 arch/arm64/boot/dts/qcom/msm8916.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index ab3093995ded..33013835639d 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -241,6 +241,8 @@
 			clocks = <&gcc GCC_CRYPTO_CLK>, <&gcc GCC_CRYPTO_AXI_CLK>, <&gcc GCC_CRYPTO_AHB_CLK>;
 			clock-names = "core", "bus", "iface";
 			#reset-cells = <1>;
+
+			qcom,dload-mode-addr = <0x0 0x193d100>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 9bc9c857a000..7e64884ab7c7 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -261,6 +261,8 @@
 	firmware {
 		scm {
 			compatible = "qcom,scm-msm8996";
+
+			qcom,dload-mode-addr = <0x0 0x7b3000>;
 		};
 	};
 
-- 
2.12.0
