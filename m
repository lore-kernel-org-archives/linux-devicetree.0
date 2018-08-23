From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Thu, 23 Aug 2018 15:22:46 +0100
Message-ID: <1535034166-24798-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

From: Chris Paterson <chris.paterson2@renesas.com>

Add the device nodes for both RZ/G2M CAN channels.

Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---

This patch depends on:
https://lkml.org/lkml/2018/8/23/1049
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30550.html


 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 5d0109a..cd204f5 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -816,6 +816,30 @@
 			status = "disabled";
 		};
 
+		can0: can@e6c30000 {
+			compatible = "renesas,can-r8a774a1",
+				     "renesas,rzg-gen2-can";
+			reg = <0 0xe6c30000 0 0x1000>;
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 916>, <&can_clk>;
+			clock-names = "clkp1", "can_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 916>;
+			status = "disabled";
+		};
+
+		can1: can@e6c38000 {
+			compatible = "renesas,can-r8a774a1",
+				     "renesas,rzg-gen2-can";
+			reg = <0 0xe6c38000 0 0x1000>;
+			interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>, <&can_clk>;
+			clock-names = "clkp1", "can_clk";
+			power-domains = <&sysc 32>;
+			resets = <&cpg 915>;
+			status = "disabled";
+		};
+
 		pwm0: pwm@e6e30000 {
 			compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
 			reg = <0 0xe6e30000 0 0x8>;
-- 
2.7.4
