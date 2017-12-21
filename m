From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: sunxi: Add sid for a83t
Date: Thu, 21 Dec 2017 15:55:12 +0100
Message-ID: <20171221145512.llxvzkcrjpquhczi@flea.lan>
References: <20171219210523.10428-1-kevans91@ksu.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45rdbikbqoxtunmt"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171219210523.10428-1-kevans91-OYTqUY/oFF8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: kevans91-OYTqUY/oFF8@public.gmane.org
Cc: Srinivas Kandagatla <srinivas.kandagatla-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--45rdbikbqoxtunmt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Kyle,

On Tue, Dec 19, 2017 at 03:05:23PM -0600, kevans91-OYTqUY/oFF8@public.gmane.org wrote:
> Allwinner a83t has a 1 KB sid block with efuse for security rootkey and
> thermal calibration data, add node to describe it.
>=20
> a83t-sid is not currently supported by nvmem/sunxi-sid, but it is
> supported in an external driver for FreeBSD.
>=20
> Signed-off-by: Kyle Evans <kevans91-OYTqUY/oFF8@public.gmane.org>

The patch looks fine in itself, but we've had a number of issues with
the register layout (and access patterns) in the past, so I'd rather
have something that works in Linux too if possible.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--45rdbikbqoxtunmt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlo7y08ACgkQ0rTAlCFN
r3Sdtw//RjUAn+nlailzQ/dY7RubBYMwb0uvUBqTgIkGy4IM4PezPsYyWiy+fY9R
xxyi+sFLpV4iF7NjAwekJpqmrHdEvP2dYmbrcoM7TYF6A89Li8qiQI25V4YCL6Jf
IbqceaF8n9wMV2mFhoLkvJwsfnh5ESCbh+VnPaEvKK42hKQ+06MI4OoP4JguwYJb
rM58xdvegiGf02lE3Xymv9t9+wg5JNMWGEtGB4B//kaTGrPqdrjrny1bbrGHPliR
cn+PqI1ArYZhVlDwJHy9ROWzrYHl82N+5utJ9sqR82rUGZYvjN6hfycBTd3vPGQi
oOijzNc2rk3fB0eaDjEuJTv5mJe52E8EFZZllOd1WQhV6xxU5iAr0fgZr8p1K47k
Hku1jc38ebwMJI3mvovDpRCUcDf5tNeVGyDznIy0QNOsiRwa5WM+MSJ2MUrBmefF
ytsJfl0kk2Kq8f62t6EFwf979HIGs/treY41pjvW0UzGKYA2t6oHumKvOHZ4DZqP
Qv+KCUboKNSMSxK3I3C+P5n8C7N6JsfezG18DPbRSzP+WKLkn1DWbHqd7HA0vHy7
m6fM5PJ0zMr9CCL2aC9pnLJBt1+/CGnGbC0oOkVbk/QTrZ8qrMAZF2tSzJF1fcPR
XWdIlzT7rswjjCg9SqKXfFG0wuWpVtVNI41nuiR1fiaB003WVoU=
=+ESd
-----END PGP SIGNATURE-----

--45rdbikbqoxtunmt--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
