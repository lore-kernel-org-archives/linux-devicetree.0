From: Vinod Koul <vkoul@kernel.org>
Subject: [PATCH 2/5] arm64: dts: qcom: sdm845: remove unnecessary properties for dsi nodes
Date: Mon, 22 Jul 2019 18:04:19 +0530
Message-ID: <20190722123422.4571-3-vkoul@kernel.org>
References: <20190722123422.4571-1-vkoul@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190722123422.4571-1-vkoul@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

We get a warning about unnecessary properties of

arch/arm64/boot/dts/qcom/sdm845.dtsi:2211.22-2257.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
arch/arm64/boot/dts/qcom/sdm845.dtsi:2278.22-2324.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

So, remove these properties

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e81f4a6d08ce..2985df032179 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2234,9 +2234,6 @@
 
 				status = "disabled";
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
@@ -2301,9 +2298,6 @@
 
 				status = "disabled";
 
-				#address-cells = <1>;
-				#size-cells = <0>;
-
 				ports {
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.20.1
