From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [PATCH v11 4/6] ARM: dts: imx6q-evi: support altera-ps-spi
Date: Fri, 2 Jun 2017 18:30:12 +0200
Message-ID: <a4d0815c-593f-57a9-41fc-ab636ca9b9e5@suse.de>
References: <20170525172911.11467-1-stillcompiling@gmail.com>
 <20170525172911.11467-5-stillcompiling@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170525172911.11467-5-stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Alan Tull <atull-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Moritz Fischer <moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Bastian Stender <bst-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-fpga-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi,

Am 25.05.2017 um 19:29 schrieb Joshua Clayton:
> Add support for Altera V FPGA connected to an spi port

Did you mean "Altera Cyclone V"?

> to the evi devicetree file
> 
> Signed-off-by: Joshua Clayton <stillcompiling-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-evi.dts | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-evi.dts b/arch/arm/boot/dts/imx6q-evi.dts
> index 24fe093a66db..a0cbb2d84803 100644
> --- a/arch/arm/boot/dts/imx6q-evi.dts
> +++ b/arch/arm/boot/dts/imx6q-evi.dts
> @@ -82,6 +82,15 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_ecspi1 &pinctrl_ecspi1cs>;
>  	status = "okay";
> +
> +	fpga_spi: cyclonespi@0 {

"cyclonespi" does not strike me as the best node name.

I am guessing this is a sub-node of a SPI controller node, so no need to
repeat "spi", and Cyclone seems more or less implied by "altr,fpga-".

Note that the example in the bindings doc uses "evi-fpga-spi". Nodes
don't need to be (shouldn't be?) prefixed with the board. Note that
bindings examples tend to get copied a lot.

Any reason not to just use "fpga@0" in both places for simplicity?

> +		compatible = "altr,fpga-passive-serial";
> +		spi-max-frequency = <20000000>;
> +		reg = <0>;
> +		pinctrl-0 = <&pinctrl_fpgaspi>;
> +		nconfig-gpios = <&gpio4 9 GPIO_ACTIVE_LOW>;
> +		nstat-gpios = <&gpio4 11 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &ecspi3 {
[snip]

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
