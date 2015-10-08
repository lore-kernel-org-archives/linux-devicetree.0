From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio clocksource
Date: Thu, 08 Oct 2015 10:15:39 +0100
Message-ID: <yw1xr3l5k9fo.fsf@unicorn.mansr.com>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
	<20151007154727.GC28981@leverpostej>
	<yw1xvbaik4mn.fsf@unicorn.mansr.com>
	<20151007170358.GA32702@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20151007170358.GA32702@leverpostej> (Mark Rutland's message of
	"Wed, 7 Oct 2015 18:03:58 +0100")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:

>> >> +- clocks: phandle to the source clock
>> >
>> > Is the frequency expected to be exactly the source clock frequency=
? I
>> > imagine it's possible for there to be a divisor.
>>=20
>> There could of course be, though there isn't in the hardware I'm dea=
ling
>> with.  Is specifying it here preferable using a fixed-factor-clock?
>
> I'm not actually sure; I guess it would be ok to do so.
>
> For now we should just explicitly state that the clocksource is assum=
ed
> to tick at the rate of the clock.

OK, I'll come up with a clearer wording.

>> > We can add properties for that later, but we should be explcit as =
to
>> > what we currently expect the relationship between the clock and th=
e
>> > clocksource to be.
>> >
>> >> +- clocksource-bits: number of valid bits
>> >> +- clocksource-rating: rating of the clocksource
>> >
>> > NAK. This has no meaning w.r.t. the hardware. This should not be i=
n the
>> > DT. If there are criteria that bias this (e.g. frequency, latency)=
, they
>> > should either be described in the DT or determined dynamically.
>>=20
>> I had a bad feeling about this.  How would you suggest determining a
>> suitable value from actual hardware parameters?
>
> I don't have a good answer to that given the rating is semi-arbitrary=
,
> but that's also the reason I don't want to see it in the DT.
>
> Can we not just choose a fixed number in the driver for now? Likely
> something lower than the architected timers (400 currently).

=46ine with me.

>> >> +- linux,sched-clock: boolean, register clocksource as sched_cloc=
k
>> >
>> > Likewise, this property doesn't belong in the DT for the same reas=
ons as
>> > clocksource-rating.
>>=20
>> What would be a proper way to select a sched_clock source?  I realis=
e
>> it's a Linux-specific thing and DT is supposed to be generic, but th=
e
>> information must be provided somehow.
>
> I think that any source above a certain rate and below a certain
> latency, which does not lose state, should be registered (and the bes=
t
> gets chosen dynamically).
>
> Come to think of it, what's the expected behaviour of this source w.r=
=2Et.
> power management? I expect that the kernel needs to leave the clock
> enabled at all times for this to possibly work.

The platform I'm dealing with has a 32-bit register counting cycles of
the external clock input which never stops.  It also has a few counters
with a configurable clock source, and those might indeed stop so should
probably not be used for this.

--=20
M=E5ns Rullg=E5rd
mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
