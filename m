From: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Subject: [PATCH] pinctrl: dt: at91: new binding
Date: Thu, 26 Feb 2015 10:34:54 +0100
Message-ID: <1424943294-8805-1-git-send-email-plagnioj@jcrosoft.com>
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
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
List-Id: devicetree@vger.kernel.org

Today if we want to disable a pio bank we may will siliently break pinctrl
configuration in the DT. This will be detected only at runtime.

So move the pinctrl configuration to the bank instead of the bus.
This allow to detect pinctrl issue at DT compiling time when disable a bank.

Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org
---
 .../bindings/pinctrl/atmel,at91-pinctrl.txt        | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
index b7a93e8..78355ee 100644
--- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
+++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
@@ -148,3 +148,69 @@ dbgu: serial@fffff200 {
 	pinctrl-0 = <&pinctrl_dbgu>;
 	status = "disabled";
 };
+
+II) New Bindings per PIO Block
+
+This allow to detect pinctrl issue at DT compiling time when disable a bank
+
+Required properties for iomux controller:
+- compatible: "atmel,at91rm9200-pio-pinctrl" or "atmel,at91sam9x5-pio-pinctrl"
+		or "atmel,sama5d3-pio-pinctrl"
+- atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
+  configured in this periph mode. All the periph and bank need to be describe.
+
+How to create such array:
+
+Each column will represent the possible peripheral of the pinctrl for the bank
+
+Take an example on the 9260
+Peripheral: 2 ( A and B)
+=>
+
+  /*    A         B     */
+  0xffffffff 0xffc00c3b  /* pioA */
+
+For each peripheral/bank we will descibe in a u32 if a pin can be
+configured in it by putting 1 to the pin bit (1 << pin)
+
+Required properties for pin configuration node:
+- atmel,pins: 3 integers array, represents a group of pins mux and config
+  setting. The format is atmel,pins = <PIN_NUM PERIPH CONFIG>.
+  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph B...
+
+Bits used for CONFIG:
+cf atmel,at91-pinctrl
+
+pioB: gpio@fffff600 {
+	compatible = "atmel,at91rm9200-gpio", "atmel,at91rm9200-pio-pinctrl";
+	reg = <0xfffff600 0x200>;
+	interrupts = <3 IRQ_TYPE_LEVEL_HIGH 1>;
+	#gpio-cells = <2>;
+	gpio-controller;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	clocks = <&pioB_clk>;
+
+			 /*    A         B     */
+	atmel,mux-mask = <0xffffffff 0x7fff3ccf>;
+
+	dbgu {
+		pinctrl_dbgu: dbgu-0 {
+			atmel,pins =
+				<14 0x1 0x0	/* PB14 periph A */
+				 15 0x1 0x1>;	/* PB15 periph A with pullup */
+		};
+	};
+};
+
+dbgu: serial@fffff200 {
+	compatible = "atmel,at91sam9260-usart";
+	reg = <0xfffff200 0x200>;
+	interrupts = <1 4 7>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_dbgu>;
+	status = "disabled";
+};
+
+if you have to use multiple bank
+	pinctrl-0 = <&pinctrl_ip_piaa>, <&pinctrl_ip_piab>;
-- 
2.1.4
