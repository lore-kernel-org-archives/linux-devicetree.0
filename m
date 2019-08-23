From: Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 6/6] arm64: dts: Add rsc power domain for sdm845
Date: Fri, 23 Aug 2019 13:47:03 +0530
Message-ID: <20190823081703.17325-7-mkshah@codeaurora.org>
References: <20190823081703.17325-1-mkshah@codeaurora.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190823081703.17325-1-mkshah@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swboyd@chromium.org, agross@kernel.org, david.brown@linaro.org, linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, bjorn.andersson@linaro.org, evgreen@chromium.org, dianders@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org, ulf.hansson@linaro.org, Maulik Shah <mkshah@codeaurora.org>, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add rsc power domain to enable sending sleep and wake votes
using generic power domain infrastructure.

Cc: devicetree@vger.kernel.org
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0e7f36d2a7d9..1ea61464e666 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -669,6 +669,7 @@
 
 		CLUSTER_PD: cluster-pd {
 			#power-domain-cells = <0>;
+			power-domains = <&apps_rsc>;
 			domain-idle-states = <&CLUSTER_SLEEP_0>;
 		};
 	};
@@ -2587,6 +2588,7 @@
 					  <SLEEP_TCS   3>,
 					  <WAKE_TCS    3>,
 					  <CONTROL_TCS 1>;
+			#power-domain-cells = <0>;
 
 			rpmhcc: clock-controller {
 				compatible = "qcom,sdm845-rpmh-clk";
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, hosted by The Linux Foundation.
