From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 8/8] ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the DSI PHY
Date: Fri, 30 Nov 2018 16:52:54 -0800
Message-ID: <20181201005254.139908-9-mka@chromium.org>
References: <20181201005254.139908-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181201005254.139908-1-mka@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Clark <robdclark@gmail.com>, David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>
Cc: Archit Taneja <architt@codeaurora.org>, Sean Paul <seanpaul@chromium.org>, Rajesh Yadav <ryadav@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Jeykumar Sankaran <jsanka@codeaurora.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Add 'xo_board' as ref clock for the DSI PHY, it was previously
hardcoded in the PLL 'driver' for the 28nm 8960 PHY.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v3:
- patch added to the series
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 48c3cf4276101..d337ae9326cd8 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1338,8 +1338,9 @@
 				<0x04700300 0x200>,
 				<0x04700500 0x5c>;
 			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
-			clock-names = "iface_clk";
-			clocks = <&mmcc DSI_M_AHB_CLK>;
+			clock-names = "iface_clk", "ref";
+			clocks = <&mmcc DSI_M_AHB_CLK>,
+				 <&xo_board>;
 		};
 
 
-- 
2.20.0.rc1.387.gf8505762e3-goog
