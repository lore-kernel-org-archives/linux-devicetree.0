From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v2 7/9] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Fri, 11 Sep 2015 15:14:29 +0100
Message-ID: <1441980871-24475-8-git-send-email-peter.griffin@linaro.org>
References: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1441980871-24475-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, srinivas.kandagatla@gmail.com, maxime.coquelin@st.com, patrice.chotard@st.com, vinod.koul@intel.com
Cc: peter.griffin@linaro.org, dmaengine@vger.kernel.org, robh+dt@kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These nodes are required to get the fdma driver working
on STiH407 based silicon.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 51 +++++++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index 838b812..da07474b 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -565,5 +565,56 @@
 						  <&phy_port2 PHY_TYPE_USB3>;
 			};
 		};
+
+		fdma0: fdma0-audio@8e20000 {
+			compatible = "st,stih407-fdma-mpe31";
+			reg = <0x8e20000 0x20000>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+			st,fdma-id = <0>;
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
+			clock-names = "fdma_slim",
+				      "fdma_hi",
+				      "fdma_low",
+				      "fdma_ic";
+		};
+
+		fdma1: fdma1-app@8e40000 {
+			compatible = "st,stih407-fdma-mpe31";
+			reg = <0x8e40000 0x20000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+			st,fdma-id = <1>;
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				 <&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
+				 <&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
+			clock-names = "fdma_slim",
+				      "fdma_hi",
+				      "fdma_low",
+				      "fdma_ic";
+		};
+
+		fdma2: fdma2-free_running@8e60000 {
+			compatible = "st,stih407-fdma-mpe31";
+			reg = <0x8e60000 0x20000>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+			st,fdma-id = <2>;
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
+			clock-names = "fdma_slim",
+				      "fdma_hi",
+				      "fdma_low",
+				      "fdma_ic";
+		};
 	};
 };
-- 
1.9.1
