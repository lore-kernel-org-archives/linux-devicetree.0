From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>
Subject: Re: [PATCH 0/2] IO voltage domain support for rk3188 and rk3288
Date: Sat, 30 Aug 2014 13:27:43 +0200
Message-ID: <1450179.xJuMFg9Vvn@diego>
References: <1409254565-10677-1-git-send-email-dianders@chromium.org> <53FF9E93.3040601@ti.com> <CAD=FV=Vcj+tAno92c38Prviyi-v2CmuGSzak1ppETL033KAF4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAD=FV=Vcj+tAno92c38Prviyi-v2CmuGSzak1ppETL033KAF4w-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Addy Ke <addy.ke-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Sonny Rao <sonnyrao-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, agross-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, sandeep_n-l0cyMroinI0@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nishanth Menon <nm-l0cyMroinI0@public.gmane.org>, Linus
List-Id: devicetree@vger.kernel.org

Am Freitag, 29. August 2014, 21:51:46 schrieb Doug Anderson:
> Santosh,
>=20
> On Thu, Aug 28, 2014 at 2:26 PM, Santosh Shilimkar
>=20
> <santosh.shilimkar-l0cyMroinI0@public.gmane.org> wrote:
> > On Thursday 28 August 2014 03:36 PM, Doug Anderson wrote:
> >> These two patches add support for automatically configuring the IO
> >> voltage domains on rk3188 and rk3288 SoCs.  The first patch adds s=
ome
> >> new notification types to the regulator code.  It's used by the se=
cond
> >> patch which actually implements the IO voltage domain driver.
> >>=20
> >> These two patches were co-developed by Heiko St=FCbner and Doug An=
derson
> >> (proof of concept patches were written by Heiko).  They were teste=
d in
> >> a private branch on an rk3288 board using rk808 instead of mainlin=
e
> >> since rk808 support isn't finalized in mainline yet.
> >>=20
> >> (sorry if you got this series twice; my mailer seems unhappy with =
me)
> >>=20
> >> Heiko St=FCbner (2):
> >>   regulator: core: Add REGULATOR_EVENT_PRE_VOLTAGE_CHANGE (and ABO=
RT)
> >>   soc/rockchip: io-domain: add driver handling io domains
> >=20
> > Sorry to shot down but your IO domains are nothing but voltage doma=
ins
> > and you should really build something in the drivers/power/*
>=20
> If everyone agrees that this belongs in drivers/power that's totally
> OK.  Neither Heiko nor I was confident that it should be in
> drivers/soc.  I had even though that the code wouldn't be totally out
> of place in the Rockchip pinctrl driver (adding Linus W since I think
> some SoCs did add code to handle 3.3V vs. 1.8V in pinctrl).

a bit of context for Linus ...

This is essentially the continuation of  the thread "io-domain voltages=
 as=20
regulators?" from the beginning of august. After more discussions we fo=
und out=20
that the io voltage selection I asked about is not an independent suppl=
y, but=20
instead has to reflect the voltage of the real supplying regulator.

And setting the io-voltage setting to 1.8V while the regulator is suppl=
ying=20
3.3V for example may actually damage the chip.


So in our current approach here, we added a driver that tracks voltage =
changes =20
of the supplying regulator via a notifier and sets the register bits=20
accordingly.


>=20
> > Please have a look at the RFC [1]. You should really go on those
> > lines and collaborate to make a generic voltage domain layer instea=
d of
> > throwing the driver under drivers/soc.
>=20
> Trying to base things on a 7-month old RFC that hasn't been touched i=
s
> not something I'm going to do.  Maybe that makes me a bad person...
>=20
> I would also say that I'm not convinced that we really need a
> complicated framework here.  Maybe when we're talking about things
> like ABB and DevFreq and the like then having a nice framework is a
> good idea.  Really here we're just setting properties associated with
> IO pins.  There's no decisions about latency, power tradeoffs, etc.
> If the pin is connected to 1.8V we need to set the 1.8V bit.  If it's
> connected to 3.3V we need to set the 3.3V bit.  The end.
>=20
> The only remotely complicated thing (and why this isn't just a pinctr=
l
> property) is what happens with dynamic voltages.  SD Card IO lines ca=
n
> change voltage depending on UHS negotiation.  In that case the SD Car=
d
> Driver will request that its regulator change from 3.3V to 1.8V.  The
> bit in the IO domain register needs to update in tandem.
>=20
>=20
> The driver is really quite tiny (333 lines).  If we find that lots of
> people copy it and they have code that's nearly the same then we
> should try to abstract things out then.
>=20
>=20
> I'd be interested in hearing other opinions, though.
>=20
> -Doug

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
