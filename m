From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 1/4] ARM: dts: imx6dql-nitrogen6x: add touchscreen
 support
Date: Tue, 08 Sep 2015 08:58:03 +0200
Message-ID: <1441695483.3241.5.camel@pengutronix.de>
References: <1441645069-27263-1-git-send-email-gary.bisson@boundarydevices.com>
	 <1441645069-27263-2-git-send-email-gary.bisson@boundarydevices.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441645069-27263-2-git-send-email-gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, troy.kisky-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Gary,

Am Montag, den 07.09.2015, 18:57 +0200 schrieb Gary Bisson:
> This patch adds the different touchscreens that can be connected using
> the displays available for this board.
> http://boundarydevices.com/product-category/displays/
> 
> Signed-off-by: Gary Bisson <gary.bisson-Q5RJGjKts06CY9SHAMCTRUEOCMrvLtNR@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> index ad16dce..ec9da5e 100644
> --- a/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> +++ b/arch/arm/boot/dts/imx6qdl-nitrogen6x.dtsi
> @@ -284,6 +284,22 @@
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_i2c3>;
>  	status = "okay";
> +
> +	egalax_ts@04 {
> +		compatible = "eeti,egalax_ts";
> +		reg = <0x04>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <9 2>;

Please use IRQ_TYPE_EDGE_FALLING here.

> +		wakeup-gpios = <&gpio1 9 0>;

And that would be GPIO_ACTIVE_HIGH. Should this be changed to
GPIO_ACTIVE_LOW instead? From other device tree files and from what the
driver does, it looks as if a wakeup is issued by forcing a falling edge
on the IRQ pin.

> +	};
> +
> +	ft5x06_ts@38 {
> +		compatible = "edt,edt-ft5x06";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <9 2>;

IRQ_TYPE_EDGE_FALLING

> +		wakeup-gpios = <&gpio1 9 0>;

GPIO_ACTIVE_HIGH

> +	};
>  };

best regards
Philipp

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
