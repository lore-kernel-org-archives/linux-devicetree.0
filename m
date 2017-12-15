From: Kevin Hilman <khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 1/2] ARM64: dts: meson-axg: add ethernet mac controller
Date: Fri, 15 Dec 2017 11:29:31 -0800
Message-ID: <7ho9mz94dg.fsf@baylibre.com>
References: <20171215021014.231308-1-yixun.lan@amlogic.com>
        <20171215021014.231308-2-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171215021014.231308-2-yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> (Yixun Lan's
        message of "Fri, 15 Dec 2017 10:10:13 +0800")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Jerome Brunet <jbrunet-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Giuseppe Cavallaro <peppe.cavallaro-qxv4g6HH51o@public.gmane.org>, Alexandre Torgue <alexandre.torgue-qxv4g6HH51o@public.gmane.org>, Carlo Caione <carlo-KA+7E9HrN00dnm+yROfE0A@public.gmane.org>, linux-amlogic-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org> writes:

> Add DT info for the stmmac ethernet MAC which found in
> the Amlogic's Meson-AXG SoC, also describe the ethernet
> pinctrl & clock information here.
>
> Reviewed-by: Neil Armstrong <narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
> Signed-off-by: Yixun Lan <yixun.lan-LpR1jeaWuhtBDgjK7y7TUQ@public.gmane.org>

This patch does not apply, and dependencies are not described.

> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 54 ++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index d356ce74ad89..94c4972222b7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/axg-clkc.h>
>  
>  / {
>  	compatible = "amlogic,meson-axg";
> @@ -148,6 +149,19 @@
>  			#address-cells = <0>;
>  		};
>  
> +		ethmac: ethernet@ff3f0000 {
> +			compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
> +			reg = <0x0 0xff3f0000 0x0 0x10000
> +				0x0 0xff634540 0x0 0x8>;
> +			interrupts = <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "macirq";
> +			clocks = <&clkc CLKID_ETH>,
> +				 <&clkc CLKID_FCLK_DIV2>,
> +				 <&clkc CLKID_MPLL2>;
> +			clock-names = "stmmaceth", "clkin0", "clkin1";
> +			status = "disabled";
> +		};
> +
>  		hiubus: bus@ff63c000 {
>  			compatible = "simple-bus";
>  			reg = <0x0 0xff63c000 0x0 0x1c00>;

Based on the hiubus node, presumably this depends on the patch from the
clock series.

> @@ -194,6 +208,46 @@
>  					#gpio-cells = <2>;
>  					gpio-ranges = <&pinctrl_periphs 0 0 86>;
>  				};

I'm not sure where this part is coming from, but it causes the rest of
it to not apply.

Please be sure to describe all dependencies.

Kevin

> +
> +				eth_rgmii_x_pins: eth-x-rgmii {
> +					mux {
> +						groups = "eth_mdio_x",
> +						       "eth_mdc_x",
> +						       "eth_rgmii_rx_clk_x",
> +						       "eth_rx_dv_x",
> +						       "eth_rxd0_x",
> +						       "eth_rxd1_x",
> +						       "eth_rxd2_rgmii",
> +						       "eth_rxd3_rgmii",
> +						       "eth_rgmii_tx_clk",
> +						       "eth_txen_x",
> +						       "eth_txd0_x",
> +						       "eth_txd1_x",
> +						       "eth_txd2_rgmii",
> +						       "eth_txd3_rgmii";
> +						function = "eth";
> +					};
> +				};
> +
> +				eth_rgmii_y_pins: eth-y-rgmii {
> +					mux {
> +						groups = "eth_mdio_y",
> +						       "eth_mdc_y",
> +						       "eth_rgmii_rx_clk_y",
> +						       "eth_rx_dv_y",
> +						       "eth_rxd0_y",
> +						       "eth_rxd1_y",
> +						       "eth_rxd2_rgmii",
> +						       "eth_rxd3_rgmii",
> +						       "eth_rgmii_tx_clk",
> +						       "eth_txen_y",
> +						       "eth_txd0_y",
> +						       "eth_txd1_y",
> +						       "eth_txd2_rgmii",
> +						       "eth_txd3_rgmii";
> +						function = "eth";
> +					};
> +				};
>  			};
>  		};
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
