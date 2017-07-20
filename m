From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 08/10] arm64: zynqmp: Correct IRQ nr for the SMMU
Date: Thu, 20 Jul 2017 14:17:07 +0200
Message-ID: <a0034f0263d59aaba385092318ddf7dd5ccbe8db.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Mark Rutland <mark.rutland@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Alexander Graf <agraf@suse.de>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dinh Nguyen <dinguyen@opensource.altera.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 1272fa6d4f99..4adf5285f56d 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -341,11 +341,11 @@
 			reg = <0x0 0xfd800000 0x0 0x20000>;
 			#global-interrupts = <1>;
 			interrupt-parent = <&gic>;
-			interrupts = <0 157 4>,
-				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
-				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
-				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>,
-				<0 157 4>, <0 157 4>, <0 157 4>, <0 157 4>;
+			interrupts = <0 155 4>,
+				<0 155 4>, <0 155 4>, <0 155 4>, <0 155 4>,
+				<0 155 4>, <0 155 4>, <0 155 4>, <0 155 4>,
+				<0 155 4>, <0 155 4>, <0 155 4>, <0 155 4>,
+				<0 155 4>, <0 155 4>, <0 155 4>, <0 155 4>;
 		};
 
 		spi0: spi@ff040000 {
-- 
1.9.1
