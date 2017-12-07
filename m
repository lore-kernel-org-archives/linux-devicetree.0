From: Damien Riegel <damien.riegel@savoirfairelinux.com>
Subject: [PATCH v2 01/10] arm64: dts: qcom: pm8916: fix wcd_codec indentation
Date: Thu,  7 Dec 2017 10:19:33 -0500
Message-ID: <20171207151942.5805-2-damien.riegel@savoirfairelinux.com>
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

Indentation did not respect kernel standards, so fix that for the usual
indent with tabs, align with spaces. While at it, remove some empty
lines before and after the closing parenthesis of this block.

Signed-off-by: Damien Riegel <damien.riegel@savoirfairelinux.com>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes in v2:
 - Added Reviewed-by Bjorn Andersson

 arch/arm64/boot/dts/qcom/pm8916.dtsi | 82 ++++++++++++++++++------------------
 1 file changed, 40 insertions(+), 42 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/pm8916.dtsi b/arch/arm64/boot/dts/qcom/pm8916.dtsi
index 53deebf9f515..d19f4cb9a5f3 100644
--- a/arch/arm64/boot/dts/qcom/pm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8916.dtsi
@@ -96,47 +96,45 @@
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-                wcd_codec: codec@f000 {
-                       compatible = "qcom,pm8916-wcd-analog-codec";
-	               reg = <0xf000 0x200>;
-	               reg-names = "pmic-codec-core";
-	               clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
-	               clock-names = "mclk";
-	               interrupt-parent = <&spmi_bus>;
-	               interrupts = <0x1 0xf0 0x0 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x1 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x2 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x3 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x4 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x5 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x6 IRQ_TYPE_NONE>,
-	                            <0x1 0xf0 0x7 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x0 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x1 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x2 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x3 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x4 IRQ_TYPE_NONE>,
-	                            <0x1 0xf1 0x5 IRQ_TYPE_NONE>;
-	               interrupt-names = "cdc_spk_cnp_int",
-	                                 "cdc_spk_clip_int",
-	                                 "cdc_spk_ocp_int",
-	                                 "mbhc_ins_rem_det1",
-	                                 "mbhc_but_rel_det",
-	                                 "mbhc_but_press_det",
-	                                 "mbhc_ins_rem_det",
-	                                 "mbhc_switch_int",
-	                                 "cdc_ear_ocp_int",
-	                                 "cdc_hphr_ocp_int",
-	                                 "cdc_hphl_ocp_det",
-	                                 "cdc_ear_cnp_int",
-	                                 "cdc_hphr_cnp_int",
-	                                 "cdc_hphl_cnp_int";
-	               vdd-cdc-io-supply = <&pm8916_l5>;
-	               vdd-cdc-tx-rx-cx-supply = <&pm8916_l5>;
-	               vdd-micbias-supply = <&pm8916_l13>;
-	               #sound-dai-cells = <1>;
-
-                };
-
+		wcd_codec: codec@f000 {
+			compatible = "qcom,pm8916-wcd-analog-codec";
+			reg = <0xf000 0x200>;
+			reg-names = "pmic-codec-core";
+			clocks = <&gcc GCC_CODEC_DIGCODEC_CLK>;
+			clock-names = "mclk";
+			interrupt-parent = <&spmi_bus>;
+			interrupts = <0x1 0xf0 0x0 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x1 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x2 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x3 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x4 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x5 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x6 IRQ_TYPE_NONE>,
+				     <0x1 0xf0 0x7 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x0 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x1 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x2 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x3 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x4 IRQ_TYPE_NONE>,
+				     <0x1 0xf1 0x5 IRQ_TYPE_NONE>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			vdd-cdc-io-supply = <&pm8916_l5>;
+			vdd-cdc-tx-rx-cx-supply = <&pm8916_l5>;
+			vdd-micbias-supply = <&pm8916_l13>;
+			#sound-dai-cells = <1>;
+		};
 	};
 };
-- 
2.15.0
