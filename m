From: =?utf-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 4/9] clocksource/cadence_ttc: Use enable/disable_irq
Date: Thu, 28 Nov 2013 10:36:16 -0800
Message-ID: <b2ed3cbc-c9df-4235-8137-93514c05bffa@DB8EHSMHS031.ehs.local>
References: <1385514296-26702-1-git-send-email-soren.brinkmann@xilinx.com>
 <1385514296-26702-5-git-send-email-soren.brinkmann@xilinx.com>
 <52972F3A.9090103@linaro.org>
 <alpine.DEB.2.02.1311281507280.30673@ionos.tec.linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.02.1311281507280.30673-3cz04HxQygjZikZi3RtOZ1XZhhPuCNm+@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>
Cc: Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Thomas,

On Thu, Nov 28, 2013 at 03:18:50PM +0100, Thomas Gleixner wrote:
> On Thu, 28 Nov 2013, Daniel Lezcano wrote:
>=20
> > On 11/27/2013 02:04 AM, Soren Brinkmann wrote:
> > > To ensure that the timer interrupt is properly enabled/disabled a=
cross
> > > the whole CPU cluster use enable/disable_irq() instead of
> > > local_irq_disable().
> > >=20
> > > Signed-off-by: Soren Brinkmann <soren.brinkmann-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >   drivers/clocksource/cadence_ttc_timer.c | 6 ++----
> > >   1 file changed, 2 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/clocksource/cadence_ttc_timer.c
> > > b/drivers/clocksource/cadence_ttc_timer.c
> > > index a92350b55d32..246d018d1e63 100644
> > > --- a/drivers/clocksource/cadence_ttc_timer.c
> > > +++ b/drivers/clocksource/cadence_ttc_timer.c
> > > @@ -322,18 +322,16 @@ static int ttc_rate_change_clockevent_cb(st=
ruct
> > > notifier_block *nb,
> > >   	switch (event) {
> > >   	case POST_RATE_CHANGE:
> > >   	{
> > > -		unsigned long flags;
> > > -
> > >   		/*
> > >   		 * clockevents_update_freq should be called with IRQ disabled
> > > on
> > >   		 * the CPU the timer provides events for. The timer we use is
> > >   		 * common to both CPUs, not sure if we need to run on both
> > >   		 * cores.
>=20
> Can we adjust that bogus comment as well, please?
I can remove that comment. I'll see if including it in one of the
existing patches or adding another patch for it makes sense.

>=20
> > >   		 */
> > > -		local_irq_save(flags);
> > > +		disable_irq(ttcce->ce.irq);
> > >   		clockevents_update_freq(&ttcce->ce,
> > >   				ndata->new_rate / PRESCALE);
> > > -		local_irq_restore(flags);
> > > +		enable_irq(ttcce->ce.irq);
> > >=20
> > >   		/* update cached frequency */
> > >   		ttc->freq =3D ndata->new_rate;
> > >=20
> >=20
> > I am worried about the 'disable_irq' function calling 'synchronize_=
irq'. Isn't
> > possible to deadlock with the ondemand cpufreq governor ? I added V=
iresh in
> > Cc, he knows better than me the code path.
>=20
> disable_irq() will only deadlock if called from the interrupt handler
> of the device interrupt itself or when the calling code is holding
> locks which prevent the function to proceed.
>=20
> But what's more important is, that the patch violates the calling
> convention of clockevents_update_freq(). It must be called with
> interrupts disabled.=20
>=20
> Now the problem with this device is that it is not a per cpu
> device. It's a global device, so this update can conflict with a
> parallel access on the other CPU. Now the disable_irq() only prevents
> that the other CPU can handle a device interrupt from that timer. But
> it does not prevent any parallel access from e.g. the idle code path
> which will try to reprogram it.
Does that mean interrupts need to be disabled globally? Also, does the
cpuidle path depend on interrupts or can it interfere no matter what?

>=20
> Soren, is that timer used as the broadcast device ?
Yes, this is the only broadcast capable timer on Zynq, AFAIK. Other tha=
n
the TTC we only have the arm_global_timer and smp_twd timers, which bot=
h
are per_cpu devices and thus not broadcast capable.

	S=C3=B6ren


--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
