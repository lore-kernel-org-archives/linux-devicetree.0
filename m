From: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] populate platform device at late init
Date: Thu, 18 Aug 2016 19:58:47 -0500
Message-ID: <CAL_JsqJQZ5=9zS-M66gb0ha7-nbAmhsrH6X5r76QLzA4SUa7xA@mail.gmail.com>
References: <1471546533-3996-1-git-send-email-anshexp@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471546533-3996-1-git-send-email-anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Anshuman Gupta <anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Thu, Aug 18, 2016 at 1:55 PM, Anshuman Gupta <anshexp-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This patch enables to populate platform devices from device tree at late-init
> As of now linux kernel has late-init call infrastructure which make a driver/module
> init call at late-init.it is not specific to a platform device.
> This patch make a platform device to be probe at late-init,
> without making its driver a late-init call.
>
> This will be useful in certain scenario when we have multiple instances of similar
> platform devices and it is ok to defer specific device to late-init among the multiple
> instance of similar devices.
>
> Currently ARM based SOC has multiple instance of similar modules/controller
> (i2c,uart,mmc controller), so for each module/controller device will get probe and
> initialized at early boot, but for some instances of device it may not be needful
> to be initialized it at early boot-up. If we can defer these device
> probe/initialization at post init, it can improve boot up time with respect to other
> system component.It can be useful in Linux based automotive infotainment platform,
> where we need camera functionality (reverse view camera) as early as possible.
>
> Example: if we have 4 i2c controller(i2c0~i2c3) and i2c0 controller is being used
> by a camera driver,if camera driver is required at early boot then i2c controller driver
> can not be initialized at late-init and i2c0 controller need to probe before camera driver,
> but this force other i2c controller devices also to be probe at early boot-up itself,
> which may not be really required.
> This patch tested on freescale imx6 udoo quad board with kernel version 3.14.56.

You should generally test with something not ancient, but...

> Patch is made against 4.7 kernel.
>
> In order to probe a platform device at late-init, we need to declare a late_init
> property at desired device tree node, and invoke of_platform_populate_late_nodes exported
> function call from desired board file init_late machine descriptor function.

Sorry, but this approach is never going to be accepted. Similar things
have come up for boot time optimizations. This needs to be part of
more general tracking of functional dependencies (e.g. camera depends
on i2c). Once we have that, then we can prioritize what to init first
(e.g. camera).

> Following files has been changed for this patch
>         drivers/of/Kconfig
>         drivers/of/base.c
>         drivers/of/platform.c
>         include/linux/of.h
>         include/linux/of_platform.h

Not useful information in the commit msg because it is generated right here:

>  drivers/of/Kconfig          |   7 +++
>  drivers/of/base.c           |  21 +++++++++
>  drivers/of/platform.c       | 109 ++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/of.h          |   3 ++
>  include/linux/of_platform.h |  14 ++++++
>  5 files changed, 154 insertions(+)
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
