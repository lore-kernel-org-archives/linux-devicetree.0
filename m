From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v2 03/10] arm64: dts: qcom: msm8916-pins: keep cdc_dmic pins
 in suspend mode
Date: Thu,  7 Dec 2017 10:19:35 -0500
Message-ID: <20171207151942.5805-4-damien.riegel@savoirfairelinux.com>
References: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20171207151942.5805-1-damien.riegel@savoirfairelinux.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Damien Riegel <damien.riegel@savoirfairelinux.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Bjorn Andersson <bjorn.andersson@linaro.org>, David Brown <david.brown@linaro.org>, Rob Herring <robh+dt@kernel.org>, kernel@savoirfairelinux.com, Andy Gross <andy.gross@linaro.org>
List-Id: devicetree@vger.kernel.org

This node was the only one that didn't have the same set of pins in
active and suspend mode.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
---
 arch/arm64/boot/dts/qcom/msm8916-pins.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
index c67ad8ed8b60..10fc1fc90682 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-pins.dtsi
@@ -687,6 +687,14 @@
 			};
 		};
 		cdc_dmic_lines_sus: dmic_lines_off {
+			pinmux_dmic0_clk {
+				function = "dmic0_clk";
+				pins = "gpio0";
+			};
+			pinmux_dmic0_data {
+				function = "dmic0_data";
+				pins = "gpio1";
+			};
 			pinconf {
 				pins = "gpio0", "gpio1";
 				drive-strength = <2>;
-- 
2.15.0
