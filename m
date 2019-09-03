From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 4.19 099/167] ARM: dts: qcom: ipq4019: Fix MSI IRQ type
Date: Tue,  3 Sep 2019 12:24:11 -0400
Message-ID: <20190903162519.7136-99-sashal@kernel.org>
References: <20190903162519.7136-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190903162519.7136-1-sashal@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Niklas Cassel <niklas.cassel@linaro.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <andy.gross@linaro.org>, Sasha Levin <sashal@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

From: Niklas Cassel <niklas.cassel@linaro.org>

[ Upstream commit 97131f85c08e024df49480ed499aae8fb754067f ]

The databook clearly states that the MSI IRQ (msi_ctrl_int) is a level
triggered interrupt.

The msi_ctrl_int will be high for as long as any MSI status bit is set,
thus the IRQ type should be set to IRQ_TYPE_LEVEL_HIGH, causing the
IRQ handler to keep getting called, as long as any MSI status bit is set.

A git grep shows that ipq4019 is the only SoC using snps,dw-pcie that has
configured this IRQ incorrectly.

Not having the correct IRQ type defined will cause us to lose interrupts,
which in turn causes timeouts in the PCIe endpoint drivers.

Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Andy Gross <andy.gross@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/qcom-ipq4019.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-ipq4019.dtsi b/arch/arm/boot/dts/qcom-ipq4019.dtsi
index 2c3168d95a2d5..814ab7283228a 100644
--- a/arch/arm/boot/dts/qcom-ipq4019.dtsi
+++ b/arch/arm/boot/dts/qcom-ipq4019.dtsi
@@ -389,7 +389,7 @@
 			ranges = <0x81000000 0 0x40200000 0x40200000 0 0x00100000
 				  0x82000000 0 0x40300000 0x40300000 0 0x400000>;
 
-			interrupts = <GIC_SPI 141 IRQ_TYPE_EDGE_RISING>;
+			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "msi";
 			#interrupt-cells = <1>;
 			interrupt-map-mask = <0 0 0 0x7>;
-- 
2.20.1
