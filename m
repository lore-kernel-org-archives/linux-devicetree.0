From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 06/10] arm64: zynqmp: Adding prefetchable memory space to pcie
 node
Date: Thu, 20 Jul 2017 14:17:05 +0200
Message-ID: <e349cb0bfd9aa8678485da6a92bb38ac9ae30c6f.1500552941.git.michal.simek@xilinx.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <cover.1500552941.git.michal.simek@xilinx.com>
In-Reply-To: <cover.1500552941.git.michal.simek@xilinx.com>
References: <cover.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Will Deacon <will.deacon@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>

Adding prefetchable memory space to pcie device tree node.
Shifting configuration space to 64-bit address space.
Removing pcie device tree node from amba as it requires size-cells=<2>
in order to access 64-bit address space.

Signed-off-by: Bharat Kumar Gogada <bharatku@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index f3968737e613..e7d1815c114b 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -285,12 +285,8 @@
 			      <0x0 0xfd480000 0x0 0x1000>,
 			      <0x80 0x00000000 0x0 0x1000000>;
 			reg-names = "breg", "pcireg", "cfg";
-			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000
-				  0xe0000000 0x00000000 0x10000000
-				  /* non-prefetchable memory */
-				  0x43000000 0x00000006 0x00000000 0x00000006
-				  0x00000000 0x00000002 0x00000000>;
-				  /* prefetchable memory */
+			ranges = <0x02000000 0x00000000 0xe0000000 0x00000000 0xe0000000 0x00000000 0x10000000	/* non-prefetchable memory */
+				  0x43000000 0x00000006 0x00000000 0x00000006 0x00000000 0x00000002 0x00000000>;/* prefetchable memory */
 			bus-range = <0x00 0xff>;
 			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
 			interrupt-map = <0x0 0x0 0x0 0x1 &pcie_intc 0x1>,
-- 
1.9.1
