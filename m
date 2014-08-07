From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Thu, 7 Aug 2014 15:20:23 +0200
Message-ID: <20140807132023.GG15297@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather>
 <201408031959.27607.arnd@arndb.de>
 <20140804192510.GF3952@lukather>
 <20140804212317.GL30282@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5L6AZ1aJH5mDrqCQ"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140804212317.GL30282-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--5L6AZ1aJH5mDrqCQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Russell,

On Mon, Aug 04, 2014 at 10:23:17PM +0100, Russell King - ARM Linux wrote:
> On Mon, Aug 04, 2014 at 09:25:10PM +0200, Maxime Ripard wrote:
> > On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> > > I would actually prefer if we could migrate a lot of these files to B=
SD license,
> > > provided the original authors agree. We want the dtb blobs to be embe=
ddable into
> > > boot loaders of any license.
> >=20
> > Even though I'd be open to having my contributions to DTBs under the
> > BSD, is this really a thing?
> >=20
> > I mean, for all I know, an OS/Bootloader would just parse a documented
> > binary file, and I don't see any derivative work there.
>=20
> How does the OS/Bootloader end up with that binary file?
>=20
> For the sake of argument, let's say that the BSDs want to move to DT on
> ARM.  Great, they convert over to parsing our DT blobs.
>=20
> However, they can't distribute the binary DT blobs to their users without
> coming up against the problems of the GPL wrt binary distribution.
>=20
> They could distribute the source files, but remember that many of those
> are currently GPL licensed, so they'd probably end up having to package
> them entirely separately, if they're willing to do that at all.
>=20
> Or they could decide to ignore us altogether, and do their own DT stuff,
> maybe partially implementing our properties, or maybe coming up with
> different and/or incompatible properties - which would be bad because
> we now end up with two ways to describe the same hardware in active use.
>=20
> I suspect the final option is the one they'd choose, and it's in our
> interest that _that_ doesn't happen.

Ah, yes, it's not really about a fear of a GPL-spread, but rather a
concern about the source distribution. Makes sense.

How should we deal with such relicensing?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--5L6AZ1aJH5mDrqCQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT430XAAoJEBx+YmzsjxAghWMP/2qBYi55tRKUgYCVyhrj9gfH
yfd6yU9NWe5/A5wfVXMM0rTD5/iFGTsp+uOm//pl1e7LifXzTlDVfbo9CmuRi4yI
CSBbl6l0tY96NMxkKPH8nD6uYODhbX2yAesGemqgvqED/PD6kdh11dNHy0mKnuPl
3+YnY6JIf1YUjWZ0CXRZzzURA2ukzYFl13vSO29LtYffDN8G+MIWQJ4A6y4fFn7W
CDWTygTGkJpGLKEKKiSLDCmcdIF0fR4ROATug4ohpjox2YtxOxEoegVY573YURGt
AGLnVwLTCyMI5idarWX2G8upEkMLHoYXOffMhNlFg1/WS1ur6lsaouQxFjv3XFho
hcYwqUQ5dCbI7qBdMXe2U7SbS3swBRAnZuKf+d66BgEZI/M4mJ4x048KAMT4ctjH
6z5Va+CuBY1kohQtRqFquBJJMhvYLPmMfXQMIz2fq9hJkoxv7Fwqh6Nr2zhrNAa8
sWsfk87pmd2UqFeREdfx62HqHNe7IWW+/Qtk9pREPdDAxVPCZFCF3Ve6bBYH9JvX
Z+z7QtGd199or1jrgLA5VIQXKlSdlD4h9OKVvqyBkrhd4t1CDT7eQNz3umUOmER2
QTOuhuspw2kM4Y8Mn6svd0Hnyvq7wM3LJWlmr9bl8RxoH5UHfTPlPKbTvxA623iG
3NZZon6o6rwtLOY+qHNg
=FDDe
-----END PGP SIGNATURE-----

--5L6AZ1aJH5mDrqCQ--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
