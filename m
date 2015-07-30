From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [RFC] improve binding for linux,wdt-gpio
Date: Thu, 30 Jul 2015 09:25:33 +0200
Message-ID: <20150730072533.GJ15360@pengutronix.de>
References: <1438115628-2819-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <20150728212155.GA18137@roeck-us.net>
 <20150729073513.GB15360@pengutronix.de>
 <55B9C102.50608@topic.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55B9C102.50608-Oq418RWZeHk@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Looijmans <mike.looijmans-Oq418RWZeHk@public.gmane.org>
Cc: Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexander Shiyan <shc_work-JGs/UdohzUI@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hello Mike,

On Thu, Jul 30, 2015 at 08:15:30AM +0200, Mike Looijmans wrote:
> >I'd go for these properties then:
> >
> >	toggle-gpio: the gpio used to stroke the watchdog
> >	enable-gpio: optional, the gpio to enable and disable the watchdog
> >	disable-on-tri-state: optional, signals that the watchdog can
> >		be stopped by setting the trigger-gpio to tri-state.
> >	compatible, hw_algo and hw_margin_ms: as before.
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
>=20
> I don't see any change in the number of properties required to
> describe things. So the driver just gets more complicated,
> especially if you want it to be somewhat backward compatible.
I think the backward compatibility stuff isn't that hard to implement,
but I'd like to first agree on a sane description.

> The way you describe how one could get the "always-running" effect
> doesn't really sound intuitive. It's much easier to just have a
> property that plainly explains that the watchdog is unstoppable,
> than that that is the result of combining a bunch of seemingly
> unrelated properties together to get the driver to do what needs to
> be done.
It's not more complicated. In the state as currently documented you
have:

	def disable():
		if (has_property(always-running)):
			it's unstoppable
		elif hw_algo =3D=3D "toggle":
			set to tri-state
		elif hw_algo =3D=3D "level":
			set to inactive

With my suggested binding it's:

	def disable():
		if (has_property(disable-on-tri-state)):
			set to tri-state
		elif (has_property(enable-gpio)):
			set enable-gpio to inactive
		else:
			it's unstoppable

This is quite similar, but it handles more hardware (i.e. the chips wit=
h
an enable gpio). The only added difficulty I see is that you might have
to handle toggle-gpio (or input-gpio in the latest suggestion) =3D=3D
enable-gpio to model chips that are disabled by a certain level of the
input gpio (as currently modelled by hw_algo =3D level without
always-running).

(So yes, it's easier with the current model to find out if the watchdog
is unstoppable but that alone doesn't help you.)

> >I think we agree here, that "always-running" is a hardware property.
>=20
> I'd that "always-running" describes both. The driver must be always
> stroking (what a nice word) the watchdog because the watchdog is
> always watching.
The driver-part is about policy. Maybe you'd prefer the driver to not
autostroke because it should reset the machine instead.

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
