From: Igor Grinberg <grinberg-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: Re: [PATCH v3 2/2] ARM: dts: utilite-pro: add mmc card slot support
Date: Wed, 15 Jun 2016 09:40:01 +0300
Message-ID: <5760F841.4010307@compulab.co.il>
References: <20160612232456.1621-1-christopher.spinrath@rwth-aachen.de>
 <c25d8e5d113240c5ab78771f301d901a@rwthex-s1-b.rwth-ad.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <c25d8e5d113240c5ab78771f301d901a-gtPewvpZjL8umhiu9RXYRl5UTUQ924AY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org, shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, fabio.estevam-3arQi8VN3Tc@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Christopher,

On 06/13/2016 02:24 AM, christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org wrote:
> From: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> 
> The Utilite Pro has a mmc card slot connected to the usdhc3
> controller. There is no card detection until hardware revision 1.3.
> 
> Add support for it and signal the controller with the broken-cd
> property that polling has to be used to detect a card.
> 
> Signed-off-by: Christopher Spinrath <christopher.spinrath-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>
> Reviewed-by: Fabio Estevam <fabio.estevam-3arQi8VN3Tc@public.gmane.org>
> ---
> 
> Notes:
>     Changes since v2:
>      - add Fabio's Reviewed-By
>     
>     Changes since v1:
>      - enhance commit message to explain to the broken-cd property
> 
>  arch/arm/boot/dts/imx6q-utilite-pro.dts | 44 +++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/imx6q-utilite-pro.dts b/arch/arm/boot/dts/imx6q-utilite-pro.dts
> index 7219745..6199063 100644
> --- a/arch/arm/boot/dts/imx6q-utilite-pro.dts
> +++ b/arch/arm/boot/dts/imx6q-utilite-pro.dts

[...]

> @@ -151,3 +184,14 @@
>  	uart-has-rtscts;
>  	status = "okay";
>  };
> +
> +&usdhc3 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	no-1-8-v;
> +	broken-cd;

A wast majority of boards produced are of revision >=1.3.
Can we please have the default as revision 1.3 with cd?
And let the patch you have submitted to U-Boot do the job
for older revisions?

> +	keep-power-in-suspend;
> +	status = "okay";
> +};
> 

-- 
Regards,
Igor.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
