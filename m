From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.1 12/59] ARC: [plat-hsdk]: Add missing FIFO size
 entry in GMAC node
Date: Fri, 14 Jun 2019 16:27:56 -0400
Message-ID: <20190614202843.26941-12-sashal@kernel.org>
References: <20190614202843.26941-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614202843.26941-1-sashal@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Sasha Levin <sashal@kernel.org>, devicetree@vger.kernel.org, Joao Pinto <jpinto@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Alexey Brodkin <abrodkin@synopsys.com>, Rob Herring <robh+dt@kernel.org>, Jose Abreu <joabreu@synopsys.com>, linux-snps-arc@lists.infradead.org, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
List-Id: devicetree@vger.kernel.org

From: Jose Abreu <joabreu@synopsys.com>

[ Upstream commit 4c70850aeb2e40016722cd1abd43c679666d3ca0 ]

Add the binding for RX/TX fifo size of GMAC node.

Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
Tested-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arc/boot/dts/hsdk.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 699f372b2a6f..6219b372e9c1 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -196,6 +196,9 @@
 			mac-address = [00 00 00 00 00 00]; /* Filled in by U-Boot */
 			dma-coherent;
 
+			tx-fifo-depth = <4096>;
+			rx-fifo-depth = <4096>;
+
 			mdio {
 				#address-cells = <1>;
 				#size-cells = <0>;
-- 
2.20.1
