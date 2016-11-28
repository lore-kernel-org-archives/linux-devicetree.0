From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sunxi: Enable UEXT related nodes for Olimex
 A20 SOM EVB
Date: Mon, 28 Nov 2016 12:19:18 +0100
Message-ID: <20161128111918.kbkfmn554rlgeiem@lukather>
References: <20161121164911.76900-1-manu@bidouilliste.com>
 <20161123080350.fstwdfndghk7c5xx@lukather>
 <20161123181610.cae67ad53f5f69246d341b30@bidouilliste.com>
 <20161124210834.a7da24a53b09364e8ab391d6@bidouilliste.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="zhfijqfwtsplydcw"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161124210834.a7da24a53b09364e8ab391d6-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
Cc: mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--zhfijqfwtsplydcw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 24, 2016 at 09:08:34PM +0100, Emmanuel Vadot wrote:
> On Wed, 23 Nov 2016 18:16:10 +0100
> Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> wrote:
>=20
> > On Wed, 23 Nov 2016 09:03:50 +0100
> > Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:
> >=20
> > > On Mon, Nov 21, 2016 at 05:49:11PM +0100, Emmanuel Vadot wrote:
> > > > UEXT are Universal EXTension connector from Olimex. They embed i2c,=
 spi
> > > > and uart pins along power in one connector and are found on most,
> > > > if not all, Olimex boards.
> > > > The Olimex A20 SOM EVB have two UEXT connector so enable the nodes =
found on
> > > > those two connectors.
> > > >=20
> > > > Signed-off-by: Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org>
> > >=20
> > > Fixed the indentation of the spi pinctrl cells, and applied.
> > >=20
> > > Please note that I'm note planning to send any new pull request, so
> > > this will likely end up in 4.11.
> > >=20
> > > Thanks!
> > > Maxime
> > >=20
> > > --=20
> > > Maxime Ripard, Free Electrons
> > > Embedded Linux and Kernel engineering
> > > http://free-electrons.com
> >=20
> >  Sorry about the indentation, I'll be more carefull next time.
> >=20
> >  Thank you.
> >=20
> > --=20
> > Emmanuel Vadot <manu-xXdDKFdH5B3kFDPD4ZthVA@public.gmane.org> <manu-h+KGxgPPiopAfugRpC6u6w@public.gmane.org>
> >=20
>=20
>  Hi Maxime,
>=20
>  Re-reading the patch I've seen that I've not enabled the SPI nodes, I
> guess it's easier if you revert my patch and that I send a new one ?

Just send the missing nodes, I'll squash the two commits.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zhfijqfwtsplydcw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYPBKyAAoJEBx+YmzsjxAg1N8P/32OeLqY7kikwgBKNceCV0HP
q2+doIefszvscNI5dHll/qL3HoZBwqd1KLzWfpRivnAk9oPxCqwecpiF0Udq/+Yk
81Knopm/hjxIF2C/I93d1tYjNvaZGCRSTO2MmJaoHhA0vl1HoEk5q08RkcAoxV8d
hmoD0iEg3ceecPrwdAEoEtGIYWo3XmRmy4r/Ou6Za4AVjHcxfcdyTKtCmdJgPeGg
4x+nOLq68eL+Pm0hLekY+ZE6Sq9lVFC0K1Pc55vsgK929+hUkqc+gVCenp93jBba
7fB/nM3r9YWMsXnCJ+zXt1ehT9kaU2Zp98JYIYsLVZRHEJsT/FcyBkdrB55b8vZG
qnqlV1Ty4Jd4boSDqtgODcFqMKXs4LO4sz7iO8uCiofjGOtdn8z9Huyp0kWnXGMs
7flIJ5qDOlbEqi+HHqABZlp1PPx/ou9YfTAi8qqdp+dFmNJ+IWtEicKG1y83wo9Y
3GP1tXqIFSHMAKHd8OLa8MdOR2wJOnf87c8lEODNJ2fcc88jz4+e47HSDjw72Ygf
Y+YBh5H7ZAfjNRp34DsNjaBxKsnEDYUv64F4xO38UjZeQpkjnX5wrde1b+SA65Lz
Z/ySHtDuaub0APtL7HYn4tbyJRnG12F1phpXYfitRtf4R1mrp+5Km8AqSmBrXzJu
CECqdDoSmwPq6u2F4Ejn
=PJuU
-----END PGP SIGNATURE-----

--zhfijqfwtsplydcw--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
