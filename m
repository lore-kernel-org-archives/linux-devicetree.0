From: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4] clocksource: arch_timer: Allow the device tree to
 specify uninitialized timer registers
Date: Wed, 26 Nov 2014 08:14:05 -0800
Message-ID: <CAD=FV=XFcWEp=nZ3=8QEausKzpBbPCzFUSHY-g0K5y+VPpU3Vw@mail.gmail.com>
References: <1412753627-28287-1-git-send-email-sonnyrao@chromium.org>
	<1417012893.12707.12.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1417012893.12707.12.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "pawel.moll-5wv7dgnIgG8@public.gmane.org" <pawel.moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org" <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Sudeep Holla <Sudeep.Holla-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Nathan Lynch <Nathan_Lynch-nmGgyN9QBj3QT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Yingjoe,

On Wed, Nov 26, 2014 at 6:41 AM, Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org> wrote:
> Sorry for the (very) late reply.
> I just realize today MT8135 need this and the other patch [1] to boot
> SMP correctly. I've applied both patches and they works fine. Thanks :)

Excellent.  It's helpful to include a Tested-by: tag in your email.
You'd have a line with just "Tested-by: Yingjoe Chen
<yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>"


> However, I'm not sure if we really need to add new property.
> arm_arch_timer driver will only use virtual timer when virtual PPI
> interrupt is provided, so the following patch to timer dtsi will also
> works. I think if the firmware doesn't support virtual timer, it make
> sense to not supply virtual interrupt.
>
>         timer {
>                 compatible = "arm,armv7-timer";
>                 interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> -                            <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> -                            <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> -                            <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +                            <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>;
>                 clock-frequency = <13000000>;
>         };

Once you have Sonny's patch then I believe that the above would work.
However we rejected something like this because device tree is
supposed to describe the hardware.  The hardware really does provide
the virtual timer interrupts and they really are at PPI 11 and PPI 10.
It's just that firmware doesn't handle things properly so they can't
be used.

NOTE: If we add the "arm,cpu-registers-not-fw-configured" to the
device tree and firmware actually works out how to configure things
(like if somehow has firmware that has a hypervisor) then it can
easily remove this device tree property before calling through to the
kernel.  It would be much harder for the firmware to add back in the
"PPI 11" and "PPI 10" entries to the timer.

-Doug
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
