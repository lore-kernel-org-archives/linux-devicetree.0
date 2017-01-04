From: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] mfd: dt: Add bindings for the Aspeed LPC Host
 Controller (LHC)
Date: Wed, 4 Jan 2017 11:36:34 +0000
Message-ID: <20170104113634.GE27589@dell>
References: <20161220071535.27542-1-andrew@aj.id.au>
 <20161220071535.27542-5-andrew@aj.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161220071535.27542-5-andrew-zrmu5oMJ5Fs@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Corey Minyard <minyard-HInyCGIudOg@public.gmane.org>, =?iso-8859-1?Q?C=E9dric?= Le Goater <clg-Bxea+6Xhats@public.gmane.org>, Joel Stanley <joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 20 Dec 2016, Andrew Jeffery wrote:

> The LPC bus pinmux configuration on fifth generation Aspeed SoCs depends
> on bits in both the System Control Unit and the LPC Host Controller.
> 
> The Aspeed LPC Host Controller is described as a child node of the
> LPC host-range syscon device for arbitration of access by the host
> controller and pinmux drivers.
> 
> Signed-off-by: Andrew Jeffery <andrew-zrmu5oMJ5Fs@public.gmane.org>
> Reviewed-by: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
> ---
> 
> Linus: I've retained your r-b tag I don't think the addition of the ast2400
> compatible string will fuss you. Please let me know if you feel this is
> inappropriate.
> 
>  .../devicetree/bindings/mfd/aspeed-lpc.txt         | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)

Applied, thanks.

> diff --git a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> index a97131aba446..514d82ced95b 100644
> --- a/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> +++ b/Documentation/devicetree/bindings/mfd/aspeed-lpc.txt
> @@ -109,3 +109,29 @@ lpc: lpc@1e789000 {
>  	};
>  };
>  
> +Host Node Children
> +==================
> +
> +LPC Host Controller
> +-------------------
> +
> +The Aspeed LPC Host Controller configures the Low Pin Count (LPC) bus behaviour
> +between the host and the baseboard management controller. The registers exist
> +in the "host" portion of the Aspeed LPC controller, which must be the parent of
> +the LPC host controller node.
> +
> +Required properties:
> +
> +- compatible:	One of:
> +		"aspeed,ast2400-lhc";
> +		"aspeed,ast2500-lhc";
> +
> +- reg:		contains offset/length values of the LHC memory regions. In the
> +		AST2400 and AST2500 there are two regions.
> +
> +Example:
> +
> +lhc: lhc@20 {
> +	compatible = "aspeed,ast2500-lhc";
> +	reg = <0x20 0x24 0x48 0x8>;
> +};

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
