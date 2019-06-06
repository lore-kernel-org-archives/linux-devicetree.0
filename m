From: Dinh Nguyen <dinguyen@kernel.org>
Subject: [PATCH 1/2] ARM: dts: socfpga: use the "altr,
 socfpga-stmmac-a10-s10" binding
Date: Thu,  6 Jun 2019 17:31:39 -0500
Message-ID: <20190606223140.4315-1-dinguyen@kernel.org>
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
To: devicetree@vger.kernel.org
Cc: mark.rutland@arm.com, dinguyen@kernel.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

Because of register and bits difference for setting PHY modes, PTP reference
clock, and FPGA signalling, the Arria10 SoC needs to use the
"altr,socfpga-stmmac-a10-s10" binding to set the correct modes.

On Arria10, each EMAC has its own register for PHY modes, and they all have
the same offset, thus we can use the 2nd parameter to specify the offsets
for the FPGA signal bits.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index ae24599d5829..61a767c905b3 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -418,7 +418,7 @@
 		};
 
 		gmac0: ethernet@ff800000 {
-			compatible = "altr,socfpga-stmmac", "snps,dwmac-3.72a", "snps,dwmac";
+			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.72a", "snps,dwmac";
 			altr,sysmgr-syscon = <&sysmgr 0x44 0>;
 			reg = <0xff800000 0x2000>;
 			interrupts = <0 92 IRQ_TYPE_LEVEL_HIGH>;
@@ -438,8 +438,8 @@
 		};
 
 		gmac1: ethernet@ff802000 {
-			compatible = "altr,socfpga-stmmac", "snps,dwmac-3.72a", "snps,dwmac";
-			altr,sysmgr-syscon = <&sysmgr 0x48 0>;
+			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.72a", "snps,dwmac";
+			altr,sysmgr-syscon = <&sysmgr 0x48 8>;
 		        reg = <0xff802000 0x2000>;
 			interrupts = <0 93 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
@@ -458,8 +458,8 @@
 		};
 
 		gmac2: ethernet@ff804000 {
-			compatible = "altr,socfpga-stmmac", "snps,dwmac-3.72a", "snps,dwmac";
-			altr,sysmgr-syscon = <&sysmgr 0x4C 0>;
+			compatible = "altr,socfpga-stmmac-a10-s10", "snps,dwmac-3.72a", "snps,dwmac";
+			altr,sysmgr-syscon = <&sysmgr 0x4C 16>;
 			reg = <0xff804000 0x2000>;
 			interrupts = <0 94 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
-- 
2.20.0
