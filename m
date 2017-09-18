From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v4 3/6] iio: adc: sun4i-gpadc-iio: rework code for
 supporting newer THS variants
Date: Mon, 18 Sep 2017 09:36:01 +0200
Message-ID: <20170918073601.oiqshnhhl7yb6fv2@flea.lan>
References: <20170914145251.21784-1-icenowy@aosc.io>
 <20170914145251.21784-4-icenowy@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="k6i73kubcroskaqa"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170914145251.21784-4-icenowy-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Jonathan Cameron <jic23-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--k6i73kubcroskaqa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 14, 2017 at 10:52:48PM +0800, Icenowy Zheng wrote:
> The SoCs after H3 has newer thermal sensor ADCs, which have two clock
> inputs (bus clock and sampling clock) and a reset. The registers are
> also re-arranged.
>=20
> This commit reworks the code, adds the process of the clocks and
> resets, and allows the sampling start/end code and the position of value
> readout register to be altered.
>=20
> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>

Please split that into separate commits.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--k6i73kubcroskaqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZv3dhAAoJEBx+YmzsjxAghGYQAKSCmBG//hWKCq+3bvDpF9o4
Cky+KRpV5SnFUbMO9cOXDcen64zm8mjkPeXGxcDsS6QVSsoqYm+5mxJ6ckR0OPT8
2TNzxEY5qoYlOGEbEcrg38XqjiOhQHAZYYNLQq9iMzl14u8ObKjMya2eTM6nemHR
bAPQ3ZsY3P0wyxMzoYJsylF7pcA4J8tELmbwPa3HDHSY0l0lWloiiXeIt2iev5NR
4nURX8JN+6j9V75ii4YRpeTLox8H8vDbbLsBrg4tb83BGzP1rZH/0o9PqSuw3cw5
i4hGsSGyGIvhMiWjXNb5p+I/16dypTV2n2dBzWpQOpjl9P6Sc0gSNURsHUeN6vIl
IAqja1PScGEs+1qDKQhAr/qo5NJcZaS/6aJzVVpvREewMViqF6YLqfr+SwZ0keBr
6OAFb5iLChFPa/QRBrOd0biHOIhjKKOeEf/nAh4drFkOhQGNqZNFHkgPwCyl+p/L
av0D1C3m8etq3jc05iKw8yJJVacIUJ2iqOQSv5Ees0Ms6XFrXhl7Jn1qs3IGoiDR
SvPl+SCXaPG9V9ohADJ1KWm+BmI6Hf/7WAV03oY1EHHlE8Ww/+/ft6wQ02lG43yS
kTp3YI+r2W7ns891tSNfd5kx8josEs48N1365KWUSCV53tthowEAer8LbtaUDutx
JMPRzaCmQeotldLje2AP
=s+J3
-----END PGP SIGNATURE-----

--k6i73kubcroskaqa--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
