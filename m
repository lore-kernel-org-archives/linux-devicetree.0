From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: [PATCH v2 4/4] arm: dts: Update AST2400 device-tree
Date: Mon, 18 Jun 2018 14:59:02 +1000
Message-ID: <20180618045902.11453-5-benh@kernel.crashing.org>
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
 arch/arm/boot/dts/aspeed-g4.dtsi | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-g4.dtsi b/arch/arm/boot/dts/aspeed-g4.dtsi
index 75df1573380e..b1a19f99a4c9 100644
--- a/arch/arm/boot/dts/aspeed-g4.dtsi
+++ b/arch/arm/boot/dts/aspeed-g4.dtsi
@@ -92,6 +92,12 @@
 			reg = <0x1e6c0080 0x80>;
 		};
 
+		cvic: copro-interrupt-controller@1e6c2000 {
+			compatible = "aspeed,ast2400-cvic", "aspeed-cvic";
+			valid-sources = <0x7fffffff>;
+			reg = <0x1e6c2000 0x80>;
+		};
+
 		mac0: ethernet@1e660000 {
 			compatible = "aspeed,ast2400-mac", "faraday,ftgmac100";
 			reg = <0x1e660000 0x180>;
@@ -161,7 +167,7 @@
 				status = "disabled";
 			};
 
-			sram@1e720000 {
+			sram: sram@1e720000 {
 				compatible = "mmio-sram";
 				reg = <0x1e720000 0x8000>;	// 32K
 			};
-- 
2.17.1
