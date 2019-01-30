From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [PATCH v2 4/6] arm64: dts: Add Adreno GPU definitions
Date: Wed, 30 Jan 2019 11:04:35 +0000
Message-ID: <20190130110437.5424-5-srinivas.kandagatla@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, Jordan Crouse <jcrouse@codeaurora.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Vivek Gautam <vivek.gautam@codeaurora.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Jordan Crouse <jcrouse@codeaurora.org>

Add an initial node for the Adreno GPU.

Signed-off-by: Vivek Gautam <vivek.gautam@codeaurora.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 86 +++++++++++++++++++++++++++
 1 file changed, 86 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 0d0b9482aa4d..095041589954 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -84,6 +84,12 @@
 			qcom,client-id = <1>;
 			qcom,vmid = <15>;
 		};
+
+		zap_shader_region: gpu@8f200000 {
+			compatible = "shared-dma-pool";
+			reg = <0x0 0x90b00000 0x0 0xa00000>;
+			no-map;
+		};
 	};
 
 	cpus {
@@ -796,6 +802,11 @@
 				reg = <0x24f 0x1>;
 				bits = <1 4>;
 			};
+
+			gpu_speed_bin: gpu_speed_bin@133 {
+				reg = <0x133 0x1>;
+				bits = <5 3>;
+			};
 		};
 
 		phy@34000 {
@@ -1338,6 +1349,81 @@
 			};
 		};
 
+		gpu@b00000 {
+			compatible = "qcom,adreno-530.2", "qcom,adreno";
+			#stream-id-cells = <16>;
+
+			reg = <0xb00000 0x3f000>;
+			reg-names = "kgsl_3d0_reg_memory";
+
+			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&mmcc GPU_GX_GFX3D_CLK>,
+				<&mmcc GPU_AHB_CLK>,
+				<&mmcc GPU_GX_RBBMTIMER_CLK>,
+				<&gcc GCC_BIMC_GFX_CLK>,
+				<&gcc GCC_MMSS_BIMC_GFX_CLK>;
+
+			clock-names = "core",
+				"iface",
+				"rbbmtimer",
+				"mem",
+				"mem_iface";
+
+			power-domains = <&mmcc GPU_GDSC>;
+			iommus = <&adreno_smmu 0>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			qcom,gpu-quirk-two-pass-use-wfi;
+			qcom,gpu-quirk-fault-detect-mask;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			gpu_opp_table: opp-table {
+				compatible  ="operating-points-v2";
+
+				/*
+				 * 624Mhz and 560Mhz are only available on speed
+				 * bin (1 << 0). All the rest are available on
+				 * all bins of the hardware
+				 */
+				opp-624000000 {
+					opp-hz = /bits/ 64 <624000000>;
+					opp-supported-hw = <0x01>;
+				};
+				opp-560000000 {
+					opp-hz = /bits/ 64 <560000000>;
+					opp-supported-hw = <0x01>;
+				};
+				opp-510000000 {
+					opp-hz = /bits/ 64 <510000000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-401800000 {
+					opp-hz = /bits/ 64 <401800000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-315000000 {
+					opp-hz = /bits/ 64 <315000000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-214000000 {
+					opp-hz = /bits/ 64 <214000000>;
+					opp-supported-hw = <0xFF>;
+				};
+				opp-133000000 {
+					opp-hz = /bits/ 64 <133000000>;
+					opp-supported-hw = <0xFF>;
+				};
+			};
+
+			zap-shader {
+				memory-region = <&zap_shader_region>;
+			};
+		};
+
 		mdss: mdss@900000 {
 			compatible = "qcom,mdss";
 
-- 
2.20.1
