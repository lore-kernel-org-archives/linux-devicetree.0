From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v1 0/6] misc: add reboot mode driver
Date: Mon, 28 Dec 2015 16:28:55 +0100
Message-ID: <3460735.DIRnhNBgbJ@wuerfel>
References: <1450774949-23901-1-git-send-email-andy.yan@rock-chips.com> <20151222164742.GA8623@piout.net> <567A6A01.8080305@rock-chips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <567A6A01.8080305-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Yan <andy.yan-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org, john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, wxt-TNX95d0MmH7DzftRWevZcw@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, geert+renesas-gXvu3+zWzMSzQB+pC5nmwQ@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, dbaryshkov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sre-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jun.nie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, will.deacon-5wv7dgnIgG8@public.gmane.org, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, joel-U3u1mxZcP9KHXe+LvDLADg@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, moritz.fischer-+aYTwkv1SeIAvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 23 December 2015 17:31:45 Andy Yan wrote:
> 
>     I also have the idea to put is in drivers/power/reset,  But considering
>     this driver have not bind anything about power, so I put it in 
> driver/misc
>     at last. So I hope if some people can give more suggestions here.

I vote for drivers/power/reset as well. On some platforms, the two things
are related, on others they are not, but it's good to have it all in one
place I think.

> >>   drivers/soc/rockchip/Kconfig                       |  9 ++
> >>   drivers/soc/rockchip/Makefile                      |  1 +
> >>   drivers/soc/rockchip/reboot.c                     | 68 +++++++++++++++
> > And maybe that part could be made generic instead of rockchip specific.
> > It simply uses a regmap to do the accesses, I guess a lot of other
> > platforms will do that. We have syscon-reboot and syscon-poweroff for example.
> >
> > I think then we can extend the "framework" by having generic drivers to
> > store the value in eeprom or nvram for example.
> >
> 
>     I also hope the write interface can be generic. But I found some 
> platform
>     use different hardware to store the value. For example, John's patch 
> use
>     SRAM on qcom apq8064 to store value for nexus7. It seems there also have
>     some platform use dram or nvram to store it. And these different 
> hardware use
>     different write method. I don't have a generic way to handle this.
> 
>     I have a idea to handle it like this:
> 
> +static const struct of_device_id reboot_mode_dt_match[] = {
> +        { .compatible = "linux,reboot-mode-sfr",    /*for magic value 
> stored in special function register, which  can be accessed by regmap*/
> +                .data = (void *)&reboot-mode-sfr },

I'd make this one syscon-reboot-mode, to go along with syscon-poweroff
as implemented by drivers/power/reset/syscon-poweroff.c. The syscon concept
is already generic enough that we don't need a linux prefix for that.

> +        { .compatible = "linux,reboot-mode-sram",  /*for magic value 
> stored in
> +                .data = (void *)&reboot-mode-sram },

the sram mode should probably follow the generic SRAM binding and make
the location that stores the reboot mode a separate partition, unless
we want to store other data in the same partition, in which case we might
want to use the same implementation as for the nvram.

> +        { .compatible = "linux,reboot-mode-sdram",
> +                .data = (void *)&reboot-mode-sdram }, /*for magic value 
> stored

I think "sdram" is not an appropriate name here, as the main system memory
might use some other technology, e.g. DRAM or DDR2-SDRAM.

> +        { .compatible = "rockchip,reboot-mode-nvram",
> +                .data = (void *)&reboot-mode-nvram },
> +        {},
> +};

nvram is a complex topic by itself, because there are so many ways to do it.
I think what you are referring to here is a battery-backed memory that uses
one or more bytes at a fixed offset to store a particular piece of information,
as the drivers/char/nvram.c driver does. Maybe we should put the reboot mode
into that driver then?

There are other nvram drivers at various places in the kernel, and each may
be slightly different, or completely different, like the EFIVARs driver on
UEFI firmware or the key/value store on Open Firmware, these probably need
their own methods and not share the generic driver.

>     the data point to different hardware access method.
> 
>    Hope to see more suggestions from you.

It's probably best to leave these four examples as separate drivers and we can
add further ones when needed.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
