From: Keerthy <j-keerthy@ti.com>
Subject: [RFC RESEND PATCH v2 1/4] dt-bindings: gpio: davinci: Add k3 am654
 compatible
Date: Thu, 6 Jun 2019 15:26:17 +0530
Message-ID: <20190606095620.6211-2-j-keerthy@ti.com>
References: <20190606095620.6211-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190606095620.6211-1-j-keerthy@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: t-kristo@ti.com, nm@ti.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, lokeshvutla@ti.com, j-keerthy@ti.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The patch adds k3 am654 compatible, specific properties and
an example.

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 .../devicetree/bindings/gpio/gpio-davinci.txt  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
index 553b92a7e87b..bc6b4b62df83 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-davinci.txt
@@ -5,6 +5,7 @@ Required Properties:
 			"ti,keystone-gpio": for Keystone 2 66AK2H/K, 66AK2L,
 						66AK2E SoCs
 			"ti,k2g-gpio", "ti,keystone-gpio": for 66AK2G
+			"ti,am654-gpio", "ti,keystone-gpio": for TI K3 AM654
 
 - reg: Physical base address of the controller and the size of memory mapped
        registers.
@@ -145,3 +146,20 @@ gpio0: gpio@260bf00 {
 	ti,ngpio = <32>;
 	ti,davinci-gpio-unbanked = <32>;
 };
+
+Example for K3 AM654:
+
+wkup_gpio0: wkup_gpio0@42110000 {
+	compatible = "ti,am654-gpio", "ti,keystone-gpio";
+	reg = <0x42110000 0x100>;
+	gpio-controller;
+	#gpio-cells = <2>;
+	interrupt-parent = <&intr_wkup_gpio>;
+	interrupts = <59 128>, <59 129>, <59 130>, <59 131>;
+	interrupt-controller;
+	#interrupt-cells = <2>;
+	ti,ngpio = <56>;
+	ti,davinci-gpio-unbanked = <0>;
+	clocks = <&k3_clks 59 0>;
+	clock-names = "gpio";
+};
-- 
2.17.1
