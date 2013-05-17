From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH 2/5] ARM: at91: sam9x5 add udc DT support
Date: Fri, 17 May 2013 16:42:07 +0200
Message-ID: <1368801730-31383-2-git-send-email-plagnioj@jcrosoft.com>
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
 arch/arm/boot/dts/at91sam9x5.dtsi |   62 +++++++++++++++++++++++++++++++++++++
 arch/arm/mach-at91/at91sam9x5.c   |    2 ++
 2 files changed, 64 insertions(+)

diff --git a/arch/arm/boot/dts/at91sam9x5.dtsi b/arch/arm/boot/dts/at91sam9x5.dtsi
index af91599..01a815d 100644
--- a/arch/arm/boot/dts/at91sam9x5.dtsi
+++ b/arch/arm/boot/dts/at91sam9x5.dtsi
@@ -645,6 +645,68 @@
 				status = "disabled";
 			};
 
+			usb2: gadget@f803c000 {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				compatible = "atmel,at91sam9rl-udc";
+				reg = <0x00500000 0x80000
+				       0xf803c000 0x400>;
+				interrupts = <23 IRQ_TYPE_LEVEL_HIGH 0>;
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
+
 			rtc@fffffeb0 {
 				compatible = "atmel,at91rm9200-rtc";
 				reg = <0xfffffeb0 0x40>;
diff --git a/arch/arm/mach-at91/at91sam9x5.c b/arch/arm/mach-at91/at91sam9x5.c
index e631fec..2abee66 100644
--- a/arch/arm/mach-at91/at91sam9x5.c
+++ b/arch/arm/mach-at91/at91sam9x5.c
@@ -249,6 +249,8 @@ static struct clk_lookup periph_clocks_lookups[] = {
 	CLKDEV_CON_DEV_ID("hclk", "600000.ohci", &uhphs_clk),
 	CLKDEV_CON_DEV_ID("ohci_clk", "600000.ohci", &uhphs_clk),
 	CLKDEV_CON_DEV_ID("ehci_clk", "700000.ehci", &uhphs_clk),
+	CLKDEV_CON_DEV_ID("hclk", "500000.gadget", &utmi_clk),
+	CLKDEV_CON_DEV_ID("pclk", "500000.gadget", &udphs_clk),
 };
 
 /*
-- 
1.7.10.4
