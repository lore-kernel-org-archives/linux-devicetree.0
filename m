From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH v2] arm64: dts: r8a7795: add IMR-LX4 support
Date: Tue, 27 Jun 2017 20:30:53 +0300
Message-ID: <20170627173152.532417992@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Content-Disposition: inline; filename=arm64-dts-r8a7795-add-IMR-LX4-support-v2.patch
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Simon Horman <horms@verge.net.au>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: devicetree@vger.kernel.org

Describe the IMR-LX4 devices in the R8A7795 device tree.

Based on the original (and large) patch by Konstantin Kozhevnikov
<Konstantin.Kozhevnikov@cogentembedded.com>.

Signed-off-by: Konstantin Kozhevnikov <Konstantin.Kozhevnikov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

---
This patch is against the 'renesas-devel-20170626-v4.12-rc7' tag of Simon
Horman's 'renesas.git' repo.

The IMR-LX4 bindings were documented in the IMR driver patch and ACK'ed by Rob
Herring, so I don't expect them to change...

Changes in version 2:
- added SoC specific "compatible" prop values;
- refreshed the patch;
- added Geert's tag.

 arch/arm64/boot/dts/renesas/r8a7795.dtsi |   36 +++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

Index: renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
===================================================================
--- renesas.orig/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ renesas/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -1535,6 +1535,42 @@
 			status = "disabled";
 		};
 
+		imr-lx4@fe860000 {
+			compatible = "renesas,r8a7795-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe860000 0 0x2000>;
+			interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 823>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe870000 {
+			compatible = "renesas,r8a7795-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe870000 0 0x2000>;
+			interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 822>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe880000 {
+			compatible = "renesas,r8a7795-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe880000 0 0x2000>;
+			interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 821>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
+		imr-lx4@fe890000 {
+			compatible = "renesas,r8a7795-imr-lx4",
+				     "renesas,imr-lx4";
+			reg = <0 0xfe890000 0 0x2000>;
+			interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 820>;
+			power-domains = <&sysc R8A7795_PD_A3VC>;
+		};
+
 		vspbc: vsp@fe920000 {
 			compatible = "renesas,vsp2";
 			reg = <0 0xfe920000 0 0x8000>;
