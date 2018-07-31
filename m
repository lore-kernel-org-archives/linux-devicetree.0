From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/4] ARM: dts: sh73a0: Rename twd clock to periph clock
Date: Tue, 31 Jul 2018 18:08:52 +0200
Message-ID: <20180731160855.6758-2-geert+renesas@glider.be>
References: <20180731160855.6758-1-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180731160855.6758-1-geert+renesas@glider.be>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The "TWD" clock is actually the Cortex-A9 MPCore "PERIPHCLK" clock,
which not only clocks the private timers and watchdogs (TWD), but also
the interrupt controller and global timer.

Hence rename it from "twd" to "periph".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/sh73a0.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/sh73a0.dtsi b/arch/arm/boot/dts/sh73a0.dtsi
index e8f0a07c45645737..b495a9d2f1118006 100644
--- a/arch/arm/boot/dts/sh73a0.dtsi
+++ b/arch/arm/boot/dts/sh73a0.dtsi
@@ -43,7 +43,7 @@
 		compatible = "arm,cortex-a9-twd-timer";
 		reg = <0xf0000600 0x20>;
 		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_EDGE_RISING)>;
-		clocks = <&twd_clk>;
+		clocks = <&periph_clk>;
 	};
 
 	gic: interrupt-controller@f0001000 {
@@ -812,7 +812,7 @@
 			clock-div = <13>;
 			clock-mult = <1>;
 		};
-		twd_clk: twd {
+		periph_clk: periph {
 			compatible = "fixed-factor-clock";
 			clocks = <&cpg_clocks SH73A0_CLK_Z>;
 			#clock-cells = <0>;
-- 
2.17.1
