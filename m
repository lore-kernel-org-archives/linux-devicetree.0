From: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 4/4] ARM: dts: sunxi: Improve A33 NAND transfers by using
 DMA
Date: Mon,  8 Apr 2019 09:41:47 +0200
Message-ID: <20190408074147.26797-4-miquel.raynal@bootlin.com>
References: <20190408074147.26797-1-miquel.raynal@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190408074147.26797-1-miquel.raynal@bootlin.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Tudor Ambarus <Tudor.Ambarus@microchip.com>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
List-Id: devicetree@vger.kernel.org

In the current state, A33 NAND controllers use PIO during
transfers. Throughput can be increased thanks to the use of DMA
(mostly during reads, because of the ECC pipelining feature).

Besides the usual addition of DMA DT properties, because the A33
NAND DMA handling is different than for older SoCs, we must also
update the compatible which has recently been introduced for this
purpose.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---

Changes in v2:
* Use 'A33' in the commit log instead of sun8i.

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
