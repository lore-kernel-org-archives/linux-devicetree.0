From: Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH net-next 07/10] ARM: dts: k2e-netcp: add cpts refclk_mux node
Date: Sat, 1 Jun 2019 13:45:31 +0300
Message-ID: <20190601104534.25790-8-grygorii.strashko@ti.com>
References: <20190601104534.25790-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190601104534.25790-1-grygorii.strashko@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "David S. Miller" <davem@davemloft.net>, Santosh Shilimkar <ssantosh@kernel.org>, Richard Cochran <richardcochran@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: Sekhar Nori <nsekhar@ti.com>, Murali Karicheri <m-karicheri2@ti.com>, Wingman Kwok <w-kwok2@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: devicetree@vger.kernel.org

KeyStone 66AK2E 1G Ethernet Switch Subsystems, can control an external
multiplexer that selects one of up to 32 clocks for time sync reference
(RFTCLK) clock. This feature can be configured through CPTS_RFTCLK_SEL
register (offset: x08) in CPTS module and modelled as multiplexer clock.

Hence, add cpts-refclk-mux clock node which allows to mux one of SYSCLK2,
SYSCLK3, TIMI0, TIMI1, TSIPCLKA, TSREFCLK, TSIPCLKB clocks as CPTS
reference clock [1] and group all CPTS properties under "cpts" subnode.

[1] http://www.ti.com/lit/gpn/66ak2e05
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 arch/arm/boot/dts/keystone-k2e-netcp.dtsi | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
index 1db17ec744b1..ad15e77874b1 100644
--- a/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
+++ b/arch/arm/boot/dts/keystone-k2e-netcp.dtsi
@@ -135,8 +135,8 @@ netcp: netcp@24000000 {
 	/* NetCP address range */
 	ranges = <0 0x24000000 0x1000000>;
 
-	clocks = <&clkpa>, <&clkcpgmac>, <&chipclk12>;
-	clock-names = "pa_clk", "ethss_clk", "cpts";
+	clocks = <&clkpa>, <&clkcpgmac>;
+	clock-names = "pa_clk", "ethss_clk";
 	dma-coherent;
 
 	ti,navigator-dmas = <&dma_gbe 0>,
@@ -156,6 +156,23 @@ netcp: netcp@24000000 {
 			tx-queue = <896>;
 			tx-channel = "nettx";
 
+			cpts {
+				clocks = <&cpts_refclk_mux>;
+				clock-names = "cpts";
+
+				cpts_refclk_mux: cpts-refclk-mux {
+					#clock-cells = <0>;
+					clocks = <&chipclk12>, <&chipclk13>,
+						 <&timi0>, <&timi1>,
+						 <&tsipclka>, <&tsrefclk>,
+						 <&tsipclkb>;
+					ti,mux-tbl = <0x0>, <0x1>, <0x2>,
+						<0x3>, <0x4>, <0x8>, <0xC>;
+					assigned-clocks = <&cpts_refclk_mux>;
+					assigned-clock-parents = <&chipclk12>;
+				};
+			};
+
 			interfaces {
 				gbe0: interface-0 {
 					slave-port = <0>;
-- 
2.17.1
