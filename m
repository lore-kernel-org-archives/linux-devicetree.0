From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Tue, 2 Sep 2014 12:22:06 +0200
Message-ID: <20140902102206.GU15297@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather>
 <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
 <20140807132023.GG15297@lukather>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y3m32dcgE5dp77SC"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140807132023.GG15297@lukather>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Y3m32dcgE5dp77SC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2014 at 03:20:23PM +0200, Maxime Ripard wrote:
> Hi Russell,
>=20
> On Mon, Aug 04, 2014 at 10:23:17PM +0100, Russell King - ARM Linux wrote:
> > On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> > > On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > > > I would actually prefer if we could migrate a lot of these files to=
 BSD license,
> > > > provided the original authors agree. We want the dtb blobs to be em=
beddable into
> > > > boot loaders of any license.
> > >=20
> > > Even though I'd be open to having my contributions to DTBs under the
> > > BSD, is this really a thing?
> > >=20
> > > I mean, for all I know, an OS/Bootloader would just parse a documented
> > > binary file, and I don't see any derivative work there.
> >=20
> > How does the OS/Bootloader end up with that binary file?
> >=20
> > For the sake of argument, let's say that the BSDs want to move to DT on
> > ARM.  Great, they convert over to parsing our DT blobs.
> >=20
> > However, they can't distribute the binary DT blobs to their users witho=
ut
> > coming up against the problems of the GPL wrt binary distribution.
> >=20
> > They could distribute the source files, but remember that many of those
> > are currently GPL licensed, so they'd probably end up having to package
> > them entirely separately, if they're willing to do that at all.
> >=20
> > Or they could decide to ignore us altogether, and do their own DT stuff,
> > maybe partially implementing our properties, or maybe coming up with
> > different and/or incompatible properties - which would be bad because
> > we now end up with two ways to describe the same hardware in active use.
> >=20
> > I suspect the final option is the one they'd choose, and it's in our
> > interest that _that_ doesn't happen.
>=20
> Ah, yes, it's not really about a fear of a GPL-spread, but rather a
> concern about the source distribution. Makes sense.
>=20
> How should we deal with such relicensing?

Ping?

Are we doing this on a per platform basis? Should we enforce this dual
licensing for the future DTS patches? If so, starting from when?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Y3m32dcgE5dp77SC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUBZpOAAoJEBx+YmzsjxAg9PcP/jdNbQRUZI7be+OtXbqFT9GK
80kXBQT99dlej67vhT5AvlMofw2Ne5vUIf/QseBPjk5P0SGzm24lTCGNdKOtfCSo
RPv84YdL81RPc8gUtji41ovqg/v1OIfvTtgUfWPeFZka1T8uQtdhm8M4Fo6y7neM
QdD81758P6L0TV1sfALaUoiAjq7fVJ4TSE9JI5rs6KbqCKZdc2Op+ygwq/xsYG88
h6NJtoMSYptjZXwY9HgqBNthUmjXAmYLsifiA6xu6rT0RUeHBYiWwyRAn4T1P/ZB
K3bF7XPdl32uytF+KZkXIbhpHN+y2XSXeUGfzIJGxLkb7ZNtnb8VtJZ0L3DfeY4/
1kUj1DYqk4d05oGDYnVHRK5zLVG7GYg+M1u9fu0+a0dWmBgCfIOAtl4DrjUjuW9H
0kbyjJ8IUMsRLgCG914iKu0fGAo/DszvP6whQ7CEmlGegHFdPI3tDVELNR4GRMTO
enmLinXYH5Udl+HgeslyCmJ72T11KqQ8lHN0S8p7Imoo/PSFhfHyPVDWkCapJI5v
HoiheN79ddEW/vIac6S3A2bf514kMV2RcC7cKd7WIvcNUZF5hP/kBkqV2glIJyC+
rs+0qFHmoR3C41a4e47VAURXZ6h45F45kzYrAOO45mfIIpbcSdhLIlA8DiaKuKsQ
CnYO+GDzrfvxJTxTnog7
=nORi
-----END PGP SIGNATURE-----

--Y3m32dcgE5dp77SC--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
