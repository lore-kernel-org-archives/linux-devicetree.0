From: Michal Simek <michal.simek@xilinx.com>
Subject: [PATCH 07/10] arm64: zynqmp: Add support for RTC
Date: Thu, 20 Jul 2017 14:17:06 +0200
Message-ID: <54962e4d16d6566b8d25a479868ec0edfe5f3bc6.1500552941.git.michal.simek@xilinx.com>
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>, devicetree@vger.kernel.org, monstr@monstr.eu, Stefan Krsmanovic <stefan.krsmanovic@aggios.com>, Marc Zyngier <marc.zyngier@arm.com>, Will Deacon <will.deacon@arm.com>, Duc Dang <dhdang@apm.com>, Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>, Alexander Graf <agraf@suse.de>, linux-kernel@vger.kernel.org, Bharat Kumar Gogada <bharat.kumar.gogada@xilinx.com>, Rob Herring <robh+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>, Mark Rutland <mark.rutland@arm.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>
List-Id: devicetree@vger.kernel.org

Add support for RTC.

Signed-off-by: Michal Simek <michal.simek@xilinx.com>
---

 arch/arm64/boot/dts/xilinx/zynqmp.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
index e7d1815c114b..1272fa6d4f99 100644
--- a/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
+++ b/arch/arm64/boot/dts/xilinx/zynqmp.dtsi
@@ -300,6 +300,16 @@
 			};
 		};
 
+		rtc: rtc@ffa60000 {
+			compatible = "xlnx,zynqmp-rtc";
+			status = "disabled";
+			reg = <0x0 0xffa60000 0x0 0x100>;
+			interrupt-parent = <&gic>;
+			interrupts = <0 26 4>, <0 27 4>;
+			interrupt-names = "alarm", "sec";
+			calibration = <0x8000>;
+		};
+
 		sata: ahci@fd0c0000 {
 			compatible = "ceva,ahci-1v84";
 			status = "disabled";
-- 
1.9.1
