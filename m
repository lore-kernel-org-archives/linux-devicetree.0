From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 3/6] gpio: dt-bindings: Add documentation for gpio
 controllers on Armada 7K/8K
Date: Tue, 30 May 2017 17:29:07 -0500
Message-ID: <20170530222907.ysx53p3efyxudyqp@rob-hp-laptop>
References: <cover.e10718b9c0f9fdd07327ae14e213be8da5b1f7ef.1495210061.git-series.gregory.clement@free-electrons.com>
 <306395ff39de3d3d3c8f55e5da4de8def29ae8d1.1495210061.git-series.gregory.clement@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <306395ff39de3d3d3c8f55e5da4de8def29ae8d1.1495210061.git-series.gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <rmk+kernel-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Nadav Haklai <nadavh-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Kostya Porotchkin <kostap-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Neta Zur Hershkovits <neta-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Marcin Wojtas <mw-nYOzD4b6Jr9Wk0Htik3J/w@public.gmane.org>, Omri Itach <omrii-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Shadi Ammouri <shadi-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, May 19, 2017 at 06:09:22PM +0200, Gregory CLEMENT wrote:
> Document the device tree binding for the gpio controllers found on the
> Marvell Armada 7K and Armada 8K SoCs.
> 
> Signed-off-by: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt  | 20 ++++++++++++++++++++
>  Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt | 24 +++++++++++++++++++++++-
>  Documentation/devicetree/bindings/gpio/gpio-mvebu.txt                      | 24 +++++++++++++++++-------
>  3 files changed, 60 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> index 4228d158fb31..0b887440e08a 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> @@ -64,6 +64,17 @@ mpp17	17	gpio
>  mpp18	18	gpio
>  mpp19	19	gpio, uart0(rxd), sdio(pw_off)
>  
> +GPIO:
> +-----
> +For common binding part and usage, refer to
> +Documentation/devicetree/bindings/gpio/gpio-mvebu.txt.
> +
> +Required properties:
> +
> +- compatible: "marvell,armada-8k-gpio"
> +
> +- offset: offset address inside the syscon block
> +
>  Example:
>  ap_syscon: system-controller@6f4000 {
>  	compatible = "syscon", "simple-mfd";
> @@ -77,4 +88,13 @@ ap_syscon: system-controller@6f4000 {
>  	ap_pinctrl: pinctrl {
>  		compatible = "marvell,ap806-pinctrl";
>  	};
> +
> +	ap_gpio: gpio {
> +		compatible = "marvell,armada-8k-gpio";
> +		offset = <0x1040>;
> +		ngpios = <19>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&ap_pinctrl 0 0 19>;
> +	};
>  };
> diff --git a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
> index 733beac7724e..655c114ef584 100644
> --- a/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
> +++ b/Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
> @@ -149,6 +149,18 @@ mpp60	60	gpio, mss_gpio6, ptp(pulse), tdm(dtx), au(i2smclk), spi0(csn1), uart0(r
>  mpp61	61	gpio, mss_gpio5, ptp(clk), tdm(pclk), au(i2sextclk), spi0(csn2), uart0(txd), uart2(txd), sata1(present_act), ge(mdio), sdio(d3)
>  mpp62	62	gpio, mss_gpio4, synce1(clk), ptp(pclk_out), sata1(present_act), spi0(csn3), uart0(rxd), uart2(rxd), sata0(present_act), ge(mdc)
>  
> +GPIO:
> +-----
> +
> +For common binding part and usage, refer to
> +Documentation/devicetree/bindings/gpio/gpio-mvebu.txt.
> +
> +Required properties:
> +
> +- compatible: "marvell,armada-8k-gpio"
> +
> +- offset: offset address inside the syscon block
> +
>  Example:
>  
>  cpm_syscon0: system-controller@440000 {
> @@ -163,5 +175,15 @@ cpm_syscon0: system-controller@440000 {
>  	cpm_pinctrl: pinctrl {
>  		compatible = "marvell,armada-8k-cpm-pinctrl";
>  	};
> -};
>  
> +	cpm_gpio1: gpio@100 {
> +		compatible = "marvell,armada-8k-gpio";
> +		offset = <0x100>;
> +		ngpios = <32>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		gpio-ranges = <&cpm_pinctrl 0 0 32>;
> +		status = "disabled";
> +	};
> +
> +};
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt b/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
> index 42c3bb2d53e8..2c5304ff467c 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
> +++ b/Documentation/devicetree/bindings/gpio/gpio-mvebu.txt
> @@ -2,17 +2,27 @@
>  
>  Required properties:
>  
> -- compatible : Should be "marvell,orion-gpio", "marvell,mv78200-gpio"
> -  or "marvell,armadaxp-gpio". "marvell,orion-gpio" should be used for
> -  Orion, Kirkwood, Dove, Discovery (except MV78200) and Armada
> -  370. "marvell,mv78200-gpio" should be used for the Discovery
> -  MV78200. "marvel,armadaxp-gpio" should be used for all Armada XP
> -  SoCs (MV78230, MV78260, MV78460).
> +- compatible : Should be "marvell,orion-gpio", "marvell,mv78200-gpio",
> +  "marvell,armadaxp-gpio" or "marvell,armada-8k-gpio".
> +
> +    "marvell,orion-gpio" should be used for Orion, Kirkwood, Dove,
> +    Discovery (except MV78200) and Armada 370. "marvell,mv78200-gpio"
> +    should be used for the Discovery MV78200.
> +
> +    "marvel,armadaxp-gpio" should be used for all Armada XP SoCs
> +    (MV78230, MV78260, MV78460).
> +
> +    "marvell,armada-8k-gpio" should be used for the Armada 7K and 8K
> +    SoCs (either from AP or CP), see
> +    Documentation/devicetree/bindings/arm/marvell/cp110-system-controller0.txt
> +    and
> +    Documentation/devicetree/bindings/arm/marvell/ap806-system-controller.txt
> +    for specific details about the offset property.
>  
>  - reg: Address and length of the register set for the device. Only one
>    entry is expected, except for the "marvell,armadaxp-gpio" variant
>    for which two entries are expected: one for the general registers,
> -  one for the per-cpu registers.
> +  one for the per-cpu registers. Not used for marvell,armada-8k-gpio.

Why can't use you use reg instead of offset?

Rob
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
