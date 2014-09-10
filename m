From: Ulf Hansson <ulf.hansson-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v7 2/5] ARM: imx6: gpc: Add PU power domain for GPU/VPU
Date: Wed, 10 Sep 2014 14:35:32 +0200
Message-ID: <CAPDyKFowGCo+b4X0AYK6fj254GiCCaXTj45hgjZGDNYDum=1kA@mail.gmail.com>
References: <1409060791-23167-1-git-send-email-p.zabel@pengutronix.de>
	<1409060791-23167-3-git-send-email-p.zabel@pengutronix.de>
	<CAPDyKFovJOVyKRNSA+sEjd4mXA9QYYYDQEAvTzkptj8FDzgWTQ@mail.gmail.com>
	<1410177246.3981.34.camel@paszta.hi.pengutronix.de>
	<CAPDyKFozmLLEwK297K0mtvf-m_fUC79ZstbF6V-TAnNTh41VZw@mail.gmail.com>
	<20140909204938.GA26440@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140909204938.GA26440-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <pza-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On 9 September 2014 22:49, Philipp Zabel <pza-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org> wrote:
> On Tue, Sep 09, 2014 at 09:01:08PM +0200, Ulf Hansson wrote:
>> [...]
>>
>> >> > +       is_off = IS_ENABLED(CONFIG_PM_RUNTIME);
>> >> > +       if (is_off)
>> >> > +               imx6q_pm_pu_power_off(&imx6q_pu_domain.base);
>> >>
>> >> Could you elaborate why is_off depends on CONFIG_PM_RUNTIME? That
>> >> seems strange to me. :-)
>> >>
>> >> Additionally, I think it would be better to leave the domain "on"
>> >> state. Wouldn't that even be required for some drivers to be able to
>> >> succeed probing of these devices?
>> >
>> > The devices in the PU power domain are Vivante GPUs and the CODA Video
>> > Processing Unit. These are platform devices that don't need to be active
>> > to enumerate before being probed. The drivers support runtime PM, so if
>> > CONFIG_PM_RUNTIME is enabled, it is safe to disable the PU power domain
>> > on boot. The drivers will probe and request for the power domain to be
>> > enabled via runtime PM before accessing the hardware.
>> >
>> > If CONFIG_PM_RUNTIME is disabled, the power domain needs to stay enabled
>> > at all times.
>>
>> Hi Philipp,
>>
>> Thanks for your reply, that certainly made it clear on what you would
>> like to accomplish.
>>
>> Before discussing further consequences in genpd of this approach
>> (using IS_ENABLED(CONFIG_PM_RUNTIME)), I would be interested to see
>> how the runtime PM support is implemented for any of the drivers you
>> refer to. Do you mind pointing me to any of them?
>
> Of course, the CODA driver is at drivers/media/platform/coda.c in mainline
> kernels (moved to drivers/media/platform/coda-common.c in linux-next).

Thanks! I went for a look and found some parts that concerns me. :-)

In principle, the coda platform driver will have a close dependency to
its corresponding PM domain state (powered or not powered) while
probing, which seems fragile.

In the case of CONFIG_PM_RUNTIME, the driver will not bring the coda
device into active state (runtime PM resumed) during probing. As you
also stated above, but this have consequences. Let me elaborate.

When the device gets attached to its PM domain, which is prior the
coda driver is probed - the device specific flag in genpd,
"need_restore", get assigned to a value depending on what status the
PM domain currently has. The "need_restore" flag is used internally in
genpd to understand when the device's runtime PM callbacks shall or
shall not be invoked.

As long as the state of the PM domain is powered off, when it gets
attached to the coda device - this works. Can you guarantee that's
true for all SoCs and PM domains that uses the coda driver?

It won't work if the PM domain is powered on while attaching occurs.
That's because the device's runtime PM state will not be in sync with
the "need_restore" flag in genpd. In other words, genpd will prevent
the coda driver's runtime PM callbacks from being invoked properly.

So this is a generic problem while using genpd and there are similar
issues for the opposite situation. I am already working on a fix for
it and will keep you posted. Let's see if that fix may effect this
patch as well.

Kind regards
Uffe
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
