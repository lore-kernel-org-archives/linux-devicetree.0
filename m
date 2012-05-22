From: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 10/12] ARM: dts: imx6q-sabrelite: add usb devices
Date: Tue, 22 May 2012 13:10:08 +0800
Message-ID: <20120522051005.GN8140@S2101-09.ap.freescale.net>
References: <1337592237-5090-1-git-send-email-richard.zhao@freescale.com>
 <1337592237-5090-11-git-send-email-richard.zhao@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1337592237-5090-11-git-send-email-richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, B29397-KZfg59tc24xl57MIdRCFDg@public.gmane.org, B20596-KZfg59tc24xl57MIdRCFDg@public.gmane.org, marex-ynQEQJNshbs@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, fabio.estevam-KZfg59tc24xl57MIdRCFDg@public.gmane.org, dong.aisheng-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, linuxzsc-MeMPY/F8WlbQT0dZR+AlfA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, May 21, 2012 at 05:23:55PM +0800, Richard Zhao wrote:
> Signed-off-by: Richard Zhao <richard.zhao-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
> ---
>  arch/arm/boot/dts/imx6q-sabrelite.dts |   18 ++++++++++++-
>  arch/arm/boot/dts/imx6q.dtsi          |   44 +++++++++++++++++++++++++++++++-
>  2 files changed, 59 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/imx6q-sabrelite.dts b/arch/arm/boot/dts/imx6q-sabrelite.dts
> index 1dd2261..1d28957 100644
> --- a/arch/arm/boot/dts/imx6q-sabrelite.dts
> +++ b/arch/arm/boot/dts/imx6q-sabrelite.dts
> @@ -48,10 +48,26 @@
>  					status = "okay";
>  				};
>  			};
> -
> +			iomuxc@020e0000 {
> +				gpios {
> +					pinctrl_gpio_hog: gpiohog {

This isn't really welcomed, and should really be removed after we have
gpio_request() be able to call pinctrl to set the mux.

> +						fsl,pins = <1044 0x80000000
> +							   144  0x80000000>;	/* MX6Q_PAD_GPIO_17__GPIO_7_12 */

Here are what I get from fsl,imx6q-pinctrl.txt.  The comment was put on
the wrong line?

MX6Q_PAD_EIM_D22__GPIO_3_22                     144
MX6Q_PAD_GPIO_17__GPIO_7_12                     1044 

> +					};
> +				};
> +			};
>  		};
>  
...

> @@ -495,6 +500,11 @@
>  					};
>  				};
>  
> +				gpios {
> +					pinctrl_gpio_hog: gpiohog {
> +					};
> +				};
> +
Why the empty nodes?

-- 
Regards,
Shawn
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
