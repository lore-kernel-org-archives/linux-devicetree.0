From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.3 091/203] arm64: dts: qcom: qcs404-evb: Mark WCSS clocks protected
Date: Sun, 22 Sep 2019 14:41:57 -0400
Message-ID: <20190922184350.30563-91-sashal@kernel.org>
References: <20190922184350.30563-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190922184350.30563-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Niklas Cassel <niklas.cassel@linaro.org>, Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

[ Upstream commit 54d895bea43c94f31304d59f82d755b7f4b59e7c ]

'7d0c76bdf227 ("clk: qcom: Add WCSS gcc clock control for QCS404")'
introduces two new clocks to gcc. These are not used before
clk_disable_unused() and as such the clock framework tries to disable
them.

But on the EVB these registers are only accessible through TrustZone, so
these clocks must be marked as "protected" to prevent the clock code
from touching them.

Numerical values are used as the constants are not yet available in a
common tree.

Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
Reported-by: Mark Brown <broonie@kernel.org>
Reported-by: Niklas Cassel <niklas.cassel@linaro.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
index 11c0a7137823d..db6df76e97a1a 100644
--- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
@@ -61,7 +61,9 @@
 	protected-clocks = <GCC_BIMC_CDSP_CLK>,
 			   <GCC_CDSP_CFG_AHB_CLK>,
 			   <GCC_CDSP_BIMC_CLK_SRC>,
-			   <GCC_CDSP_TBU_CLK>;
+			   <GCC_CDSP_TBU_CLK>,
+			   <141>, /* GCC_WCSS_Q6_AHB_CLK */
+			   <142>; /* GCC_WCSS_Q6_AXIM_CLK */
 };
 
 &pms405_spmi_regulators {
-- 
2.20.1
