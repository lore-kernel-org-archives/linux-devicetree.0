From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH] ARM: dts: qcom-apq8064: Fix DSI PHY ref clk phandle
Date: Tue, 23 Apr 2019 17:12:10 -0700
Message-ID: <20190424001210.201672-1-mka@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <agross@kernel.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Linux Next Mailing List <linux-next@vger.kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Matthias Kaehlcke <mka@chromium.org>
List-Id: devicetree@vger.kernel.org

Commit 3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as
ref clock of the DSI PHY") specifies the non-existing phandle
'xo_board' as DSI PHY ref clk. Fix this by using the correct
phandle is 'cxo_board'.

Fixes: 3560af5a56b5 ("ARM: dts: qcom-apq8064: Set 'xo_board' as ref clock of the DSI PHY")

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 arch/arm/boot/dts/qcom-apq8064.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom-apq8064.dtsi
index 2fff5074f2d7..65975df6a8c3 100644
--- a/arch/arm/boot/dts/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom-apq8064.dtsi
@@ -1305,7 +1305,7 @@
 			reg-names = "dsi_pll", "dsi_phy", "dsi_phy_regulator";
 			clock-names = "iface_clk", "ref";
 			clocks = <&mmcc DSI_M_AHB_CLK>,
-				 <&xo_board>;
+				 <&cxo_board>;
 		};
 
 
-- 
2.21.0.593.g511ec345e18-goog
