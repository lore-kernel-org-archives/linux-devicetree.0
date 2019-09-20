From: Rob Herring <robh@kernel.org>
Subject: [RFC PATCH] arm: dts: integratorap: Remove top level dma-ranges
Date: Fri, 20 Sep 2019 10:36:22 -0500
Message-ID: <20190920153622.14616-1-robh@kernel.org>
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
To: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

'dma-ranges' at the top level doesn't make sense. 'dma-ranges' implies
there is a parent bus node with '#address-cells' and '#size-cells' which
is impossible here.

Likely this translation needs to be moved down to sub-nodes that need
it.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
This probably worked due to bugs in dma-ranges address translations (or 
lack of).

AFAICT, only PCI needs dma-ranges. The TRM says inbound PCI addresses 
are 1:1. So a translation from child address 0x80000000 to cpu address 
0x0 seems wrong. The v3 PCI driver also fails to look at parent nodes 
for dma-ranges.

 arch/arm/boot/dts/integratorap.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/integratorap.dts b/arch/arm/boot/dts/integratorap.dts
index 94d2ff9836d0..198d66181c50 100644
--- a/arch/arm/boot/dts/integratorap.dts
+++ b/arch/arm/boot/dts/integratorap.dts
@@ -9,7 +9,6 @@
 / {
 	model = "ARM Integrator/AP";
 	compatible = "arm,integrator-ap";
-	dma-ranges = <0x80000000 0x0 0x80000000>;
 
 	cpus {
 		#address-cells = <1>;
-- 
2.20.1
