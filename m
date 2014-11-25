From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 2/8] irqchip: Supply new driver for STi based devices
Date: Tue, 25 Nov 2014 21:57:07 +0100
Message-ID: <2433040.4NqTrOMmEE@wuerfel>
References: <1416932705-16880-1-git-send-email-lee.jones@linaro.org> <1416932705-16880-3-git-send-email-lee.jones@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1416932705-16880-3-git-send-email-lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, kernel-F5mvAk5X5gdBDgjK7y7TUQ@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tuesday 25 November 2014 16:24:59 Lee Jones wrote:

> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index b21f12f..e502f15 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -93,6 +93,13 @@ config RENESAS_IRQC
>  	bool
>  	select IRQ_DOMAIN
>  
> +config ST_IRQCHIP
> +	bool
> +	select REGMAP
> +	select MFD_SYSCON
> +	help
> +	  Enables SysCfg Controlled IRQs on STi based platforms.
> +

I'm confused by the purpose of this code. It's apparently a driver
in drivers/irqchip, the Kconfig symbol contains the string IRQCHIP,
yet it doesn't actually register an irq_chip.

Also, the name is a bit too generic, ST has lots of different irqchips,
and this apparently isn't even one of them ;-)

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
