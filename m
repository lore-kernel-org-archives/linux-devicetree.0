From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] arm: dts: mt7623: enable all four available UARTs on
 bananapi-r2
Date: Fri, 22 Dec 2017 14:24:48 +0800
Message-ID: <1513923888.30687.7.camel@mtkswgap22>
References: <b4e84a68da76c1ca538150a730777ff530c1db5a.1513922513.git.sean.wang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b4e84a68da76c1ca538150a730777ff530c1db5a.1513922513.git.sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-12-22 at 14:06 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> On bpi-r2 board, totally there're four uarts which we usually called
> uart[0-3] helpful to extend slow I/O devices. Among those ones, uart2 has
> dedicated pin slot which is used to conolse log. uart[0-1] appear at the

Hi, Matthias

Could you help to fix the misspelling "conolse" with "console" when you
merge the patch ?

	Sean

> 40-pins connector and uart3 has no pinout, but just has test points (TP47
> for TX and TP48 for RX, respectively) nearby uart2. Also, some missing
> pinctrl is being complemented for those devices.
> 
> Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>  arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> index 7bf5aa2..64bf5db 100644
> --- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> +++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
> @@ -409,6 +409,20 @@
>  				 <MT7623_PIN_82_UTXD1_FUNC_UTXD1>;
>  		};
>  	};
> +
> +	uart2_pins_a: uart@2 {
> +		pins_dat {
> +			pinmux = <MT7623_PIN_14_GPIO14_FUNC_URXD2>,
> +				 <MT7623_PIN_15_GPIO15_FUNC_UTXD2>;
> +		};
> +	};
> +
> +	uart3_pins_a: uart@3 {
> +		pins_dat {
> +			pinmux = <MT7623_PIN_242_URTS2_FUNC_URTS2>,
> +				 <MT7623_PIN_243_UCTS2_FUNC_UTXD3>;
> +		};
> +	};
>  };
>  
>  &pwm {
> @@ -454,16 +468,24 @@
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_pins_a>;
> -	status = "disabled";
> +	status = "okay";
>  };
>  
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart1_pins_a>;
> -	status = "disabled";
> +	status = "okay";
>  };
>  
>  &uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart2_pins_a>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart3_pins_a>;
>  	status = "okay";
>  };
>  


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
