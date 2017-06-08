From: Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v5 04/20] ARM: dts: turris-omnia: Add generic compatible string for I2C EEPROM
Date: Thu, 08 Jun 2017 19:04:45 +0200
Message-ID: <87tw3qpg0i.fsf@free-electrons.com>
References: <20170523133448.4794-1-javier@dowhile0.org>
        <20170523133448.4794-5-javier@dowhile0.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170523133448.4794-5-javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> (Javier Martinez
        Canillas's message of "Tue, 23 May 2017 15:34:32 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Javier,
 
 On mar., mai 23 2017, Javier Martinez Canillas <javier-0uQlZySMnqxg9hUCZPvPmw@public.gmane.org> wrote:

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

Applied on mvebu/dt

Thanks,

Gregory

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
>  arch/arm/boot/dts/armada-385-turris-omnia.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/armada-385-turris-omnia.dts b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> index 28eede180e4f..be16ce39fb3d 100644
> --- a/arch/arm/boot/dts/armada-385-turris-omnia.dts
> +++ b/arch/arm/boot/dts/armada-385-turris-omnia.dts
> @@ -171,7 +171,7 @@
>  			/* leds device (in STM32F0) at address 0x2b */
>  
>  			eeprom@54 {
> -				compatible = "at,24c64";
> +				compatible = "atmel,24c64";
>  				reg = <0x54>;
>  
>  				/* The EEPROM contains data for bootloader.
> -- 
> 2.9.3
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
