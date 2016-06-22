From: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Subject: [RESEND PATCH v2 2/4] ARM: dts: rockchip: add i2s nodes for RK322x
 SoCs
Date: Wed, 22 Jun 2016 11:16:51 +0800
Message-ID: <1466565413-31027-3-git-send-email-zhengxing@rock-chips.com>
References: <1466565413-31027-1-git-send-email-zhengxing@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <1466565413-31027-1-git-send-email-zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, radek.dostal-6oiIBCxl0MMjD8S081q9vkEOCMrvLtNR@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

This patch add the i2s dt nodes for rk322x SoCs.

Signed-off-by: Xing Zheng <zhengxing-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
---

Changes in v2: None

 arch/arm/boot/dts/rk322x.dtsi |   55 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/arm/boot/dts/rk322x.dtsi b/arch/arm/boot/dts/rk322x.dtsi
index a68fdcaf..d5626705 100644
--- a/arch/arm/boot/dts/rk322x.dtsi
+++ b/arch/arm/boot/dts/rk322x.dtsi
@@ -237,6 +237,47 @@
 		status = "disabled";
 	};
 
+	i2s1: i2s1@100b0000 {
+		compatible = "rockchip,rk3228-i2s", "rockchip,rk3066-i2s";
+		reg = <0x100b0000 0x4000>;
+		interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		clocks = <&cru SCLK_I2S1>, <&cru HCLK_I2S1_8CH>;
+		dmas = <&pdma 14>, <&pdma 15>;
+		dma-names = "tx", "rx";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s1_bus>;
+		status = "disabled";
+	};
+
+	i2s0: i2s0@100c0000 {
+		compatible = "rockchip,rk3228-i2s", "rockchip,rk3066-i2s";
+		reg = <0x100c0000 0x4000>;
+		interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		clocks = <&cru SCLK_I2S0>, <&cru HCLK_I2S0_8CH>;
+		dmas = <&pdma 11>, <&pdma 12>;
+		dma-names = "tx", "rx";
+		status = "disabled";
+	};
+
+	i2s2: i2s2@100e0000 {
+		compatible = "rockchip,rk3228-i2s", "rockchip,rk3066-i2s";
+		reg = <0x100e0000 0x4000>;
+		interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clock-names = "i2s_clk", "i2s_hclk";
+		clocks = <&cru SCLK_I2S2>, <&cru HCLK_I2S2_2CH>;
+		dmas = <&pdma 0>, <&pdma 1>;
+		dma-names = "tx", "rx";
+		status = "disabled";
+	};
+
 	pwm0: pwm@110b0000 {
 		compatible = "rockchip,rk3288-pwm";
 		reg = <0x110b0000 0x10>;
@@ -507,6 +548,20 @@
 			};
 		};
 
+		i2s1 {
+			i2s1_bus: i2s1-bus {
+				rockchip,pins = <0 8 RK_FUNC_1 &pcfg_pull_none>,
+						<0 9 RK_FUNC_1 &pcfg_pull_none>,
+						<0 11 RK_FUNC_1 &pcfg_pull_none>,
+						<0 12 RK_FUNC_1 &pcfg_pull_none>,
+						<0 13 RK_FUNC_1 &pcfg_pull_none>,
+						<0 14 RK_FUNC_1 &pcfg_pull_none>,
+						<1 2 RK_FUNC_1 &pcfg_pull_none>,
+						<1 4 RK_FUNC_1 &pcfg_pull_none>,
+						<1 5 RK_FUNC_1 &pcfg_pull_none>;
+			};
+		};
+
 		pwm0 {
 			pwm0_pin: pwm0-pin {
 				rockchip,pins = <3 21 RK_FUNC_1 &pcfg_pull_none>;
-- 
1.7.9.5
