From: Boris BREZILLON <b.brezillon@overkiz.com>
Subject: [PATCH] ARM: at91/dt: fix sama5d3 ohci hclk clock reference
Date: Thu, 16 Jan 2014 16:25:34 +0100
Message-ID: <1389885934-26119-1-git-send-email-b.brezillon@overkiz.com>
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
To: Nicolas Ferre <nicolas.ferre@atmel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Russell King <linux@arm.linux.org.uk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Boris BREZILLON <b.brezillon@overkiz.com>
List-Id: devicetree@vger.kernel.org

The hclk clock of the ohci node is referencing udphs_clk instead of
uhphs_clk.

Signed-off-by: Boris BREZILLON <b.brezillon@overkiz.com>
---
 arch/arm/boot/dts/sama5d3.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sama5d3.dtsi b/arch/arm/boot/dts/sama5d3.dtsi
index e398e5d..31356e2 100644
--- a/arch/arm/boot/dts/sama5d3.dtsi
+++ b/arch/arm/boot/dts/sama5d3.dtsi
@@ -1195,7 +1195,7 @@
 			compatible = "atmel,at91rm9200-ohci", "usb-ohci";
 			reg = <0x00600000 0x100000>;
 			interrupts = <32 IRQ_TYPE_LEVEL_HIGH 2>;
-			clocks = <&usb>, <&uhphs_clk>, <&udphs_clk>,
+			clocks = <&usb>, <&uhphs_clk>, <&uhphs_clk>,
 				 <&uhpck>;
 			clock-names = "usb_clk", "ohci_clk", "hclk", "uhpck";
 			status = "disabled";
-- 
1.7.9.5
