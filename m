From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: vf610-zii-dev-rev-b: add hi8435 device
Date: Thu, 25 May 2017 15:00:09 +0800
Message-ID: <20170525070007.GU26102@dragon>
References: <20170522131010.3537-1-nikita.yoush@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170522131010.3537-1-nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chris Healy <Chris.Healy-c8ZVq/bFV1I@public.gmane.org>, Jeff White <Jeff.White-c8ZVq/bFV1I@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, May 22, 2017 at 04:10:10PM +0300, Nikita Yushchenko wrote:
> ZII dev board rev B has a Holt Hi8435 connected to dspi2.
> Add it to device tree.
> 
> ZII dev board rev C does not have that, so use rev-b dts file,
> not common dtsi file.
> 
> Signed-off-by: Nikita Yushchenko <nikita.yoush-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
> ---
>  arch/arm/boot/dts/vf610-zii-dev-rev-b.dts | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> index 37f95427616f..f433465c3a7c 100644
> --- a/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> +++ b/arch/arm/boot/dts/vf610-zii-dev-rev-b.dts
> @@ -348,6 +348,25 @@
>  	};
>  };
>  
> +&edma1 {
> +	status = "okay";
> +};
> +
> +&dspi2 {

Please keep these labelled nodes sort alphabetically.

> +	bus-num = <1>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_dspi2>;
> +	status = "okay";

We usually have 'status' line at the bottom of property list.

> +	spi-num-chipselects = <2>;
> +
> +	hi8435@1 {

Node name should be something generic, while label can be specific
model name.  The following form might be better.

	hi8435: sensor@1

Shawn

> +		compatible = "holt,hi8435";
> +		reg = <1>;
> +		spi-max-frequency = <20000000>;
> +		gpios = <&gpio5 3 0>;
> +	};
> +};
> +
>  &i2c0 {
>  	clock-frequency = <100000>;
>  	pinctrl-names = "default";
> -- 
> 2.11.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
