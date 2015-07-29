From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Wed, 29 Jul 2015 09:35:13 +0200
Message-ID: <20150729073513.GB15360@pengutronix.de>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150728212155.GA18137@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150728212155.GA18137-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Guenter,

On Tue, Jul 28, 2015 at 02:21:55PM -0700, Guenter Roeck wrote:
> On Tue, Jul 28, 2015 at 10:33:48PM +0200, Uwe Kleine-K=F6nig wrote:
> > This is just a suggestion up to now, I don't have any code yet to s=
hare.
> >=20
> > Apart from minor rewording to make the document easier to understan=
d and
> > less ambiguous the relevant changes are:
> >=20
> >  - add an "enable-gpio" property.
> >    I admit the device I'm currently working with doesn't have this.
> >    Still I imagine this to be a common hardware property. I added i=
t
> >    mainly to demonstrate the shortcomings of the existing binding.
> >  - rename "gpios" to "trigger-gpio"
> >    This is more descriptive. And given there is "enable-gpio" now, =
too,
> >    using plain "gpios" seems wrong.
> >  - deprecate always-running
> >    Apart from the description describing the driver behaviour and n=
ot
> >    the device property, always-running only seems to make sense in
> >    combination with hw_algo =3D "level" and in reality should only
> >    invalidate the sentence: "The watchdog timer is disabled when GP=
IO is
> >    left floating or connected to a three-state buffer."
>=20
> always-running is meant to indicate that the watchdog can not be stop=
ped
> (meaning a timer has to be used to send keepalives while the watchdog
> device is closed). The documentation specifically states that.
>=20
> 	"If the watchdog timer cannot be disabled ..."
>=20
> How would you express that condition without always-running or a simi=
lar
> attribute ?  I am also not sure how that relates to hw_algo; I though=
t
> those properties are orthogonal.
=46or hw_algo =3D "level" the inactive level of the gpio disables the
watchdog (and resets the counter). So always-running doesn't make sense
for this type.

> Of course, 'always-running' _may_ describe driver behavior, but that =
doesn't
Well in the current state of the binding document we have:

	add this flag to have the driver keep toggling the signal
	without a client.

Sure it is meant to describe a hardware specific property, but it talks
about the driver.

I'd go for these properties then:

	toggle-gpio: the gpio used to stroke the watchdog
	enable-gpio: optional, the gpio to enable and disable the watchdog
	disable-on-tri-state: optional, signals that the watchdog can
		be stopped by setting the trigger-gpio to tri-state.
	compatible, hw_algo and hw_margin_ms: as before.
	=09
I think there is no need for a property that signals that the watchdog
is unstoppable. For level-gpio-watchdogs you can do it by setting the
trigger gpio to inactive, and you cannot stop level-gpio-watchdogs
unless enable-gpio or disable-on-tri-state is specified.
If we ever feel the need to describe a gpio watchdog with a input that
starts the device but cannot stop it, I'd suggest to use "start-gpio"
for that one.

> have to be the case. There are lots of watchdogs out there which can =
not be
> stopped. Some of them run all the time, others can not be stopped onc=
e
> started.
Yeah, I'm aware of that. For this driver however I wouldn't expect that
you have a dedicated enable-gpio if you cannot disable the device with =
it.
=46or hw_algo =3D "level" there is probably no device with an enable in=
put
and for hw_algo =3D "toggle" any sane hardware engineer would simply
enable the watchdog once the first toggle is detected on WDI. (OK,
assuming hardware engineers being sane turned out to be a weak argument
often in the past.)

> That gets us into the rat-hole of arguing if property X describes dri=
ver
> behavior or the hardware, and of rejecting properties because they ma=
y
> be driver descriptions in some use cases (because 'always-running' ca=
n
> be set even if the hardware doesn't mandate it, making it driver beha=
vior).
> I'd rather not go there.
I think we agree here, that "always-running" is a hardware property.

> >    With this semantic using a property "disable-on-tri-state" sound=
s
> >    more sensible. And note that even the following would make sense
> >    hardware-wise, while the device tree looks stupid:
> >=20
> > 	watchdog {
> > 		compatible =3D "linux,wdt-gpio";
> > 		trigger-gpio =3D ...;
> > 		hw_algo =3D "toggle";
> > 		always-running;
> > 		enable-gpio =3D ...;
> > 	};
> >=20
> >    (i.e. always-running, but disable possible by a dedicated gpio.)
> >=20
> It might also mean that _enable_ is possible with a dedicated gpio.
> That doesn't mean it can be stopped once started. Again, there are lo=
ts
> of watchdogs out there which can be enabled/started but not stopped.
>=20
> > I'm aware that using ...-gpios is more common than ...-gpio. I don'=
t
> > feel strong here, but as only a single gpio makes sense here, havin=
g
> > -gpios seems wrong.
> >=20
> Documentation/devicetree/bindings/gpio/gpio.txt states that gpio pin
> references should be named <name>-gpios. It even lists examples such =
as
>=20
> 	enable-gpios =3D <&gpio2 2>;
>=20
> I thought this was a hard rule, and I seem to recall requests to chan=
ge
> something-gpio to something-spios, but I may be wrong.
Yeah, I'm aware of that. I talked about that in #armlinux yesterday, an=
d
Mark Brown (added to Cc:) said:

	Well, I'd prefer to change the standard TBH and allow singular.
	This keeps coming up and causing confusion for no good reason.

Sounds sensible in my ears.

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
