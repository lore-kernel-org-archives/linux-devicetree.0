From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 0/4] arm: zynq: Enable global timer
Date: Wed, 25 Sep 2013 08:37:19 -0700
Message-ID: <06680eeb-11e3-4fdc-99f7-1b57c06deb11@CO1EHSMHS021.ehs.local>
References: <1379530118-22813-1-git-send-email-soren.brinkmann@xilinx.com>
 <5242FF4B.6050901@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5242FF4B.6050901-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Preeti Murthy <preeti.lkml-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 25, 2013 at 05:20:43PM +0200, Daniel Lezcano wrote:
> On 09/18/2013 08:48 PM, Soren Brinkmann wrote:
> > Hi all,
> >=20
> > here's a v2. I reused the subject from my v1 submission although th=
e focus of
> > this series moved a bit towards the timer subsystem.
> > I replaced Stephen's fix to prevent per cpu devices from becoming
> > the broadcast device with Thomas' proposal, but I kept the original=
 commit
> > message. I split the whole approach in small chunks that I found re=
asonable.
> >=20
> > In 4/4, I picked up Grant's comment regarding the DT node name.
> >=20
> > v2:
> >  - drop 1/2 of the original series
> >  - implement preventing per cpu devices from becoming broadcast dev=
ice according
> >    to Thomas' proposal
> >    - introduce new CLOCK_EVT_FEAT_PERCPU flag
> >    - set the flag for the arm_global_timer
> >    - filter per cpu devices based on this flag when choosing the br=
oadcast
> >      device
> >  - rename DT node to avoid '_'s
> > =20
> >=20
> > Soren Brinkmann (4):
> >   clockchips: Add FEAT_PERCPU clockevent flag
> >   clocksource/arm_global_timer: Set FEAT_PERCPU flag
> >   tick: broadcast: Deny per-cpu clockevents from being broadcast so=
urces
> >   arm: zynq: Enable arm_global_timer
> >=20
> >  arch/arm/boot/dts/zynq-7000.dtsi       | 8 ++++++++
> >  arch/arm/mach-zynq/Kconfig             | 1 +
> >  drivers/clocksource/arm_global_timer.c | 3 ++-
> >  include/linux/clockchips.h             | 1 +
> >  kernel/time/tick-broadcast.c           | 1 +
> >  5 files changed, 13 insertions(+), 1 deletion(-)
>=20
> This patches falls under different maintainer's umbrella.
>=20
> I acked-by the patches, so if someone is willing to take the patches =
I
> am ok with that. I am ok also to pick them into my tree with the
> acked-by maintainer. Just let me know ...

Thanks Daniel. I agree you/timer folks and Michal/armsoc have to figure
out how to resolve this the easiest way. I'd almost say merging this al=
l
through the timers tree might be the easiest. The conflict which might
occur in the Zynq dts file should be trivial since the patch is purely
additive.

But well, up to you.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
