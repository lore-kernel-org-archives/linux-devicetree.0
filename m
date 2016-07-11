From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 01/10] ARM: NUC900: Add nuc970 machine support
Date: Mon, 11 Jul 2016 18:04:35 +0200
Message-ID: <18260150.aRRy8ybKlm@wuerfel>
References: <1468135649-19980-1-git-send-email-vw@iommu.org> <1468135649-19980-2-git-send-email-vw@iommu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1468135649-19980-2-git-send-email-vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wan Zongshun <vw-6ukY98dZOFrYtjvyW6yDsg@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org, p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Wan Zongshun <mcuos.com-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sunday, July 10, 2016 3:27:21 PM CEST Wan Zongshun wrote:
> +ifeq ($(CONFIG_SOC_NUC970),)
>  obj-y                          := irq.o time.o mfp.o gpio.o clock.o
>  obj-y                          += clksel.o dev.o cpu.o
> +endif
>  # W90X900 CPU support files

When mfp.o is disabled like this, I get a link error in two drivers
using the exported interface:

ERROR: "mfp_set_groupg" [drivers/spi/spi-nuc900.ko] undefined!
ERROR: "mfp_set_groupi" [drivers/input/keyboard/w90p910_keypad.ko] undefined!

Any idea for a better migration strategy?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
