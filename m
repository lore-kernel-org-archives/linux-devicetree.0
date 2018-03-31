From: Mark Kettenis <kettenis@openbsd.org>
Subject: [PATCH] arm64: dts: marvell: mark CP110 ahci as dma-coherent
Date: Sat, 31 Mar 2018 16:44:06 +0200
Message-ID: <20180331144406.23030-1-kettenis@openbsd.org>
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
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Mark Kettenis <kettenis@openbsd.org>, andrew@lunn.ch, gregory.clement@bootlin.com, jason@lakedaemon.net, sebastian.hesselbarth@gmail.com
List-Id: devicetree@vger.kernel.org

The hardware is clearly DMA coherent and not marking it as such leads
to cache coherency problems, at least with the OpenBSD kernel.

Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
---
 arch/arm64/boot/dts/marvell/armada-cp110.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
index a8af4136dbe7..7e9177ef7b7d 100644
--- a/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
+++ b/arch/arm64/boot/dts/marvell/armada-cp110.dtsi
@@ -231,6 +231,7 @@
 			compatible = "marvell,armada-8k-ahci",
 			"generic-ahci";
 			reg = <0x540000 0x30000>;
+			dma-coherent;
 			interrupts = <ICU_GRP_NSR 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&CP110_LABEL(clk) 1 15>;
 			status = "disabled";
-- 
2.16.2
