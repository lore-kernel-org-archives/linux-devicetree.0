From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] dts: arm64/sdm845: Add clocks to WCN3990 WLAN module device node
Date: Fri, 18 Jan 2019 16:00:15 -0800
Message-ID: <20190119000016.139657-1-dianders@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Govind Singh <govinds@codeaurora.org>, Brian Norris <briannorris@chromium.org>, Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, David Brown <david.brown@linaro.org>, Mark Rutland <mark.rutland@arm.com>
List-Id: devicetree@vger.kernel.org

When commit be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module
device node") was posted upstream no clocks were specified.  However,
when the pack was picked into the Chrome OS kernel tree (allegedly
directly from the mailing list post) it had clock properties.

I presume that the clock should be there, so let's add it.

Fixes: be7019103469 ("dts: arm64/sdm845: Add WCN3990 WLAN module device node")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index e4156ea320aa..f99424fc4df2 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -2211,6 +2211,8 @@
 			reg = <0 0x18800000 0 0x800000>;
 			reg-names = "membase";
 			memory-region = <&wlan_msa_mem>;
+			clock-names = "cxo_ref_clk_pin";
+			clocks = <&rpmhcc RPMH_RF_CLK2>;
 			interrupts =
 				<GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
 				<GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.20.1.321.g9e740568ce-goog
