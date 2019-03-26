From: Evan Green <evgreen@chromium.org>
Subject: [PATCH] arm64: dts: msm8998: Add UFS phy reset
Date: Tue, 26 Mar 2019 10:05:18 -0700
Message-ID: <20190326170518.157317-1-evgreen@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Marc Gonzalez <marc.w.gonzalez@free.fr>, Andy Gross <andy.gross@linaro.org>
Cc: Evan Green <evgreen@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

With the new refactoring at [1], the UFS phy now controls its own
destiny in toggling the phy reset bit within the UFS host controller.
Add the DT pieces needed to 1) expose the reset controller from the
HC, and 2) use it from the PHY. This series is based atop linux-next
plus Marc's series at [2].

Signed-off-by: Evan Green <evgreen@chromium.org>

[1] https://lore.kernel.org/lkml/20190321171800.104681-1-evgreen@chromium.org/
[2] https://lore.kernel.org/lkml/43768d77-80b7-9cdc-b6e0-08ec4a026c21@free.fr/

---
I haven't tested this. Marc, I'm hoping you'll test this out and hijack this
patch if it needs any fixups.

 arch/arm64/boot/dts/qcom/msm8998.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 3d0aeb3211de..d59a2c5fe83a 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -990,6 +990,7 @@
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 			phys = <&ufsphy_lanes>;
 			phy-names = "ufsphy";
+			#reset-cells = <1>;
 			lanes-per-direction = <2>;
 			power-domains = <&gcc UFS_GDSC>;
 
@@ -1039,6 +1040,7 @@
 				<&gcc GCC_UFS_CLKREF_CLK>,
 				<&gcc GCC_UFS_PHY_AUX_CLK>;
 
+			resets = <&ufshc 0>;
 			ufsphy_lanes: lanes@1da7400 {
 				reg = <0x01da7400 0x128>,
 				      <0x01da7600 0x1fc>,
-- 
2.20.1
