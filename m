From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 3/3] ARM: dts: sunxi: Improve sun8i NAND transfers by using DMA
Date: Thu,  4 Apr 2019 18:21:11 +0200
Message-ID: <20190404162111.22618-4-miquel.raynal@bootlin.com>
References: <20190404162111.22618-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org>
In-Reply-To: <20190404162111.22618-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+gldm-linux-mtd-36=gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

In the current state, sun8i NAND controllers use PIO during
transfers. Throughput can be increased thanks to the use of DMA
(mostly during reads, because of the ECC pipelining feature).

Besides the usual addition of DMA DT properties, because the sun8i
NAND DMA handling is different than for older SoCs, we must also
update the compatible which has recently been introduced for this
purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm/boot/dts/sun8i-a23-a33.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/sun8i-a23-a33.dtsi b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
index 14a7d0288b45..f928b4bceb22 100644
--- a/arch/arm/boot/dts/sun8i-a23-a33.dtsi
+++ b/arch/arm/boot/dts/sun8i-a23-a33.dtsi
@@ -162,11 +162,13 @@
 		};
 
 		nfc: nand@1c03000 {
-			compatible = "allwinner,sun4i-a10-nand";
+			compatible = "allwinner,sun8i-a33-nand-controller";
 			reg = <0x01c03000 0x1000>;
 			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&ccu CLK_BUS_NAND>, <&ccu CLK_NAND>;
 			clock-names = "ahb", "mod";
+			dmas = <&dma 5>;
+			dma-names = "rxtx";
 			resets = <&ccu RST_BUS_NAND>;
 			reset-names = "ahb";
 			pinctrl-names = "default";
-- 
2.19.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
