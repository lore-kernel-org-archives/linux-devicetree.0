From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 6/7] arm64: dts: sdm845: Set 'bi_tcxo' as ref clock of the DSI PHYs
Date: Mon, 26 Nov 2018 15:11:58 -0800
Message-ID: <20181126231159.122298-7-mka@chromium.org>
References: <20181126231159.122298-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181126231159.122298-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add 'bi_tcxo' as ref clock for the DSI PHYs, it was previously
hardcoded in the PLL 'driver' for the 10nm PHY.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
based on "[v4,1/3] arm64: dts: qcom: sdm845: Add dpu to sdm845 dts file"
  (https://patchwork.kernel.org/patch/10666253/)

Changes in v2:
- patch added to the series
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 5728b4cfae269..cdb5a9bb23e69 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -1372,8 +1372,9 @@
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
-				clock-names = "iface";
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
 			};
 
 			dsi1: dsi@ae96000 {
@@ -1434,8 +1435,9 @@
 				#clock-cells = <1>;
 				#phy-cells = <0>;
 
-				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>;
-				clock-names = "iface";
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmhcc RPMH_CXO_CLK>;
+				clock-names = "iface", "ref";
 			};
 		};
 
-- 
2.20.0.rc0.387.gc7a69e6b6c-goog
