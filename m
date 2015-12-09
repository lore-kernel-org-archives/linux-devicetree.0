From: John Stultz <john.stultz-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC][PATCH] misc: Introduce reboot_reason driver
Date: Tue, 8 Dec 2015 16:13:35 -0800
Message-ID: <CALAqxLU4y6+AsKcZSPUaJQ2BgcAWoT8OPcYO6EYfOz+-7r8FTQ@mail.gmail.com>
References: <1449610162-30543-1-git-send-email-john.stultz@linaro.org>
	<1858873.xsM5XHIlTX@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1858873.xsM5XHIlTX@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: lkml <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Vinay Simha BN <simhavcs-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bjorn Andersson <bjorn.andersson-/MT0OVThwyLZJqsBc5GL+g@public.gmane.org>, Haojian Zhuang <haojian.zhuang-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Android Kernel Team <kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 8, 2015 at 1:52 PM, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org> wrote:
>
> On Tuesday 08 December 2015 13:29:22 John Stultz wrote:
>
> > diff --git a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > index 5183d18..ee5dcb7 100644
> > --- a/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > +++ b/arch/arm/boot/dts/qcom-apq8064-nexus7-flo.dts
> > @@ -282,6 +282,15 @@
> >                       };
> >               };
> >
> > +             reboot_reason: reboot_reason@2a03f65c {
> > +                     compatible              = "reboot_reason";
>
> This is not a good compatible string. There should generally be a vendor
> name associated with it (use "linux," if nothing else, and you should have
> '-' instead of '_'.


Ack.


>
>
> > +                     reg                     = <0x2A03F65C 0x4>;
>
> This may easily conflict with the device it is part of. We should have
> non-overlapping register areas in general. For the example you are
> looking at, which register block is this?

So Bjorn says its IMEM, but I was assuming it was just a reserved
magic phys addr from the bootloader.

Ideally I'm hoping to use this same driver for another device, which
plans to reserve a page from memory that the bootloader won't clear.


> > +/* Types of reasons */
> > +static enum {
> > +     NONE,
> > +     BOOTLOADER,
> > +     RECOVERY,
> > +     OEM,
> > +     MAX_REASONS
> > +} __maybe_unused reason_types;
>
> The variable seems to always be unused, not just "__maybe_unused". Maybe remove it?


Yea. I initially just had the empty enum, but the compiler was giving
me "useless class storage specifier in empty declaration" warnings. So
I added a variable to it, but then I got unused variable warnings. So
I ended up with this. :P

Is there a better way? Are enums for array indexes out of fashion?
Just a list of #defines ?


> > +static int reboot_reason(struct notifier_block *nb, unsigned long action,
> > +                                                             void *data)
> > +{
> > +     char *cmd = (char *)data;
> > +     long reason = reasons[NONE];
> > +
> > +     if (!reboot_reason_addr)
> > +             return NOTIFY_DONE;
> > +
> > +     if (cmd != NULL) {
> > +             if (!strncmp(cmd, "bootloader", 10))
> > +                     reason = reasons[BOOTLOADER];
> > +             else if (!strncmp(cmd, "recovery", 8))
> > +                     reason = reasons[RECOVERY];
> > +             else if (!strncmp(cmd, "oem-", 4)) {
> > +                     unsigned long code;
> > +
> > +                     if (!kstrtoul(cmd+4, 0, &code))
> > +                             reason = reasons[OEM] | (code & 0xff);
> > +             }
> > +     }
> > +
> > +     if (reason != -1)
> > +             writel(reason, reboot_reason_addr);
> > +     return NOTIFY_DONE;
> > +}
>
> Will this reboot the machine?


No. Just sets the data for the bootloader before the reboot occurs.

> > +     /* Install the notifier */
> > +     restart_nb.notifier_call = reboot_reason;
> > +     restart_nb.priority = 256;
> > +     if (register_restart_handler(&restart_nb)) {
>
> If not, you should use register_reboot_notifier() rather than
> register_restart_handler(). The former gets called to do something
> just before rebooting, while the latter attempts to actually reboot
> the machine.

Ah. Thanks.

> > +static int __init reboot_reason_init(void)
> > +{
> > +     return platform_driver_register(&reboot_reason_driver);
> > +}
> > +arch_initcall(reboot_reason_init);
>
> Why this early? If it can be a normal device_initcall, you can use
> module_platform_driver().

Yea. Mostly its just from the driver I stole the init path from, but I
thought it might be useful to have early. But I'm not passionate about
it one way or the other, so module_platform_driver is fine.


Thanks so much for the review and feedback!

thanks
-john
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
