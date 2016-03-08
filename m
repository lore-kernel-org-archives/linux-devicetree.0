From: Graham Moore <grmoore@opensource.altera.com>
Subject: [PATCH] ARM: socfpga: dts: Add missing clock and interrupt fields for
 Arria10 DMA
Date: Tue, 8 Mar 2016 11:02:50 -0600
Message-ID: <1457456571-25541-1-git-send-email-grmoore@opensource.altera.com>
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
To: Graham Moore <grmoore@opensource.altera.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Dinh Nguyen <dinguyen@opensource.altera.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The PL330 DMA driver will not load on Arria10 without devicetree entries
for clocks and clock_names.  This patch adds those entries.  It also adds
the ninth interrupt, which is required for error detection.

Signed-off-by: Graham Moore <grmoore@opensource.altera.com>
---
 arch/arm/boot/dts/socfpga_arria10.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10.dtsi b/arch/arm/boot/dts/socfpga_arria10.dtsi
index cce9e50..45a4728 100644
--- a/arch/arm/boot/dts/socfpga_arria10.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10.dtsi
@@ -78,10 +78,13 @@
 					     <0 87 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 88 IRQ_TYPE_LEVEL_HIGH>,
 					     <0 89 IRQ_TYPE_LEVEL_HIGH>,
-					     <0 90 IRQ_TYPE_LEVEL_HIGH>;
+					     <0 90 IRQ_TYPE_LEVEL_HIGH>,
+					     <0 91 IRQ_TYPE_LEVEL_HIGH>;
 				#dma-cells = <1>;
 				#dma-channels = <8>;
 				#dma-requests = <32>;
+				clocks = <&l4_main_clk>;
+				clock-names = "apb_pclk";
 			};
 		};
 
-- 
2.5.0
