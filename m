From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] devicetree: add binding for generic mmio
 clocksource
Date: Wed, 7 Oct 2015 18:03:58 +0100
Message-ID: <20151007170358.GA32702@leverpostej>
References: <1444232234-2133-1-git-send-email-mans@mansr.com>
 <20151007154727.GC28981@leverpostej>
 <yw1xvbaik4mn.fsf@unicorn.mansr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <yw1xvbaik4mn.fsf-OEaqT8BN2ezZK2NkWkPsZwC/G2K4zDHf@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?utf-8?B?TcOlbnMgUnVsbGfDpXJk?= <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Oct 07, 2015 at 05:47:12PM +0100, M=C3=A5ns Rullg=C3=A5rd wrote=
:
> Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> writes:
>=20
> > On Wed, Oct 07, 2015 at 04:37:13PM +0100, Mans Rullgard wrote:
> >> This adds a DT binding for a generic mmio clocksource as implement=
ed
> >> by clocksource_mmio_init().
> >>=20
> >> Signed-off-by: Mans Rullgard <mans-2StjZFpD7GcAvxtiuMwx3w@public.gmane.org>
> >> ---
> >> Changed in v2:
> >> - added sched_clock support
> >> ---
> >>  .../devicetree/bindings/timer/clocksource-mmio.txt | 28 +++++++++=
+++++++++++++
> >>  1 file changed, 28 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/timer/clocks=
ource-mmio.txt
> >>=20
> >> diff --git a/Documentation/devicetree/bindings/timer/clocksource-m=
mio.txt b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
> >> new file mode 100644
> >> index 0000000..cfb3601
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/timer/clocksource-mmio.txt
> >> @@ -0,0 +1,28 @@
> >> +Generic MMIO clocksource
> >> +
> >> +Required properties:
> >> +
> >> +- compatible: should be "clocksource-mmio"
> >> +- reg: the physical address of the counter register
> >> +- reg-io-width: size of counter register in bytes, should be 2 or=
 4
> >
> > Can this not be inferred from the reg?
>=20
> You're right, it can.
>=20
> > What about 8 byte counters?
>=20
> The existing code only supports 2 or 4, but that of course doesn't
> matter here.
>=20
> >> +- clocks: phandle to the source clock
> >
> > Is the frequency expected to be exactly the source clock frequency?=
 I
> > imagine it's possible for there to be a divisor.
>=20
> There could of course be, though there isn't in the hardware I'm deal=
ing
> with.  Is specifying it here preferable using a fixed-factor-clock?

I'm not actually sure; I guess it would be ok to do so.

=46or now we should just explicitly state that the clocksource is assum=
ed
to tick at the rate of the clock.

> > We can add properties for that later, but we should be explcit as t=
o
> > what we currently expect the relationship between the clock and the
> > clocksource to be.
> >
> >> +- clocksource-bits: number of valid bits
> >> +- clocksource-rating: rating of the clocksource
> >
> > NAK. This has no meaning w.r.t. the hardware. This should not be in=
 the
> > DT. If there are criteria that bias this (e.g. frequency, latency),=
 they
> > should either be described in the DT or determined dynamically.
>=20
> I had a bad feeling about this.  How would you suggest determining a
> suitable value from actual hardware parameters?

I don't have a good answer to that given the rating is semi-arbitrary,
but that's also the reason I don't want to see it in the DT.

Can we not just choose a fixed number in the driver for now? Likely
something lower than the architected timers (400 currently).

> >> +- linux,sched-clock: boolean, register clocksource as sched_clock
> >
> > Likewise, this property doesn't belong in the DT for the same reaso=
ns as
> > clocksource-rating.
>=20
> What would be a proper way to select a sched_clock source?  I realise
> it's a Linux-specific thing and DT is supposed to be generic, but the
> information must be provided somehow.

I think that any source above a certain rate and below a certain
latency, which does not lose state, should be registered (and the best
gets chosen dynamically).

Come to think of it, what's the expected behaviour of this source w.r.t=
=2E
power management? I expect that the kernel needs to leave the clock
enabled at all times for this to possibly work.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
