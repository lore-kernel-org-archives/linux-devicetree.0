From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Subject: [PATCH 6/7] ARM: at91: sam9g45 add udc DT support
Date: Mon, 20 May 2013 18:25:59 +0200
Message-ID: <1369067160-3230-6-git-send-email-plagnioj@jcrosoft.com>
References: <20130520162149.GC9937@game.jcrosoft.org>
 <1369067160-3230-1-git-send-email-plagnioj@jcrosoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1369067160-3230-1-git-send-email-plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>
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
