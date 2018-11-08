From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH] arm: dts: socfpga: remove dma-mask property
Date: Thu,  8 Nov 2018 10:22:26 -0600
Message-ID: <20181108162226.5648-1-dinguyen@kernel.org>
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
To: robh+dt@kernel.org, mark.rutland@arm.com
Cc: dinguyen@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

The dma-mask property has been removed from the NAND driver. Remove the
property from the DTS files.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga.dtsi         | 1 -
 arch/arm/boot/dts/socfpga_arria10.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 77dbb3cda496..c25dede54398 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -753,7 +753,6 @@
 			      <0xffb80000 0x10000>;
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0x0 0x90 0x4>;
-			dma-mask = <0xffffffff>;
 			clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 			clock-names = "nand", "nand_x", "ecc";
 			status = "disabled";
diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index 0b1ab88b4039..e41fa23481c3 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -653,7 +653,6 @@
 			      <0xffb80000 0x10000>;
 			reg-names = "nand_data", "denali_reg";
 			interrupts = <0 99 4>;
-			dma-mask = <0xffffffff>;
 			clocks = <&nand_clk>, <&nand_x_clk>, <&nand_ecc_clk>;
 			clock-names = "nand", "nand_x", "ecc";
 			status = "disabled";
-- 
2.17.1
