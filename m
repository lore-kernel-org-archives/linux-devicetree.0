From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 4/9] arm64: dts: renesas: r8a774a1: Add IPMMU device nodes
Date: Thu, 23 Aug 2018 14:43:03 +0100
Message-ID: <1535031788-19907-5-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1535031788-19907-1-git-send-email-fabrizio.castro@bp.renesas.com>
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

Add r8a774a1 IPMMU nodes.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 9f42b7c..d2bb82b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -517,6 +517,79 @@
 			dma-channels = <16>;
 		};
 
+		ipmmu_ds0: mmu@e6740000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe6740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 0>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_ds1: mmu@e7740000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe7740000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 1>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_hc: mmu@e6570000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe6570000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 2>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mm: mmu@e67b0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xe67b0000 0 0x1000>;
+			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_mp: mmu@ec670000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xec670000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 4>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv0: mmu@fd800000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfd800000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 5>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_pv1: mmu@fd950000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfd950000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 6>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vc0: mmu@fe6b0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfe6b0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 8>;
+			power-domains = <&sysc 14>;
+			#iommu-cells = <1>;
+		};
+
+		ipmmu_vi0: mmu@febd0000 {
+			compatible = "renesas,ipmmu-r8a774a1";
+			reg = <0 0xfebd0000 0 0x1000>;
+			renesas,ipmmu-main = <&ipmmu_mm 9>;
+			power-domains = <&sysc 32>;
+			#iommu-cells = <1>;
+		};
+
 		avb: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a774a1",
 				     "renesas,etheravb-rcar-gen3";
-- 
2.7.4
