From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 2/2] arm64: dts: agilex/stratix10: Add reset properties for DMA
Date: Thu, 20 Jun 2019 10:37:32 -0500
Message-ID: <20190620153732.26738-2-dinguyen@kernel.org>
References: <20190620153732.26738-1-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190620153732.26738-1-dinguyen@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Add both the reset and reset-ocp properties for the DMA node on the
Stratix10 and Agilex platforms.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi | 2 ++
 arch/arm64/boot/dts/intel/socfpga_agilex.dtsi     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
index a781e699a538..5db9ff05fc33 100644
--- a/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_stratix10.dtsi
@@ -335,6 +335,8 @@
 			#dma-requests = <32>;
 			clocks = <&clkmgr STRATIX10_L4_MAIN_CLK>;
 			clock-names = "apb_pclk";
+			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
+			reset-names = "dma", "dma-ocp";
 		};
 
 		rst: rstmgr@ffd11000 {
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
index e4ceb3a73c81..36abc25320a8 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex.dtsi
@@ -249,6 +249,8 @@
 			#dma-cells = <1>;
 			#dma-channels = <8>;
 			#dma-requests = <32>;
+			resets = <&rst DMA_RESET>, <&rst DMA_OCP_RESET>;
+			reset-names = "dma", "dma-ocp";
 		};
 
 		rst: rstmgr@ffd11000 {
-- 
2.20.0
