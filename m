From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 3/8] pinctrl: dt-bindings: Add documentation for
 Aspeed pin controllers
Date: Tue, 23 Aug 2016 12:23:27 -0500
Message-ID: <20160823172327.GA11209@rob-hp-laptop>
References: <20160819124414.24242-1-andrew@aj.id.au>
 <20160819124414.24242-4-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20160819124414.24242-4-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, Aug 19, 2016 at 10:14:09PM +0930, Andrew Jeffery wrote:
> Outline expectations on the pin controller's relationship with the
> System Control Unit (SCU) IP through syscon, and document the compatible
> strings for 4th and 5th generation Aspeed SoC pin controllers.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
> 
> Since v1:
> 
> * Add SoC-specific compatible strings
> * Document available function and group property values
> 
>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> new file mode 100644
> index 000000000000..bfd81be4383b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> @@ -0,0 +1,65 @@
> +Aspeed Pin Controllers
> +----------------------
> +
> +The Aspeed SoCs vary in functionality inside a generation but have a common mux
> +device register layout.
> +
> +Required properties:
> +- compatible : Should be any one of the following:
> +		"aspeed,ast2400-pinctrl"
> +		"aspeed,g4-pinctrl"
> +		"aspeed,ast2500-pinctrl"
> +		"aspeed,g5-pinctrl"
> +
> +The pin controller node should be a child of a syscon node with the required
> +property:
> +- compatible: "syscon", "simple-mfd"
> +
> +Refer to the the bindings described in
> +Documentation/devicetree/bindings/mfd/syscon.txt
> +
> +Subnode Format
> +--------------
> +
> +The required properties of child nodes are (as defined in pinctrl-bindings):
> +- function
> +- groups
> +
> +Each function has only one associated pin group. Each group is named by its
> +function. The following values for the function and groups properties are
> +supported:
> +
> +aspeed,ast2400-pinctrl, aspeed,g4-pinctrl:
> +
> +ACPI BMCINT DDCCLK DDCDAT FLACK FLBUSY FLWP GPID0 GPIE0 GPIE2 GPIE4 GPIE6 I2C10
> +I2C11 I2C12 I2C13 I2C3 I2C4 I2C5 I2C6 I2C7 I2C8 I2C9 LPCPD LPCPME LPCSMI MDIO1
> +MDIO2 NCTS1 NCTS3 NCTS4 NDCD1 NDCD3 NDCD4 NDSR1 NDSR3 NDTR1 NDTR3 NRI1 NRI3
> +NRI4 NRTS1 NRTS3 PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7 RGMII1 RMII1 ROM16
> +ROM8 ROMCS1 ROMCS2 ROMCS3 ROMCS4 RXD1 RXD3 RXD4 SD1 SGPMI SIOPBI SIOPBO TIMER3
> +TIMER5 TIMER6 TIMER7 TIMER8 TXD1 TXD3 TXD4 UART6 VGAHS VGAVS VPI18 VPI24 VPI30
> +VPO12 VPO24
> +
> +aspeed,ast2500-pinctrl, aspeed,g5-pinctrl:
> +
> +GPID0 GPID2 GPIE0 I2C10 I2C11 I2C12 I2C13 I2C14 I2C3 I2C4 I2C5 I2C6 I2C7 I2C8
> +I2C9 MAC1LINK MDIO1 MDIO2 OSCCLK PEWAKE PWM0 PWM1 PWM2 PWM3 PWM4 PWM5 PWM6 PWM7
> +RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 TIMER4 TIMER5 TIMER6 TIMER7 TIMER8
> +
> +Examples:
> +
> +syscon: scu@1e6e2000 {
> +	compatible = "syscon", "simple-mfd";
> +	reg = <0x1e6e2000 0x1a8>;
> +
> +	pinctrl: pinctrl@1e6e2000 {
> +		compatible = "aspeed,g4-pinctrl";
> +

This node needs a reg property or the unit address should be dropped. 
With that:

Acked-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
