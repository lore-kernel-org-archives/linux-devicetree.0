From: Daniel Mack <daniel@zonque.org>
Subject: [PATCH 1/2] ARM: pxa: dts: add gpio-ranges to gpio controller
Date: Tue, 22 May 2018 00:00:43 +0200
Message-ID: <20180521220044.821-1-daniel@zonque.org>
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
To: robert.jarzmik@free.fr, haojian.zhuang@gmail.com
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

The PXA GPIO driver calls out to the pinctrl driver for claiming pins
unless the config has CONFIG_PINCTRL unset. IOW, if a pinctrl driver is
active, it must be visible to the GPIO driver.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 arch/arm/boot/dts/pxa3xx.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/pxa3xx.dtsi b/arch/arm/boot/dts/pxa3xx.dtsi
index 982d1a62661d..a13ac52e4fd2 100644
--- a/arch/arm/boot/dts/pxa3xx.dtsi
+++ b/arch/arm/boot/dts/pxa3xx.dtsi
@@ -148,6 +148,7 @@
 			compatible = "intel,pxa3xx-gpio";
 			reg = <0x40e00000 0x10000>;
 			clocks = <&clks CLK_GPIO>;
+			gpio-ranges = <&pinctrl 0 0 128>;
 			interrupt-names = "gpio0", "gpio1", "gpio_mux";
 			interrupts = <8 9 10>;
 			gpio-controller;
-- 
2.14.3
