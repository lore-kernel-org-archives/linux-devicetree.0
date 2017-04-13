From: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
Subject: Re: [PATCH v2 05/22] ARM: dts: at91: Add generic compatible string
 for I2C EEPROM
Date: Thu, 13 Apr 2017 22:43:25 +0200
Message-ID: <869a0f44-6c97-2109-776b-6da9b86c732a@axentia.se>
References: <20170413182839.25381-1-javier@osg.samsung.com>
 <20170413182839.25381-6-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170413182839.25381-6-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-UWL1GkI3JZL3oGB3hsPCZA@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 2017-04-13 20:28, Javier Martinez Canillas wrote:
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
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/at91-linea.dtsi   | 2 +-
>  arch/arm/boot/dts/at91-tse850-3.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/at91-linea.dtsi b/arch/arm/boot/dts/at91-linea.dtsi
> index 0721c8472509..9a19080fd3bf 100644
> --- a/arch/arm/boot/dts/at91-linea.dtsi
> +++ b/arch/arm/boot/dts/at91-linea.dtsi
> @@ -31,7 +31,7 @@
>  	status = "okay";
>  
>  	eeprom@51 {
> -		compatible = "st,24c64";
> +		compatible = "st,24c64","atmel,24c64";
>  		reg = <0x51>;
>  		pagesize = <32>;
>  	};
> diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
> index 7a68805a4eb5..6f005c14a6b0 100644
> --- a/arch/arm/boot/dts/at91-tse850-3.dts
> +++ b/arch/arm/boot/dts/at91-tse850-3.dts
> @@ -239,7 +239,7 @@
>  	};
>  
>  	eeprom@50 {
> -		compatible = "nxp,24c02";
> +		compatible = "nxp,24c02","atmel,24c02";
>  		reg = <0x50>;
>  		pagesize = <16>;
>  	};
> 

Sure, in principle. But not having a space after the commas is a real OCD
trigger for me. My spine is rotating... :-)

Anyway, with those whitespace fixes (and without them too, but please):
Acked-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>

Cheers,
peda


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
