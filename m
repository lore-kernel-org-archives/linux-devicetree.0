From: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RESEND PATCH v5 10/16] ARM: dts: zynq: Add generic compatible
 string for I2C EEPROM
Date: Wed, 21 Jun 2017 13:43:10 +0200
Message-ID: <b22a7db6-7daf-b5c1-3978-cdc699723e30@xilinx.com>
References: <20170615185418.13980-1-javier@dowhile0.org>
 <20170615185418.13980-11-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170615185418.13980-11-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, =?UTF-8?Q?S=c3=b6ren_Brinkmann?= <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 15.6.2017 20:54, Javier Martinez Canillas wrote:
> The at24 driver allows to register I2C EEPROM chips using different vendor
> and devices, but the I2C subsystem does not take the vendor into account
> when matching using the I2C table since it only has device entries.
> 
> But when matching using an OF table, both the vendor and device has to be
> taken into account so the driver defines only a set of compatible strings
> using the "atmel" vendor as a generic fallback for compatible I2C devices.
> 
> So add this generic fallback to the device node compatible string to make
> the device to match the driver using the OF device ID table.
> 
> Signed-off-by: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
> 
> ---
> 
> Changes in v5: None
> Changes in v4:
> - Only use the atmel manufacturer in the compatible string instead of
>   keeping the deprecated ones (Rob Herring).
> 
> Changes in v3: None
> Changes in v2: None
> 
>  arch/arm/boot/dts/zynq-zc702.dts | 2 +-
>  arch/arm/boot/dts/zynq-zc706.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/zynq-zc702.dts b/arch/arm/boot/dts/zynq-zc702.dts
> index 0cdad2cc8b78..f8c840f7118f 100644
> --- a/arch/arm/boot/dts/zynq-zc702.dts
> +++ b/arch/arm/boot/dts/zynq-zc702.dts
> @@ -136,7 +136,7 @@
>  			#size-cells = <0>;
>  			reg = <2>;
>  			eeprom@54 {
> -				compatible = "at,24c08";
> +				compatible = "atmel,24c08";
>  				reg = <0x54>;
>  			};
>  		};
> diff --git a/arch/arm/boot/dts/zynq-zc706.dts b/arch/arm/boot/dts/zynq-zc706.dts
> index ad4bb06dba25..76492be4a912 100644
> --- a/arch/arm/boot/dts/zynq-zc706.dts
> +++ b/arch/arm/boot/dts/zynq-zc706.dts
> @@ -92,7 +92,7 @@
>  			#size-cells = <0>;
>  			reg = <2>;
>  			eeprom@54 {
> -				compatible = "at,24c08";
> +				compatible = "atmel,24c08";
>  				reg = <0x54>;
>  			};
>  		};
> 

Acked-by: Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Thanks,
Michal
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
