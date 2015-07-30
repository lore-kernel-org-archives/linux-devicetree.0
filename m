From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Thu, 30 Jul 2015 08:59:51 +0200
Message-ID: <20150730065951.GI15360@pengutronix.de>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150728212155.GA18137@roeck-us.net>
 <20150729073513.GB15360@pengutronix.de>
 <55B8F603.4000003@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B8F603.4000003-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Guenter,

On Wed, Jul 29, 2015 at 08:49:23AM -0700, Guenter Roeck wrote:
> On 07/29/2015 12:35 AM, Uwe Kleine-K=F6nig wrote:
> >>always-running is meant to indicate that the watchdog can not be st=
opped
> >>(meaning a timer has to be used to send keepalives while the watchd=
og
> >>device is closed). The documentation specifically states that.
> >>
> >>	"If the watchdog timer cannot be disabled ..."
> >>
> >>How would you express that condition without always-running or a si=
milar
> >>attribute ?  I am also not sure how that relates to hw_algo; I thou=
ght
> >>those properties are orthogonal.
> >For hw_algo =3D "level" the inactive level of the gpio disables the
> >watchdog (and resets the counter). So always-running doesn't make se=
nse
> >for this type.
> >
> That is not what is currently implemented. "level" just means that
I'm not talking (yet) about the implementation.
> the watchdog is pinged using a -high-low-high- or -low-high-low-
> sequence, while toggle means that the level is changed with each
> ping (-low-(wait)-high-(wait)-low-(wait)-high-...).
Currently the document tells us:

	hw_algo: [...]
	- level: Low or high level starts counting WDT timeout, the
	  opposite level disables the WDT.

So similar to the "toggle" description there is some behaviour about
being disabled in certain states implied.

Keeping compatibility code to handle the current state left aside the
needed properties are more intuitive (maybe subjective?) and also more
orthogonal as follows:

  input-gpio =3D reference to gpio connected to WDI
  reset-counter =3D "raising-edge" | "falling-edge" | "edge"
  	(maybe the first two can be combined with taking the active flag
	of the gpio into account ("edge" | "any-edge"))
  optional: enable-gpio =3D reference to gpio connected to an enable pi=
n
  	that can be used to enable and disable the watchdog
  optional: startup-gpio =3D reference to gpio connected to an enable p=
in
  	that can be used to enable but not disable the watchdog. (I
	still doubt that this exists in the wild but still.)
  optional: disable-on-tri-state =3D property that signals that the
  	watchdog can be stopped by setting the input-gpio to tri-state.

This way the three optional properties conflict each other (pairwise)
and the meaning of reset-counter and the three optional properties is
not modified by the presence of another property.
=20
> >>Of course, 'always-running' _may_ describe driver behavior, but tha=
t doesn't
> >Well in the current state of the binding document we have:
> >
> >	add this flag to have the driver keep toggling the signal
> >	without a client.
> >
> >Sure it is meant to describe a hardware specific property, but it ta=
lks
> >about the driver.
> >
> Then the fix is to update the binding document.
>=20
> >I'd go for these properties then:
> >
> >	toggle-gpio: the gpio used to stroke the watchdog
>=20
> 'toggle' means something different in the current implementation.
>=20
> >	enable-gpio: optional, the gpio to enable and disable the watchdog
> >	disable-on-tri-state: optional, signals that the watchdog can
> >		be stopped by setting the trigger-gpio to tri-state.
> >	compatible, hw_algo and hw_margin_ms: as before.
> >	=09
>=20
> I would agree that a separate 'enable' property would make sense (if =
you
> have a watchdog needing it). Similar to disable-on-tri-state, if ther=
e
> is some hardware which is implemented that way (mixing up hw_algo=3D=3D=
toggle
> with that state doesn't seem correct). Deprecating hw_algo and replac=
ing it
> with something more sensible might make sense as well ('algorithm' ?)=
=2E

algorithm is IMHO better than "hw_algo". What do you think about
reset-counter as suggested above?

> We have to be careful not to mix up hw_algo and enable, though.
fine, so we agree here.

> >I think there is no need for a property that signals that the watchd=
og
> >is unstoppable. For level-gpio-watchdogs you can do it by setting th=
e
> >trigger gpio to inactive, and you cannot stop level-gpio-watchdogs
> >unless enable-gpio or disable-on-tri-state is specified.
> >If we ever feel the need to describe a gpio watchdog with a input th=
at
> >starts the device but cannot stop it, I'd suggest to use "start-gpio=
"
> >for that one.
> >
> >>have to be the case. There are lots of watchdogs out there which ca=
n not be
> >>stopped. Some of them run all the time, others can not be stopped o=
nce
> >>started.
> >Yeah, I'm aware of that. For this driver however I wouldn't expect t=
hat
> >you have a dedicated enable-gpio if you cannot disable the device wi=
th it.
>=20
> Why ? There are lots of chips which implement exactly that. There is =
an
> enable bit in some register which can be used to enable the watchdog,
> but once enabled it can not be stopped. I don't see why a gpio driven
> watchdog would have to be any different.
I doubt it, because you need an extra line then for a task that is only
used once per boot. And it's straight forward to do the startup on the
first ping.

> >and for hw_algo =3D "toggle" any sane hardware engineer would simply
> >enable the watchdog once the first toggle is detected on WDI. (OK,
> >assuming hardware engineers being sane turned out to be a weak argum=
ent
> >often in the past.)
> >
> I still don't see the relationship between enable and the toggle/leve=
l
> algorithm. Really, those two properties are orthogonal.
They should. But they are not as currently documented (and implemented)=
=2E

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig        =
    |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
