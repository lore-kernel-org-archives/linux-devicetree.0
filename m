From: Keerthy <j-keerthy@ti.com>
Subject: [v4 2/2] ARM: dts: keystone-k2g: Add gpio nodes
Date: Fri, 4 Aug 2017 11:15:39 +0530
Message-ID: <1501825539-19110-2-git-send-email-j-keerthy@ti.com>
References: <1501825539-19110-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1501825539-19110-1-git-send-email-j-keerthy@ti.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: ssantosh@kernel.org, linus.walleij@linaro.org, robh+dt@kernel.org
Cc: linux-gpio@vger.kernel.org, j-keerthy@ti.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
List-Id: devicetree@vger.kernel.org

66AK2G has 2 instances of gpio. The first one has all the 144 GPIOs
functional. 9 banks with 16 gpios making a total of 144. The second
instance has only the GPIO0:GPIO67 functional and rest are marked
reserved.

Signed-off-by: Keerthy <j-keerthy@ti.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---

Changes in v4:

  * Couple of rephrasing in the commit log.
  * Changed compatible to ti,k2g-gpio.

Changes in v2:

  * Split the documentation part into a separate patch.

 arch/arm/boot/dts/keystone-k2g.dtsi | 42 +++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/keystone-k2g.dtsi b/arch/arm/boot/dts/keystone-k2g.dtsi
index bf4d1fa..4eb1ba8 100644
--- a/arch/arm/boot/dts/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/keystone-k2g.dtsi
@@ -15,6 +15,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/keystone.h>
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	compatible = "ti,k2g","ti,keystone";
@@ -168,5 +169,46 @@
 				#reset-cells = <2>;
 			};
 		};
+
+		gpio0: gpio@2603000 {
+			compatible = "ti,k2g-gpio", "ti,keystone-gpio";
+			reg = <0x02603000 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+
+			interrupts = <GIC_SPI 432 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 433 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 434 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 435 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 436 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 437 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 438 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 439 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 440 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			ti,ngpio = <144>;
+			ti,davinci-gpio-unbanked = <0>;
+			clocks = <&k2g_clks 0x001b 0x0>;
+			clock-names = "gpio";
+		};
+
+		gpio1: gpio@260a000 {
+			compatible = "ti,k2g-gpio", "ti,keystone-gpio";
+			reg = <0x0260a000 0x100>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupts = <GIC_SPI 442 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 443 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 444 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 445 IRQ_TYPE_EDGE_RISING>,
+					<GIC_SPI 446 IRQ_TYPE_EDGE_RISING>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+			ti,ngpio = <68>;
+			ti,davinci-gpio-unbanked = <0>;
+			clocks = <&k2g_clks 0x001c 0x0>;
+			clock-names = "gpio";
+		};
 	};
 };
-- 
1.9.1
