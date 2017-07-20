From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 05/10] arm64: zynqmp: Add CCI-400 node
Date: Thu, 20 Jul 2017 14:17:04 +0200
Message-ID: <19ec9d940db70d38a90b8ca41566dd7de0ad14c4.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, devicetree@vger.kernel.org, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Alexander Graf <agraf@suse.de>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Moritz Fischer <mdf@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, Will Wong <willw@xilinx.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add CCI-400 node to DTSI.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index 3657fdbdb552..f3968737e613 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -170,6 +170,25 @@
 			rx-fifo-depth = <0x40>;
 		};
 
+		cci: cci@fd6e0000 {
+			compatible = "arm,cci-400";
+			reg = <0x0 0xfd6e0000 0x0 0x9000>;
+			ranges = <0x0 0x0 0xfd6e0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			pmu@9000 {
+				compatible = "arm,cci-400-pmu,r1";
+				reg = <0x9000 0x5000>;
+				interrupt-parent = <&gic>;
+				interrupts = <0 123 4>,
+					     <0 123 4>,
+					     <0 123 4>,
+					     <0 123 4>,
+					     <0 123 4>;
+			};
+		};
+
 		gem0: ethernet@ff0b0000 {
 			compatible = "cdns,gem";
 			status = "disabled";
-- 
1.9.1
