From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 1/2] Documentation: Add GPIO reset binding to reset
 binding documentation
Date: Wed, 30 Apr 2014 11:29:47 -0700
Message-ID: <20140430182947.GF3000@lukather>
References: <1397463709-19405-1-git-send-email-p.zabel@pengutronix.de>
 <20140417115820.GD4132@lukather>
 <1398848062.19894.38.camel@paszta.hi.pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="L+ofChggJdETEG3Y"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1398848062.19894.38.camel-+qGW7pzALmz7o/J7KWpOmN53zsg1cpMQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org


--L+ofChggJdETEG3Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 10:54:22AM +0200, Philipp Zabel wrote:
> Hi Maxime,
>=20
> Am Donnerstag, den 17.04.2014, 13:58 +0200 schrieb Maxime Ripard:
> > I still feel like we should really treat gpios like just another reset
> > controller, ie. using the resets property.
>=20
> I now feel like we really shouldn't. If we do anything but use the
> generic gpio bindings for reset gpios, we might force every OS or
> bootloader using the device tree to implement some kind of reset
> controller framework, even for hardware that only has gpio resets.

Well, we pretty much introduced that requirement already whenever we
got this framework in the first place.

You can now expect pretty much anything, even a CPU or a timer to have
a reset property, so you have to handle them anyway.

So I'd be much more in favor of consistency both with other frameworks
and within the reset framework itself.

> > I understand that you chose this pattern to be pretty much compatible
> > with what have been done so fare, bu I don't see how to fulfill that
> > goal completely, since most of the devices are actually using
> > reset-gpios, but some are using other names too (including
> > reset-gpio).
>=20
> Yes, that is a problem that applies to all gpios, not only to reset
> gpios, though.

Indeed, but you're the only one I can think of that have tried to
factor the gpio handling in the framework after the facts. All the
other either have no standards and let the driver deal with it, or
have explicitly asked for a given property name.

> > So if we can't be fully backward compatible, I don't see the benefit
> > of being inconsistent with how reset controllers are used in general,
>=20
> See above.
>=20
> > and more globally on how gpios are tied for regulators for example.
>=20
> Reset controllers are rather more similar to gpio or interrupt
> controllers. Those also have a number of entities per device node,
> as opposed to regulators.

Well, that depends on the bindings actually. The fact that the reset
controller can handle several reset lines is dependent of the
controller itself. And I believe we can say pretty much the same about
the regulators.

> > That would also make reset-gpio a regular reset driver, instead of
> > adding logic to the core itself to handle this special case.
>=20
> Which is what I initially tried and moved away from.

Yeah, I know.

Overall, I'd very much like the DT maintainers to step in on
this. Especially after the discussion we had again yesterday about the
stable DT bindings things.

Stable DT bindings only works if the DT maintainers can do some
arbitration in this case.

Mark? Ping?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--L+ofChggJdETEG3Y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIcBAEBAgAGBQJTYUEbAAoJEBx+YmzsjxAgFWgQALP3iKjnRxCRoOAroZuL/gZj
WNvR1rvqtZf26r4I0V5r8581m9L3B/Aly6r0BhMDVSGAHNuKYkkE/Uj4uv4ZW1s/
xPz6GSrLHVMim1awP+3OL2tRUFM3ZJhqdv7JKbIAVNWTsXCC65Afi/b9eb+bcF1W
3hR/CbP/FYw24vayABlctTwM4R4J/6WD/JM9FO6EJYSKBs08LP9VlZau4sv13nMg
g3v0w+8MIqGSYayOLdfjMcBj+sWJJVddCIQR3ZQPPNlHDr5o8Tt+Jo6mSUagDzJu
yhL14tbqdj6PgUviIFfsP+TOU5oPa/gIGJv+oRH9s22hzahK5zSLEJkg2BlgJqBg
Lwxf395HxsQn1L/svWoylFyy/zq9HZ7a//VHa9TJQXtsHClPdhsH1IfrfOLerFN5
fiWVVi5SaJ/k+oyTvnJvJCxbowpkRUsq9vsuCw4nWeijb4HKlC8iOMzxqTcrhMc8
y55bSYQBdksXnY0mOkCQ9ZyirpEDuwAWOak3ZR/SolP339OGkabRYzpHgsOd6HQd
G1SKy/rOaNhKp6J2/6v2+x0oH3CzqGwI4/NgrJ67HvykNK4m/xLSZOBnj0wmn/RJ
/vr7BMb1ZjppBYhANL80qAggC1U1D9CfYW5E94P5lGVkp/lp4n9hDQCvcf4Q40o+
bOTVRh4doviqGhz1HXhV
=fcIC
-----END PGP SIGNATURE-----

--L+ofChggJdETEG3Y--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
