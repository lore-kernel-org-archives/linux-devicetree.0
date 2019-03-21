From: Evan Green <evgreen@chromium.org>
Subject: [PATCH v5 5/8] arm64: dts: msm8996: Add UFS PHY reset controller
Date: Thu, 21 Mar 2019 10:17:57 -0700
Message-ID: <20190321171800.104681-6-evgreen@chromium.org>
References: <20190321171800.104681-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190321171800.104681-1-evgreen@chromium.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Stephen Boyd <swboyd@chromium.org>, Marc Gonzalez <marc.w.gonzalez@free.fr>, Can Guo <cang@codeaurora.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, Douglas Anderson <dianders@chromium.org>, Asutosh Das <asutoshd@codeaurora.org>, Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Gross <andy.gross@linaro.org>, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

Add the reset controller for the UFS controller, and wire it up
so that the UFS PHY can initialize itself without relying on
implicit sequencing between the two drivers.

Signed-off-by: Evan Green <evgreen@chromium.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 arch/arm64/boot/dts/qcom/msm8996.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index c761269caf80..5683b727283e 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -697,10 +697,11 @@
 			clock-names = "ref_clk_src", "ref_clk";
 			clocks = <&rpmcc RPM_SMD_LN_BB_CLK>,
 				 <&gcc GCC_UFS_CLKREF_CLK>;
+			resets = <&ufshc 0>;
 			status = "disabled";
 		};
 
-		ufshc@624000 {
+		ufshc: ufshc@624000 {
 			compatible = "qcom,ufshc";
 			reg = <0x624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
@@ -756,6 +757,7 @@
 				<0 0>;
 
 			lanes-per-direction = <1>;
+			#reset-cells = <1>;
 			status = "disabled";
 
 			ufs_variant {
-- 
2.20.1
