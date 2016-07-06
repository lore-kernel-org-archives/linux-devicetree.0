From: Peter Griffin <peter.griffin@linaro.org>
Subject: [PATCH v6 06/18] ARM: STi: DT: STiH407: Add FDMA driver dt nodes.
Date: Wed,  6 Jul 2016 09:54:24 +0100
Message-ID: <1467795276-21725-7-git-send-email-peter.griffin@linaro.org>
References: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1467795276-21725-1-git-send-email-peter.griffin@linaro.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, vinod.koul@intel.com, patrice.chotard@st.com, bjorn.andersson@linaro.org, ohad@wizery.com
Cc: peter.griffin@linaro.org, dmaengine@vger.kernel.org, lee.jones@linaro.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

These nodes are required to get the fdma driver working
on STiH407 based silicon.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm/boot/dts/stih407-family.dtsi | 52 +++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/arm/boot/dts/stih407-family.dtsi b/arch/arm/boot/dts/stih407-family.dtsi
index d294e82..45cab30 100644
--- a/arch/arm/boot/dts/stih407-family.dtsi
+++ b/arch/arm/boot/dts/stih407-family.dtsi
@@ -821,5 +821,57 @@
 			clock-frequency	= <600000000>;
 			st,syscfg	= <&syscfg_core 0x224>;
 		};
+
+		/* fdma audio */
+		fdma0: dma-controller@8e20000 {
+			compatible = "st,stih407-fdma-mpe31-11", "st,slim-rproc";
+			reg = <0x8e20000 0x8000>,
+			      <0x8e30000 0x3000>,
+			      <0x8e37000 0x1000>,
+			      <0x8e38000 0x8000>;
+			reg-names = "slimcore", "dmem", "peripherals", "imem";
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				 <&clk_s_c0_flexgen CLK_EXT2F_A9>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+		};
+
+		/* fdma app */
+		fdma1: dma-controller@8e40000 {
+			compatible = "st,stih407-fdma-mpe31-12", "st,slim-rproc";
+			reg = <0x8e40000 0x8000>,
+			      <0x8e50000 0x3000>,
+			      <0x8e57000 0x1000>,
+			      <0x8e58000 0x8000>;
+			reg-names = "slimcore", "dmem", "peripherals", "imem";
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
+				<&clk_s_c0_flexgen CLK_TX_ICN_DMU>,
+				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
+
+			interrupts = <GIC_SPI 7 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+		};
+
+		/* fdma free running */
+		fdma2: dma-controller@8e60000 {
+			compatible = "st,stih407-fdma-mpe31-13", "st,slim-rproc";
+			reg = <0x8e60000 0x8000>,
+			      <0x8e70000 0x3000>,
+			      <0x8e77000 0x1000>,
+			      <0x8e78000 0x8000>;
+			reg-names = "slimcore", "dmem", "peripherals", "imem";
+			interrupts = <GIC_SPI 9 IRQ_TYPE_NONE>;
+			dma-channels = <16>;
+			#dma-cells = <3>;
+			clocks = <&clk_s_c0_flexgen CLK_FDMA>,
+				<&clk_s_c0_flexgen CLK_EXT2F_A9>,
+				<&clk_s_c0_flexgen CLK_TX_ICN_DISP_0>,
+				<&clk_s_c0_flexgen CLK_EXT2F_A9>;
+		};
 	};
 };
-- 
1.9.1
