From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 0/5] Add eeprom to the Olimex series of boards
Date: Wed, 9 Sep 2015 16:05:59 +0200
Message-ID: <20150909140559.GD9885@lukather>
References: <1441790715-11957-1-git-send-email-o.schinagl@ultimaker.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NtwzykIc2mflq5ck"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1441790715-11957-1-git-send-email-o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olliver Schinagl <o.schinagl-U3FVU11NWA554TAoqtyWWQ@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--NtwzykIc2mflq5ck
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2015 at 11:25:10AM +0200, Olliver Schinagl wrote:
> Some of the olimex series of boards feature a permanently connected eepro=
m on
> i2c-1. This patch series adds them on all the boards that have them accor=
ding
> to the spec-sheets.
>=20
> I explicitly added my personal --Tested-by to boards I actually tested.

Testing your changes is the strict minimum before testing your
patches. Just like running checkpatch on them, which you clearly
failed to do, otherwise you would have seen that this is not the right
syntax. Drop the tested-by, fix your SoB.

> There are two boards, that according to the sheets have them as well
> and physically inspecting the boards shows them clearly, I did not
> actually test them on those the boards that are missing the
> --Tested-by.

Then don't send those patches.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NtwzykIc2mflq5ck
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV8DzHAAoJEBx+YmzsjxAgYIcQAJN/5Tk/gdnclkl2fNeKbdeZ
lLdrg1u3TfHhp7+KOWv5PC6wbeHai4eWcJsXEls+GEFdd9IezBKlk0rK5AXOLVu7
jbYMA45nz4BHB8gMpsx5r0PBFRfrY1D5EQgYCgvll2ekGzLQexVLN2Ur0DlmNn8N
ylQnNnsq+vKe9otyCxgIJJ6PDMM1W1btFsTpVdaps689Mlv8SZrs+pZBdlYToT0e
Yk8dMlOOgT07tGDgXrgryWF0rWI4TmJQrTUtqHCltO8ygzJ2cXzaja2ohX6Ttvy0
Lqa6VYnHR30IySj1jEuFn72h8VlEqbKWYBn6vyEppDU/8YXfNOh4A7C8UV4TMvGC
e5Vku89ToZse2o6XeZ6Og4Ok6Pf24ypgvqBEz4kgGMIYVIIqunbkmxathBRyi9eV
nOZpuGponMpzT8CwEL0ZUiGa3oN+k2jkUtBv2wSX/ek605OtnTNJYI9BMv8289cQ
B6pfwsDRyOnO2TGBZ7b8gxlN1/jL9OUNCmhCs1iV8ubVdPpQcS/bmjAGIbj6LiAs
IOF9HbnRcbaMmvj/7jV4Cypk4QPlk7NRqhUYf/L0YhpcjO26VS1XfsA3+xO1pLiw
xPQT1vvuHJxaz2Bi2qln2xPNTiAvfr5nVrTlkppODwHq6V3CAhnrCLn7M8hxIMee
uz/9Oq3GZyaFoPh9g4ll
=1rs8
-----END PGP SIGNATURE-----

--NtwzykIc2mflq5ck--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
