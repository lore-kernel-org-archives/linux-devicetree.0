From: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v3 1/4] pinctrl: aspeed: Read and write bits in LPC and
 GFX controllers
Date: Mon, 12 Dec 2016 10:27:12 -0600
Message-ID: <20161212162712.u2uypxkqhh6cinsp@rob-hp-laptop>
References: <20161206031152.3004-1-andrew@aj.id.au>
 <20161206031152.3004-2-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161206031152.3004-2-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, Dec 06, 2016 at 02:11:49PM +1100, Andrew Jeffery wrote:
> The System Control Unit IP block in the Aspeed SoCs is typically where
> the pinmux configuration is found, but not always. A number of pins
> depend on state in one of LPC Host Control (LHC) or SoC Display
> Controller (GFX) IP blocks, so the Aspeed pinmux drivers should have the
> means to adjust these as necessary.
> 
> We use syscon to cast a regmap over the GFX and LPC blocks, which is
> used as an arbitration layer between the relevant driver and the pinctrl
> subsystem. The regmaps are then exposed to the SoC-specific pinctrl
> drivers by phandles in the devicetree, and are selected during a mux
> request by querying a new 'ip' member in struct aspeed_sig_desc.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> ---
>  .../devicetree/bindings/pinctrl/pinctrl-aspeed.txt |  50 ++++++-
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g4.c         |  18 +--
>  drivers/pinctrl/aspeed/pinctrl-aspeed-g5.c         |  48 ++++--
>  drivers/pinctrl/aspeed/pinctrl-aspeed.c            | 161 +++++++++++++--------
>  drivers/pinctrl/aspeed/pinctrl-aspeed.h            |  32 ++--
>  5 files changed, 214 insertions(+), 95 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> index 2ad18c4ea55c..115b0cce6c1c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-aspeed.txt
> @@ -4,12 +4,19 @@ Aspeed Pin Controllers
>  The Aspeed SoCs vary in functionality inside a generation but have a common mux
>  device register layout.
>  
> -Required properties:
> -- compatible : Should be any one of the following:
> -		"aspeed,ast2400-pinctrl"
> -		"aspeed,g4-pinctrl"
> -		"aspeed,ast2500-pinctrl"
> -		"aspeed,g5-pinctrl"
> +Required properties for g4:
> +- compatible : 			Should be any one of the following:
> +				"aspeed,ast2400-pinctrl"
> +				"aspeed,g4-pinctrl"
> +
> +Required properties for g5:
> +- compatible : 			Should be any one of the following:
> +				"aspeed,ast2500-pinctrl"
> +				"aspeed,g5-pinctrl"
> +
> +- aspeed,external-nodes:	A cell of phandles to external controller nodes:
> +				0: compatible with "aspeed,ast2500-gfx", "syscon"
> +				1: compatible with "aspeed,ast2500-lpchc", "syscon"
>  
>  The pin controller node should be a child of a syscon node with the required
>  property:
> @@ -47,7 +54,7 @@ RGMII1 RGMII2 RMII1 RMII2 SD1 SPI1 SPI1DEBUG SPI1PASSTHRU TIMER4 TIMER5 TIMER6
>  TIMER7 TIMER8 VGABIOSROM
>  
>  
> -Examples:
> +g4 Example:
>  
>  syscon: scu@1e6e2000 {
>  	compatible = "syscon", "simple-mfd";
> @@ -63,5 +70,34 @@ syscon: scu@1e6e2000 {
>  	};
>  };
>  
> +g5 Example:
> +
> +apb {
> +	gfx: display@1e6e6000 {
> +		compatible = "aspeed,ast2500-gfx", "syscon";
> +		reg = <0x1e6e6000 0x1000>;
> +	};
> +
> +	lpchc: lpchc@1e7890a0 {
> +		compatible = "aspeed,ast2500-lpchc", "syscon";
> +		reg = <0x1e7890a0 0xc4>;
> +	};
> +
> +	syscon: scu@1e6e2000 {
> +		compatible = "syscon", "simple-mfd";

I must have missed this the first time, but "syscon" should be used with 
a specific compatible. Though, the scu binding does define one.

> +		reg = <0x1e6e2000 0x1a8>;
> +
> +		pinctrl: pinctrl {

Is this the only child? 

> +			compatible = "aspeed,g5-pinctrl";

There's no register range for pinctrl?

> +			aspeed,external-nodes = <&gfx, &lpchc>;
> +
> +			pinctrl_i2c3_default: i2c3_default {
> +				function = "I2C3";
> +				groups = "I2C3";
> +			};
> +		};
> +	};
> +};
> +
>  Please refer to pinctrl-bindings.txt in this directory for details of the
>  common pinctrl bindings used by client devices.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
