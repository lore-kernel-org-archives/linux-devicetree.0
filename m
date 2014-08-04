From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: Formal license ambiguity in arch/arm/boot/dts/sun?i-a*.dts
Date: Mon, 4 Aug 2014 21:25:10 +0200
Message-ID: <20140804192510.GF3952@lukather>
References: <20140731192016.GA6869@excalibur.cnev.de>
 <20140803130430.GY3952@lukather>
 <201408031959.27607.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/A+0zda39IeytcGG"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201408031959.27607.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Karsten Merker <merker-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, khilman-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: devicetree@vger.kernel.org


--/A+0zda39IeytcGG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 03, 2014 at 07:59:27PM +0200, Arnd Bergmann wrote:
> On Sunday 03 August 2014, Maxime Ripard wrote:
> > Thanks for reporting this.
> >=20
> > From a quick grep, the issue is actually broader than just
> > Allwinner. At least the following platforms seem to do the same:
> >   - mvebu
> >   - axm5516
> >   - bcm
> >   - berlin
> >   - ea3250
> >   - ecx-2000
> >   - highbank
> >   - imx / mxs
> >   - lpc32xx
> >   - phy3250
> >   - picoxcell
> >   - shmobile
> >   - rockchip
> >   - socfpga
> >   - spear
> >   - ste
> >   - zynq
> >=20
> > Would you mind sending a patch to fix all these?
>=20
> I would actually prefer if we could migrate a lot of these files to BSD l=
icense,
> provided the original authors agree. We want the dtb blobs to be embeddab=
le into
> boot loaders of any license.

Even though I'd be open to having my contributions to DTBs under the
BSD, is this really a thing?

I mean, for all I know, an OS/Bootloader would just parse a documented
binary file, and I don't see any derivative work there.

The same argument could be made for example for u-boot modifying a
DTB I guess.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/A+0zda39IeytcGG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJT394WAAoJEBx+YmzsjxAgzXkP/jRz6iE4O89bnLiCiFe6Ewku
fsZc5VlecZmqhrJQzGciGZEVvxs+7yJJ8A+9JZhvf6Uon0Q1JcKjnJco6TBqDbsc
kxbXJPhUEm9X4jsqvCTZSCMRNusivDs48EgJC5gEWQL3QqEPInbzrPsdL0v5jGka
H6zFjJhv3uK1oC2Nlz8iUiBhwU6UYW69G/D3siyTo6sqqIlvK036Yyo1BDZFCyAS
upZpnHeXykIb+LgjZufVCdCdh/2Y2QehtoyBw+g/YwI3wHVxxrpIuuU5ZNcq+K1S
J8zJcjs6DcjdyN9dZLjgq7n1QJvR1V0nDuqXcgd8uzQjPMT06Jjmb/HhNW9tLMTR
aoPF9M1O/SNXuUKhCRLQjobHjfvkYFeQYIPZegz2ScW43/e+o2tuHDrtXnfxxi11
DXXWSo4mDZeG7Nzo0IbjY/s6IydimsZ4ETKGPIfRrUmZ4WOwQylgklaUpF4fe5g6
f38QoxIvpP/hP6V4KKTFPUmHFL+Slvt+6y72OSamzBERTUebYhx2EXf2khYkxNwx
TdGXNptngUIMqCxNsbkbnhBXylBW1z9SyNpNLstSmGAcIlFYmKbI9vPKtzpOYpdQ
roqLKVV4H2IRRvDB8Mz9cC2RzhPHXZP70IwwN6zA5rWJX7qHe6hixkyxWKykzsW3
E0dXjf9JQdgwb3CiUS8g
=v45e
-----END PGP SIGNATURE-----

--/A+0zda39IeytcGG--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
