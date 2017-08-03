From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 1/5] arm64: zynqmp: Add fpd/lpd dmas
Date: Thu,  3 Aug 2017 13:36:47 +0200
Message-ID: <7ce85ef98662e158c7bf62c249e2dd1ab4bd5ba5.1501760202.git.michal.simek@xilinx.com>
References: <cover.1501760202.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1501760202.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1501760202.git.michal.simek@xilinx.com>
References: <cover.1501760202.git.michal.simek@xilinx.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Alexander Graf <agraf@suse.de>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Wire fpd and lpd dma channels to zynqmp.dtsi.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 165 +++++++++++++++++++++++++++++++++
 1 file changed, 165 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 787463796348..7665fbddff28 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -189,6 +189,171 @@
 			};
 		};
 
+		/* GDMA */
+		fpd_dma_chan1: dma@fd500000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd500000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 124 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan2: dma@fd510000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd510000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 125 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan3: dma@fd520000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd520000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 126 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan4: dma@fd530000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd530000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 127 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan5: dma@fd540000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd540000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 128 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan6: dma@fd550000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd550000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 129 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan7: dma@fd560000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd560000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 130 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		fpd_dma_chan8: dma@fd570000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xfd570000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 131 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <128>;
+		};
+
+		/* LPDDMA default allows only secured access. inorder to enable
+		 * These dma channels, Users should ensure that these dma
+		 * Channels are allowed for non secure access.
+		 */
+		lpd_dma_chan1: dma@ffa80000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffa80000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 77 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan2: dma@ffa90000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffa90000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 78 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan3: dma@ffaa0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffaa0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 79 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan4: dma@ffab0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffab0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 80 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan5: dma@ffac0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffac0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 81 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan6: dma@ffad0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffad0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 82 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan7: dma@ffae0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffae0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 83 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
+		lpd_dma_chan8: dma@ffaf0000 {
+			status = "disabled";
+			compatible = "xlnx,zynqmp-dma-1.0";
+			reg = <0x0 0xffaf0000 0x0 0x1000>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 84 4>;
+			clock-names = "clk_main", "clk_apb";
+			xlnx,bus-width = <64>;
+		};
+
 		gem0: ethernet@ff0b0000 {
 			compatible = "cdns,gem";
 			status = "disabled";
-- 
1.9.1
