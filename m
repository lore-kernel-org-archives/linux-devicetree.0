From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774a1: Add GPIO device nodes
Date: Thu, 23 Aug 2018 15:18:18 +0100
Message-ID: <1535033898-23610-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>, devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Add GPIO device nodes to the DT of the r8a774a1 SoC.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---

This patch depends on:
https://www.mail-archive.com/linux-renesas-soc@vger.kernel.org/msg30549.html

 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 120 ++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index b9d2da4..5d0109a 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -200,6 +200,126 @@
 			status = "disabled";
 		};
 
+		gpio0: gpio@e6050000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6050000 0 0x50>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 0 16>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 912>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 912>;
+		};
+
+		gpio1: gpio@e6051000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6051000 0 0x50>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 32 29>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 911>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 911>;
+		};
+
+		gpio2: gpio@e6052000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6052000 0 0x50>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 64 15>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 910>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 910>;
+		};
+
+		gpio3: gpio@e6053000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6053000 0 0x50>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 96 16>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 909>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 909>;
+		};
+
+		gpio4: gpio@e6054000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6054000 0 0x50>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 128 18>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 908>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 908>;
+		};
+
+		gpio5: gpio@e6055000 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6055000 0 0x50>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 160 26>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 907>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 907>;
+		};
+
+		gpio6: gpio@e6055400 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6055400 0 0x50>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 192 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 906>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 906>;
+		};
+
+		gpio7: gpio@e6055800 {
+			compatible = "renesas,gpio-r8a774a1",
+				     "renesas,rcar-gen3-gpio";
+			reg = <0 0xe6055800 0 0x50>;
+			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 224 4>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 905>;
+			power-domains = <&sysc 32>;
+			resets = <&cpg 905>;
+		};
+
 		pfc: pin-controller@e6060000 {
 			compatible = "renesas,pfc-r8a774a1";
 			reg = <0 0xe6060000 0 0x50c>;
-- 
2.7.4
