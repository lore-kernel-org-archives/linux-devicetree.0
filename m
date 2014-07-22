From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v8 02/11] power: reset: Add reboot driver for brcmstb
Date: Tue, 22 Jul 2014 23:02:07 +0200
Message-ID: <5224854.YNJjMxFltp@wuerfel>
References: <1405976886-27807-1-git-send-email-computersforpeace@gmail.com> <62122849.RXJHvac7Iy@wuerfel> <20140722200213.GF28323@ld-irv-0074>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140722200213.GF28323@ld-irv-0074>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Florian Fainelli <f.fainelli-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Dmitry Eremin-Solenikov <dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Christian Daudt <bcm-xK7y4jjYLqYh9ZMKESR00Q@public.gmane.org>, Linux Kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Matt Porter <mporter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Marc Carino <marc.ceeeee-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Gregory Fong <gregory.0xf0-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tuesday 22 July 2014 13:02:13 Brian Norris wrote:
> How about a third option, where we drop the 'select' statement and
> set POWER_RESET_BRCMSTB to be 'default y'? Then we don't have to modify
> the defconfig, and it gives the added bonus of choosing a sane default
> even if you're not based on the multi_v7_defconfig. i.e.:
> 
> diff --git a/arch/arm/mach-bcm/Kconfig b/arch/arm/mach-bcm/Kconfig
> index 58c01aed9752..634de7b7fd28 100644
> --- a/arch/arm/mach-bcm/Kconfig
> +++ b/arch/arm/mach-bcm/Kconfig
> @@ -94,7 +94,6 @@ config ARCH_BRCMSTB
>         select MIGHT_HAVE_PCI
>         select HAVE_SMP
>         select HAVE_ARM_ARCH_TIMER
> -       select POWER_RESET_BRCMSTB
>         select BRCMSTB_GISB_ARB
>         select BRCMSTB_L2_IRQ
>         help
> diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
> index fcb9825debe5..ab5d57e2766d 100644
> --- a/drivers/power/reset/Kconfig
> +++ b/drivers/power/reset/Kconfig
> @@ -23,6 +23,7 @@ config POWER_RESET_AXXIA
>  config POWER_RESET_BRCMSTB
>         bool "Broadcom STB reset driver"
>         depends on POWER_RESET && ARCH_BRCMSTB
> +       default y
>         help
>           This driver provides restart support for ARM-based Broadcom STB
>           boards.

I don't like this too much. Why do you want to allow disabling the
driver if you make it 'default y' in the first place?

We try to avoid 'default y' for user-selectable drivers in general.
I noticed that in my example, I was missing the default. It should
have been 

config POWER_RESET_BRCMSTB
        bool "Broadcom STB reset driver" if COMPILE_TEST
        depends on POWER_RESET && ARM
	default ARCH_BRCMSTB

This way, it always gets selected when ARCH_BRCMSTB is on and
COMPILE_TEST is off. With COMPILE_TEST enabled, it defaults to
ARCH_BRCMSTB but can be enabled or disabled for the purpose
of compile testing.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
