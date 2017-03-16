From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: [PATCH v2 2/2] ARM: dts: qcom: Add msm8974 CoreSight components
Date: Thu, 16 Mar 2017 14:58:45 +0200
Message-ID: <20170316125845.14208-1-georgi.djakov@linaro.org>
References: <20170316125509.13717-1-georgi.djakov@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170316125509.13717-1-georgi.djakov@linaro.org>
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org, linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org, iivanov.xz@gmail.com, georgi.djakov@linaro.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: "Ivan T. Ivanov" <ivan.ivanov@linaro.org>

Add initial set of CoreSight components found on Qualcomm
msm8974 and apq8074 based platforms, including the APQ8074
Dragonboard board.

Signed-off-by: Ivan T. Ivanov <ivan.ivanov@linaro.org>
Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

Changes since v1 (https://lkml.org/lkml/2017/2/3/491)
 * Use consistent order for output/input ports.
 * Added Mathieu's Reviewed-by

 arch/arm/boot/dts/qcom-msm8974.dtsi | 282 +++++++++++++++++++++++++++++++++++-
 1 file changed, 278 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 4b4c61e2ee35..d08005b82b61 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -68,7 +68,7 @@
 		#size-cells = <0>;
 		interrupts = <1 9 0xf04>;
 
-		cpu@0 {
+		CPU0: cpu@0 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
@@ -79,7 +79,7 @@
 			cpu-idle-states = <&CPU_SPC>;
 		};
 
-		cpu@1 {
+		CPU1: cpu@1 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
@@ -90,7 +90,7 @@
 			cpu-idle-states = <&CPU_SPC>;
 		};
 
-		cpu@2 {
+		CPU2: cpu@2 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
@@ -101,7 +101,7 @@
 			cpu-idle-states = <&CPU_SPC>;
 		};
 
-		cpu@3 {
+		CPU3: cpu@3 {
 			compatible = "qcom,krait";
 			enable-method = "qcom,kpss-acc-v2";
 			device_type = "cpu";
@@ -733,6 +733,280 @@
 
 			status = "disabled";
 		};
+
+		etr@fc322000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0xfc322000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			port {
+				etr_in: endpoint {
+					slave-mode;
+					remote-endpoint = <&replicator_out0>;
+				};
+			};
+		};
+
+		tpiu@fc318000 {
+			compatible = "arm,coresight-tpiu", "arm,primecell";
+			reg = <0xfc318000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			port {
+				tpiu_in: endpoint {
+					 slave-mode;
+					 remote-endpoint = <&replicator_out1>;
+				 };
+			};
+		};
+
+		replicator@fc31c000 {
+			compatible = "qcom,coresight-replicator1x", "arm,primecell";
+			reg = <0xfc31c000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					replicator_out0: endpoint {
+						remote-endpoint = <&etr_in>;
+					};
+				};
+				port@1 {
+					reg = <1>;
+					replicator_out1: endpoint {
+						remote-endpoint = <&tpiu_in>;
+					};
+				};
+				port@2 {
+					reg = <0>;
+					replicator_in: endpoint {
+						slave-mode;
+						remote-endpoint = <&etf_out>;
+					};
+				};
+			};
+		};
+
+		etf@fc307000 {
+			compatible = "arm,coresight-tmc", "arm,primecell";
+			reg = <0xfc307000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					etf_out: endpoint {
+						remote-endpoint = <&replicator_in>;
+					};
+				};
+				port@1 {
+					reg = <0>;
+					etf_in: endpoint {
+						slave-mode;
+						remote-endpoint = <&merger_out>;
+					};
+				};
+			};
+		};
+
+		funnel@fc31b000 {
+			compatible = "arm,coresight-funnel", "arm,primecell";
+			reg = <0xfc31b000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					merger_out: endpoint {
+						remote-endpoint = <&etf_in>;
+					};
+				};
+
+				/*
+				 * Not described input ports:
+				 * 0 - connected trought funnel to Audio, Modem and
+				 *     Resource and Power Manager CPU's
+				 * 2...7 - not-connected
+				 */
+				port@1 {
+					reg = <1>;
+					merger_in1: endpoint {
+						slave-mode;
+						remote-endpoint = <&funnel1_out>;
+					};
+				};
+			};
+		};
+
+		funnel@fc31a000 {
+			compatible = "arm,coresight-funnel", "arm,primecell";
+			reg = <0xfc31a000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					funnel1_out: endpoint {
+						remote-endpoint = <&merger_in1>;
+					};
+				};
+
+				/*
+				 * Not described input ports:
+				 * 0 - not-connected
+				 * 1 - connected trought funnel to Multimedia CPU
+				 * 2 - connected to Wireless CPU
+				 * 3 - not-connected
+				 * 4 - not-connected
+				 * 6 - not-connected
+				 * 7 - connected to STM
+				 */
+				port@5 {
+					reg = <5>;
+					funnel1_in5: endpoint {
+						slave-mode;
+						remote-endpoint = <&kpss_out>;
+					};
+				};
+			};
+		};
+
+		funnel@fc345000 { /* KPSS funnel only 4 inputs are used */
+			compatible = "arm,coresight-funnel", "arm,primecell";
+			reg = <0xfc345000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					kpss_out: endpoint {
+						remote-endpoint = <&funnel1_in5>;
+					};
+				};
+				port@1 {
+					reg = <0>;
+					kpss_in0: endpoint {
+						slave-mode;
+						remote-endpoint = <&etm0_out>;
+					};
+				};
+				port@2 {
+					reg = <1>;
+					kpss_in1: endpoint {
+						slave-mode;
+						remote-endpoint = <&etm1_out>;
+					};
+				};
+				port@3 {
+					reg = <2>;
+					kpss_in2: endpoint {
+						slave-mode;
+						remote-endpoint = <&etm2_out>;
+					};
+				};
+				port@4 {
+					reg = <3>;
+					kpss_in3: endpoint {
+						slave-mode;
+						remote-endpoint = <&etm3_out>;
+					};
+				};
+			};
+		};
+
+		etm@fc33c000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0xfc33c000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			cpu = <&CPU0>;
+
+			port {
+				etm0_out: endpoint {
+					remote-endpoint = <&kpss_in0>;
+				};
+			};
+		};
+
+		etm@fc33d000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0xfc33d000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			cpu = <&CPU1>;
+
+			port {
+				etm1_out: endpoint {
+					remote-endpoint = <&kpss_in1>;
+				};
+			};
+		};
+
+		etm@fc33e000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0xfc33e000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			cpu = <&CPU2>;
+
+			port {
+				etm2_out: endpoint {
+					remote-endpoint = <&kpss_in2>;
+				};
+			};
+		};
+
+		etm@fc33f000 {
+			compatible = "arm,coresight-etm4x", "arm,primecell";
+			reg = <0xfc33f000 0x1000>;
+
+			clocks = <&rpmcc RPM_SMD_QDSS_CLK>, <&rpmcc RPM_SMD_QDSS_A_CLK>;
+			clock-names = "apb_pclk", "atclk";
+
+			cpu = <&CPU3>;
+
+			port {
+				etm3_out: endpoint {
+					remote-endpoint = <&kpss_in3>;
+				};
+			};
+		};
 	};
 
 	smd {
