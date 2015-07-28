From: Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH v7 5/5] clk: dt: Introduce binding for critical clock
 support
Date: Tue, 28 Jul 2015 11:32:22 +0200
Message-ID: <20150728093222.GV2564@lukather>
References: <1437570255-21049-1-git-send-email-lee.jones@linaro.org>
 <1437570255-21049-6-git-send-email-lee.jones@linaro.org>
 <20150727071013.GO2564@lukather>
 <20150727073149.GV3436@x1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="6Jy4/gb9ZgnsEOX8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20150727073149.GV3436@x1>
Sender: linux-kernel-owner@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel@stlinux.com, mturquette@linaro.org, sboyd@codeaurora.org, devicetree@vger.kernel.org, geert@linux-m68k.org, s.hauer@pengutronix.de
List-Id: devicetree@vger.kernel.org


--6Jy4/gb9ZgnsEOX8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2015 at 08:31:49AM +0100, Lee Jones wrote:
> On Mon, 27 Jul 2015, Maxime Ripard wrote:
>=20
> > Hi Lee,
> >=20
> > On Wed, Jul 22, 2015 at 02:04:15PM +0100, Lee Jones wrote:
> > > Signed-off-by: Lee Jones <lee.jones@linaro.org>
> > > ---
> > >  .../devicetree/bindings/clock/clock-bindings.txt   | 39 ++++++++++++=
++++++++++
> > >  1 file changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.t=
xt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > index 06fc6d5..4137034 100644
> > > --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
> > > @@ -44,6 +44,45 @@ For example:
> > >    clocks by index. The names should reflect the clock output signal
> > >    names for the device.
> > > =20
> > > +critical-clock:	Some hardware contains bunches of clocks which, in n=
ormal
> > > +		circumstances, must never be turned off.  If drivers a) fail to
> > > +		obtain a reference to any of these or b) give up a previously
> > > +		obtained reference during suspend, it is possible that some
> > > +		Operating Systems might attempt to disable them to save power.
> > > +		If this happens a platform can fail irrecoverably as a result.
> > > +		Usually the only way to recover from these failures is to
> > > +		reboot.
> > > +
> > > +		To avoid either of these two scenarios from catastrophically
> > > +		disabling an otherwise perfectly healthy running system,
> > > +		clocks can be identified as 'critical' using this property from
> > > +		inside a clocksource's node.
> > > +
> > > +		This property is not to be abused.  It is only to be used to
> > > +		protect platforms from being crippled by gated clocks, NOT as a
> > > +		convenience function to avoid using the framework correctly
> > > +		inside device drivers.
> > > +
> > > +		Expected values are hardware clock indices.  If the
> > > +		clock-indices property (see below) is used, then supplied
> > > +		values must correspond to one of the listed identifiers.
> > > +		Using the clock-indices example below, hardware clock <2>
> > > +		is missing, therefore it is considered invalid to then
> > > +		list clock <2> as a critical clock.
> >=20
> > I think we should also consider having it simply as a boolean. Using
> > indices for clocks that don't have any (for example because it only
> > provides a single clock) seem to not really make much sense.
>=20
> Then how would you distinguish between the clocks if the provider
> provides more than a single clock?

What I had in mind was that, you would have three cases:

  - critical-clocks is not there: no clocks are made critical

  - critical-clocks is there, but doesn't have any values: all the
    clocks provided are marked critical

  - critical-clocks is there and it has a list of values: only the
    clocks listed are marked critical.

Does that make sense to you?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--6Jy4/gb9ZgnsEOX8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVt0wmAAoJEBx+YmzsjxAgcCYP/jwj+pMRdvkORvlRwhG+unL5
bffXUgEcskccJkg+/AF5KjZwiqKu4QvOs4ENOuZZbq9hz6399kWGuUXgeYYhnFk9
7uCUyJMPsUi5pjh9RAe6VpuDfYJbzcgVVfa/tS5bl78+cr6ZmcybQwiRvyopdJvc
ImQTTrjwVwX30BbZRt15Ucnc59OPU2BWOu9w+oX51bneip1deePsW6cORZtvZova
cp0XG06jxiGf0g71x7SGjTsIRbjCxsKtipzA/o8lKK3UY8MrJVQYNHRb/aHp39ZA
czH9zHV0zY71lnjltLeO0CkCphGbJPVKJnf1aU1aG6XKpfZngDaYhKJxKgc5Y0Sp
btOQYnTHAenUPGbloWtzLXOFIEk5PnZAuXKdl1h+p0V9l5Gg1BudL3xaunqNhidE
tQg54wPrLKQKV5SGy48Sn2Ra+cXKe0eVp7ColHRrxu0qGO48mV/h1xDRyIRdP5jS
E7rf4P0Oh64nLUNpziufKnCtDAgLXA6YFNd/FjKolP3L+y2KWuOM5NYH3WHrzLfk
kgqTTfqeIXTNojGDXPAsmM7edEgVn39xxn8B/edELeJqJM8aoSxAGoZ5rWjddDVE
acGYhvnqNtFt/317hIu5w1FZC8bNyXMP0GMhdSu7FJFvcX5zF82CGksyF41d29Pp
mayll0EH9NAyVpTmTRn+
=Qvin
-----END PGP SIGNATURE-----

--6Jy4/gb9ZgnsEOX8--
