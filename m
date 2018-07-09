From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 2/2] ARM: dts: socfpga: update NAND clocking for c5/a5
Date: Mon,  9 Jul 2018 17:41:03 -0500
Message-ID: <1531176063-30140-2-git-send-email-dinguyen@kernel.org>
References: <1531176063-30140-1-git-send-email-dinguyen@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531176063-30140-1-git-send-email-dinguyen@kernel.org>
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
Cc: mark.rutland@arm.com, marex@denx.de, yamada.masahiro@socionext.com, dinguyen@kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org
List-Id: devicetree@vger.kernel.org

The nand_x_clk is derived from the nand_clk. Also, update the NAND dts property
with the correct clocks property.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index b38f8c2..ae432b9 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -486,7 +486,7 @@
 					nand_clk: nand_clk {
 						#clock-cells = <0>;
 						compatible = "altr,socfpga-gate-clk";
-						clocks = <&f2s_periph_ref_clk>, <&main_nand_sdmmc_clk>, <&per_nand_mmc_clk>;
+						clocks = <&nand_x_clk>;
 						clk-gate = <0xa0 10>;
 						fixed-divider = <4>;
 					};
@@ -754,7 +754,8 @@
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0x0 0x90 0x4>;
 			dma-mask = <0xffffffff>;
-			clocks = <&nand_x_clk>;
+			clocks = <&nand_clk>, <&nand_x_clk>;
+			clock-names = "nand", "nand_x";
 			status = "disabled";
 		};
 
-- 
2.7.4
