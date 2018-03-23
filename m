From: Philipp Puschmann <pp@emlix.com>
Subject: [PATCH] arm: dts: socfpga: fix GIC PPI warning
Date: Fri, 23 Mar 2018 10:22:15 +0100
Message-ID: <20180323092215.1307-1-pp@emlix.com>
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
To: dinguyen@kernel.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, Philipp Puschmann <pp@emlix.com>, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Fixes the warning "GIC: PPI13 is secure or misconfigured" by
changing the interrupt type from level_low to edge_raising

Signed-off-by: Philipp Puschmann <pp@emlix.com>
---
 arch/arm/boot/dts/socfpga.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 595eb4f1a761..e9417551d7ea 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -815,7 +815,7 @@
 		timer@fffec600 {
 			compatible = "arm,cortex-a9-twd-timer";
 			reg = <0xfffec600 0x100>;
-			interrupts = <1 13 0xf04>;
+			interrupts = <1 13 0xf01>;
 			clocks = <&mpu_periph_clk>;
 		};
 
-- 
2.16.2
