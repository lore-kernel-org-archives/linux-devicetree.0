From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 3/6] arm64: qcom: msm8996.dtsi: Add Display nodes
Date: Wed, 30 Jan 2019 11:04:34 +0000
Message-ID: <20190130110437.5424-4-srinivas.kandagatla@linaro.org>
References: <20190130110437.5424-1-srinivas.kandagatla@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190130110437.5424-1-srinivas.kandagatla@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: andy.gross@linaro.org
Cc: devicetree@vger.kernel.org, Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Archit Taneja <architt@codeaurora.org>

Signed-off-by: Archit Taneja <architt@codeaurora.org>
[Removed instances of mmagic clocks;
Use qcom,msm8996-smmu-v2 bindings]
Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 120 ++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 96adda520bd5..0d0b9482aa4d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -1337,6 +1337,126 @@
 						"bus_slave";
 			};
 		};
+
+		mdss: mdss@900000 {
+			compatible = "qcom,mdss";
+
+			reg = <0x900000 0x1000>,
+			      <0x9b0000 0x1040>,
+			      <0x9b8000 0x1040>;
+			reg-names = "mdss_phys",
+				    "vbif_phys",
+				    "vbif_nrt_phys";
+
+			power-domains = <&mmcc MDSS_GDSC>;
+			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>;
+			clock-names = "iface_clk";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			mdp: mdp@901000 {
+				compatible = "qcom,mdp5";
+				reg = <0x901000 0x90000>;
+				reg-names = "mdp_phys";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_AXI_CLK>,
+					 <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc SMMU_MDP_AXI_CLK>,
+					 <&mmcc MDSS_VSYNC_CLK>;
+				clock-names = "iface_clk",
+					      "bus_clk",
+					      "core_clk",
+					      "iommu_clk",
+					      "vsync_clk";
+
+				iommus = <&mdp_smmu 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdp5_intf3_out: endpoint {
+							remote-endpoint = <&hdmi_in>;
+						};
+					};
+				};
+			};
+
+			hdmi: hdmi-tx@9a0000 {
+				compatible = "qcom,hdmi-tx-8996";
+				reg =	<0x009a0000 0x50c>,
+					<0x00070000 0x6158>,
+					<0x009e0000 0xfff>;
+				reg-names = "core_physical",
+					    "qfprom_physical",
+					    "hdcp_physical";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <8 IRQ_TYPE_LEVEL_HIGH>;
+
+				clocks = <&mmcc MDSS_MDP_CLK>,
+					 <&mmcc MDSS_AHB_CLK>,
+					 <&mmcc MDSS_HDMI_CLK>,
+					 <&mmcc MDSS_HDMI_AHB_CLK>,
+					 <&mmcc MDSS_EXTPCLK_CLK>;
+				clock-names =
+					"mdp_core_clk",
+					"iface_clk",
+					"core_clk",
+					"alt_iface_clk",
+					"extp_clk";
+
+				phys = <&hdmi_phy>;
+				phy-names = "hdmi_phy";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_in: endpoint {
+							remote-endpoint = <&mdp5_intf3_out>;
+						};
+					};
+				};
+			};
+
+			hdmi_phy: hdmi-phy@9a0600 {
+				#phy-cells = <0>;
+				compatible = "qcom,hdmi-phy-8996";
+				reg = <0x9a0600 0x1c4>,
+				      <0x9a0a00 0x124>,
+				      <0x9a0c00 0x124>,
+				      <0x9a0e00 0x124>,
+				      <0x9a1000 0x124>,
+				      <0x9a1200 0x0c8>;
+				reg-names = "hdmi_pll",
+					    "hdmi_tx_l0",
+					    "hdmi_tx_l1",
+					    "hdmi_tx_l2",
+					    "hdmi_tx_l3",
+					    "hdmi_phy";
+
+				clocks = <&mmcc MDSS_AHB_CLK>,
+					 <&gcc GCC_HDMI_CLKREF_CLK>;
+				clock-names = "iface_clk",
+					      "ref_clk";
+			};
+		};
 	};
 
 	adsp-pil {
-- 
2.20.1
