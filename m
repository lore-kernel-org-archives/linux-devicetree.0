From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 2/2] clk: clps711x: Add DT bindings documentation
Date: Mon, 2 Jun 2014 11:42:22 +0100
Message-ID: <20140602104222.GA13573@leverpostej>
References: <1401616522-13505-1-git-send-email-shc_work@mail.ru>
 <20140602085651.GA12397@leverpostej>
 <1401701568.132789498@f354.i.mail.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401701568.132789498-34VbNj3NXoBsdVUOrk1QfQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Jun 02, 2014 at 10:32:48AM +0100, Alexander Shiyan wrote:
> Mon, 2 Jun 2014 09:56:51 +0100 =D0=BE=D1=82 Mark Rutland <mark.rutlan=
d@arm.com>:
> > On Sun, Jun 01, 2014 at 10:55:22AM +0100, Alexander Shiyan wrote:
> > > This patch adds DT binding documentation for the Cirrus Logic
> > > CLPS711X-based CPUs clock subsystem.
> > >=20
> > > Signed-off-by: Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>
> > > ---
> > >  .../devicetree/bindings/clock/clps711x-clock.txt      | 19 +++++=
++++++++++++++
> > >  1 file changed, 19 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/clock/clps7=
11x-clock.txt
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/clps711x-clo=
ck.txt b/Documentation/devicetree/bindings/clock/clps711x-clock.txt
> > > new file mode 100644
> > > index 0000000..0fdf3c9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/clps711x-clock.txt
> > > @@ -0,0 +1,19 @@
> > > +* Clock bindings for the Cirrus Logic CLPS711X CPUs
> > > +
> > > +Required properties:
> > > +- compatible  : Shall contain "cirrus,clps711x-clk".
> > > +- reg         : Address of the internal register set.
> > > +- cpufreq     : Factory set default frequency in HZ.
> >=20
> > Huh? Why is this called "cpufreq" what is this the frequency of,
> > exactly?
> >=20
> > Is this an input or an output?
>=20
> Modern CLPS711X CPUs support PLL reprogramming, while for older proce=
ssors,
> this procedure is not possible and the CPU clock is set to a fixed va=
lue. Thus if the
> value of the PLL multiplier is not correct (missing), we use a fixed =
CPU frequency
> of the processor, described in DT, which allows us to use the driver =
for the new and
> old versions of this CPU.

Ok. So this is the frequency of a (non-programmable) PLL which feeds th=
e
clock IP block?

Or is this internal to the IP block?

Typically we'd use "clock-frequency" as the name for such an input, or
just model it as a normal clock input and feed it a fixed-rate-clock fo=
r
the non-programmable case.

Cheers,
Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
