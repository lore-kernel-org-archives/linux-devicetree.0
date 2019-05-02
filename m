From: Jose Abreu <Jose.Abreu@synopsys.com>
Subject: [PATCH] ARC: [plat-hsdk]: Add missing multicast filter bins number to
 GMAC node
Date: Thu,  2 May 2019 17:12:32 +0200
Message-ID: <7f36bbadc0df4c93c396690dab59f34775de3874.1556788240.git.joabreu@synopsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+gla-linux-snps-arc=m.gmane.org@lists.infradead.org
To: devicetree@vger.kernel.org, linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, Mark Rutland <mark.rutland@arm.com>, Vineet Gupta <Vineet.Gupta1@synopsys.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Rob Herring <robh+dt@kernel.org>
List-Id: devicetree@vger.kernel.org

GMAC controller on HSDK boards supports 256 Hash Table size so we need to
add the multicast filter bins property. This allows for the Hash filter
to work properly using stmmac driver.

Signed-off-by: Jose Abreu <joabreu@synopsys.com>
Cc: Joao Pinto <jpinto@synopsys.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/boot/dts/hsdk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arc/boot/dts/hsdk.dts b/arch/arc/boot/dts/hsdk.dts
index 69bc1c9e8e50..b0f059377ab0 100644
--- a/arch/arc/boot/dts/hsdk.dts
+++ b/arch/arc/boot/dts/hsdk.dts
@@ -187,6 +187,7 @@
 			interrupt-names = "macirq";
 			phy-mode = "rgmii";
 			snps,pbl = <32>;
+			snps,multicast-filter-bins = <256>;
 			clocks = <&gmacclk>;
 			clock-names = "stmmaceth";
 			phy-handle = <&phy0>;
-- 
2.7.4
