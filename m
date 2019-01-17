From: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v4 2/2] arm64: dts: qcom: sdm845: Extend ranges and describe DMA space
Date: Wed, 16 Jan 2019 20:29:40 -0800
Message-ID: <20190117042940.25487-3-bjorn.andersson@linaro.org>
References: <20190117042940.25487-1-bjorn.andersson@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190117042940.25487-1-bjorn.andersson@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Gross <andy.gross@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Stephen Boyd <swboyd@chromium.org>, Doug Anderson <dianders@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

For devices attached to an IOMMU, translation between IOVA and physical
addresses is no longer 1:1 and dma-ranges should be specified to
describe the available IOVA address space.

On SDM845 the busses are implemented with 36 address bits, so dma-ranges
must be defined to reduce the size of the IOVA address space from the 48
bits supported by the SMMU. Without this DMA allocations may end up with
IOVAs outside the valid range, that gets truncated by the bus between
the device and its translation unit.

Also extend ranges to describe the available address space.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v3:
- Split this out from patch 1.
- Rewrote commit message from scratch

 arch/arm64/boot/dts/qcom/sdm845.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 9867d42dc836..143c5af32e7b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -353,7 +353,8 @@
 	soc: soc {
 		#address-cells = <2>;
 		#size-cells = <2>;
-		ranges = <0 0 0 0 0 0xffffffff>;
+		ranges = <0 0 0 0 0x10 0>;
+		dma-ranges = <0 0 0 0 0x10 0>;
 		compatible = "simple-bus";
 
 		gcc: clock-controller@100000 {
-- 
2.18.0
