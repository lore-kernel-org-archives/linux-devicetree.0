From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 14:51:16 +0200
Message-ID: <20140902125116.GW15297@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather>
 <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
 <20140807132023.GG15297@lukather>
 <20140902102206.GU15297@lukather>
 <20140902104002.GN30401@n2100.arm.linux.org.uk>
 <20140902122716.GV15297@lukather>
 <5405B986.2080407@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+GPapXTpahFv7+Fr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5405B986.2080407-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--+GPapXTpahFv7+Fr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2014 at 02:35:18PM +0200, Hans de Goede wrote:
> > So I guess like Chen-Yu suggested that we should change the license of
> > the DTSI first, and then the DTS. Otherwise, it wouldn't work very
> > well, I guess you can't really relicense a GPL-only file.
>=20
> IANAL, but mixing MIT (which I suggest use as the other license) and GPL
> files in one binary (the generated dtb file) is fine AFAIK, this happens
> all the time. The resulting binary is simple GPL licensed. So it would
> make sense to start with dual licensing new boards right away even before
> the dtsi has been relicensed. It won't make any practical difference
> until the dtsi is relicensed, but it means less work later on.

So you're allowed to licence derivative work of a GPL-licenced file
under both the GPL and another licence?

And as far as MIT vs BSD is concerned, I don't really have an
opinion. Arnd? Russell?

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--+GPapXTpahFv7+Fr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUBb1EAAoJEBx+YmzsjxAgILUQALFEbJ75oEEexI75qpLxOHuV
luE9YTILsMTLEDWTzhuXjU8E6i00xO7z6Lj/Z3GyiEdcdA7J+AgZNNesJIQjNEY1
mzjAtqiOK2aDQtERPquxM3dvraaaKRzIWtZrS29xgT+sus5i6KeNPZ0OAmorXT4Y
b4zBmWXBE/5JyG0dxKT9x7TH0Hfbcr50MfilpRBtZ2vHOjQe0ILrHfKP6SSsUuMT
Pqx5EhCSK/scVyLTexc6s6zY8gmUOJ2i71g0LfeqPFocvzKBn7s0sFDSaCpAvkqC
3q4OJyzYoKAlbIUwdOK5fz+PUO6/CRmzLUXCAHeHF0cwsUZSnlKYYrR9q4rIGI2f
Dpdqqe0R3sHVsQJazfnej2JIwwaSsiByP/K+t84a66vOcljci2fJTRWAKC47yHXT
tYD22ZwD6fIL8QmxOUEYdj6cju60ksGkjGI0/ND4J7dlywVz3mniDiy7+gP+o1uG
AGZZodA/Xx8Iucpr2uVQrHiFpiuYTZx7Q/pd6gui1IIxWiHxzV9iKGE2lll4BccD
kAyBy0uApcHhfJ+NB7AFn0J9BfxcqJI+1yy5O1+Yp9qDj8ylXSjSUQ0YSLmnjUBv
1Hx0L/3AHIXQoOKJW7MzSzYyxfuduZ/t3htG9p+v9KlEQP7Exky675XSko3vpXlh
EldgdHjqzBlx6WIbjuJh
=oeMz
-----END PGP SIGNATURE-----

--+GPapXTpahFv7+Fr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
