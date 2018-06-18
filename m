From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 3/4] arm: dts: Update AST2500 device-tree
Date: Mon, 18 Jun 2018 14:59:01 +1000
Message-ID: <20180618045902.11453-4-benh@kernel.crashing.org>
References: <20180618045902.11453-1-benh@kernel.crashing.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180618045902.11453-1-benh@kernel.crashing.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joel Stanley <joel@jms.id.au>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>
List-Id: devicetree@vger.kernel.org

Add the missing node for the CVIC (the coprocessor interrupt
controller) and add a label to the SRAM node so it can be
referenced from the board device-tree file.

Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/arm/boot/dts/aspeed-g5.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi b/arch/arm/boot/dts/aspeed-g5.dtsi
index 17f2714d18a7..21141ca1bfa4 100644
--- a/arch/arm/boot/dts/aspeed-g5.dtsi
+++ b/arch/arm/boot/dts/aspeed-g5.dtsi
@@ -127,6 +127,13 @@
 			reg = <0x1e6c0080 0x80>;
 		};
 
+		cvic: copro-interrupt-controller@1e6c2000 {
+			compatible = "aspeed,ast2500-cvic", "aspeed-cvic";
+			valid-sources = <0xffffffff>;
+			copro-sw-interrupts = <1>;
+			reg = <0x1e6c2000 0x80>;
+		};
+
 		mac0: ethernet@1e660000 {
 			compatible = "aspeed,ast2500-mac", "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
@@ -211,7 +218,7 @@
 				status = "disabled";
 			};
 
-			sram@1e720000 {
+			sram: sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x9000>;	// 36K
 			};
-- 
2.17.1
