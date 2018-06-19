From: Richard Weinberger <richard@nod.at>
Subject: [PATCH] arm: dts: socfpga: denali needs nand_x_clk too
Date: Tue, 19 Jun 2018 14:07:19 +0200
Message-ID: <20180619120719.26921-1-richard@nod.at>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, dinguyen@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, marek.vasut@gmail.com, computersforpeace@gmail.com, dwmw2@infradead.org, miquel.raynal@bootlin.com, boris.brezillon@bootlin.com, yamada.masahiro@socionext.com, Richard Weinberger <richard@nod.at>
List-Id: devicetree@vger.kernel.org

The denali NAND flash controller needs at least two clocks to operate,
nand_clk and nand_x_clk.
Since 1bb88666775e ("mtd: nand: denali: handle timing parameters by
setup_data_interface()") nand_x_clk is used to derive timing settings.

Signed-off-by: Richard Weinberger <richard@nod.at>
---
Strictly speaking denali needs a ecc_clk too, but AFAIK such a clock
is not present on this SoC.
But my SoCFPGA knowledge is very limited.

Thanks,
//richard
---
 arch/arm/boot/dts/socfpga.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 486d4e7433ed..562f7b375bbd 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -754,7 +754,8 @@
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0x0 0x90 0x4>;
 			dma-mask = <0xffffffff>;
-			clocks = <&nand_clk>;
+			clocks = <&nand_clk>, <&nand_x_clk>;
+			clock-names = "nand", "nand_x";
 			status = "disabled";
 		};
 
-- 
2.17.1
