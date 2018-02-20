From: Graham Moore <graham.moore@linux.intel.com>
Subject: [PATCH] arm64: dts: stratix10: Add PL330 DMAC to Stratix10 dts
Date: Tue, 20 Feb 2018 09:38:47 -0600
Message-ID: <1519141127-22038-1-git-send-email-graham.moore@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Graham Moore <graham.moore@linux.intel.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The Stratix10 SoCFPGA uses the PL330 DMAC.  This patch adds the PL330
DMAC to the Stratix10 device tree.

Signed-off-by: Graham Moore <graham.moore@linux.intel.com>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index aa4080d..0666c0f 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -711,6 +711,25 @@
 			reg = <0xffe00000 0x100000>;
 		};
 
+		pdma: pdma@ffda0000 {
+			compatible = "arm,pl330", "arm,primecell";
+			reg = <0xffda0000 0x1000>;
+			interrupts = <0 81 4>,
+				     <0 82 4>,
+				     <0 83 4>,
+				     <0 84 4>,
+				     <0 85 4>,
+				     <0 86 4>,
+				     <0 87 4>,
+				     <0 88 4>,
+				     <0 89 4>;
+			#dma-cells = <1>;
+			#dma-channels = <8>;
+			#dma-requests = <32>;
+			clocks = <&l4_main_clk>;
+			clock-names = "apb_pclk";
+		};
+
 		rst: rstmgr@ffd11000 {
 			#reset-cells = <1>;
 			compatible = "altr,rst-mgr";
-- 
2.7.4
