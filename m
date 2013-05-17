From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 4/5] ARM: at91: sam9g45 add udc DT support
Date: Fri, 17 May 2013 16:42:09 +0200
Message-ID: <1368801730-31383-4-git-send-email-plagnioj@jcrosoft.com>
References: <20130517141443.GB16804@game.jcrosoft.org>
 <1368801730-31383-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1368801730-31383-1-git-send-email-plagnioj@jcrosoft.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>, devicetree-discuss@lists.ozlabs.org, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Nicolas Ferre <nicolas.ferre@atmel.com>
---
 arch/arm/boot/dts/at91sam9g45.dtsi |   62 ++++++++++++++++++++++++++++++++++++
 arch/arm/mach-at91/at91sam9g45.c   |    2 ++
 2 files changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9g45.dtsi b/arch/arm/boot/dts/at91sam9g45.dtsi
index f0091af..fccc488 100644
--- a/arch/arm/boot/dts/at91sam9g45.dtsi
+++ b/arch/arm/boot/dts/at91sam9g45.dtsi
@@ -582,6 +582,68 @@
 				pinctrl-0 = <&pinctrl_spi1>;
 				status = "disabled";
 			};
+
+			usb2: gadget@fff78000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "atmel,at91sam9rl-udc";
+				reg = <0x00600000 0x80000
+				       0xfff78000 0x400>;
+				interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
+				status = "disabled";
+
+				ep0 {
+					reg = <0>;
+					atmel,fifo-size = <64>;
+					atmel,nb-banks = <1>;
+				};
+
+				ep1 {
+					reg = <1>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <2>;
+					atmel,can-dma;
+					atmel,can-isoc;
+				};
+
+				ep2 {
+					reg = <2>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <2>;
+					atmel,can-dma;
+					atmel,can-isoc;
+				};
+
+				ep3 {
+					reg = <3>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <3>;
+					atmel,can-dma;
+				};
+
+				ep4 {
+					reg = <4>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <3>;
+					atmel,can-dma;
+				};
+
+				ep5 {
+					reg = <5>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <3>;
+					atmel,can-dma;
+					atmel,can-isoc;
+				};
+
+				ep6 {
+					reg = <6>;
+					atmel,fifo-size = <1024>;
+					atmel,nb-banks = <3>;
+					atmel,can-dma;
+					atmel,can-isoc;
+				};
+			};
 		};
 
 		nand0: nand@40000000 {
diff --git a/arch/arm/mach-at91/at91sam9g45.c b/arch/arm/mach-at91/at91sam9g45.c
index 8b7fce0..95a418a 100644
--- a/arch/arm/mach-at91/at91sam9g45.c
+++ b/arch/arm/mach-at91/at91sam9g45.c
@@ -266,6 +266,8 @@ static struct clk_lookup periph_clocks_lookups[] = {
 	CLKDEV_CON_DEV_ID(NULL, "fff88000.i2c", &twi1_clk),
 	CLKDEV_CON_DEV_ID("spi_clk", "fffa4000.spi", &spi0_clk),
 	CLKDEV_CON_DEV_ID("spi_clk", "fffa8000.spi", &spi1_clk),
+	CLKDEV_CON_DEV_ID("hclk", "600000.gadget", &utmi_clk),
+	CLKDEV_CON_DEV_ID("pclk", "600000.gadget", &udphs_clk),
 	/* fake hclk clock */
 	CLKDEV_CON_DEV_ID("hclk", "at91_ohci", &uhphs_clk),
 	CLKDEV_CON_DEV_ID(NULL, "fffff200.gpio", &pioA_clk),
-- 
1.7.10.4
