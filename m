From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 10/10] arm64: zynqmp: Set status disabled in dtsi
Date: Thu, 20 Jul 2017 14:17:09 +0200
Message-ID: <e3533d223e5a6a1b39d401cc6ec4b481a8b60398.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

From: Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>

Do not enable smmu via dtsi. Enable it in board file when needed.

Signed-off-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 9304249a23ed..787463796348 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -339,6 +339,7 @@
 		smmu: smmu@fd800000 {
 			compatible = "arm,mmu-500";
 			reg = <0x0 0xfd800000 0x0 0x20000>;
+			status = "disabled";
 			#global-interrupts = <1>;
 			interrupt-parent = <&gic>;
 			interrupts = <0 155 4>,
-- 
1.9.1
