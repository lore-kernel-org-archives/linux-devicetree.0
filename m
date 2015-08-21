From: maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Subject: Re: [PATCH]  ARM: dts: vfxxx: Add iio_hwmon node for ADC temperature
 channel
Date: Fri, 21 Aug 2015 17:41:44 +0530
Message-ID: <20150821121144.GE2233@Sanchayan-Arch.toradex.int>
References: <b639ca620369d196491a4af8739b87d580e71bf6.1438876380.git.maitysanchayan@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <b639ca620369d196491a4af8739b87d580e71bf6.1438876380.git.maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: stefan-XLVq0VzYD2Y@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Ping?

- Sanchayan.

On 15-08-06 21:28:22, Sanchayan Maity wrote:
> Add iio_hwmon node to expose the temperature channel on Vybrid
> as hardware monitor device using the iio_hwmon driver.
> 
> Signed-off-by: Sanchayan Maity <maitysanchayan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  arch/arm/boot/dts/vfxxx.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/vfxxx.dtsi b/arch/arm/boot/dts/vfxxx.dtsi
> index 39173bb..0993d66 100644
> --- a/arch/arm/boot/dts/vfxxx.dtsi
> +++ b/arch/arm/boot/dts/vfxxx.dtsi
> @@ -597,5 +597,10 @@
>  				status = "disabled";
>  			};
>  		};
> +
> +		iio_hwmon {
> +			compatible = "iio-hwmon";
> +			io-channels = <&adc0 16>;
> +		};
>  	};
>  };
> -- 
> 2.5.0
> 
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
