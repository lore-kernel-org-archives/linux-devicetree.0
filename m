From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 1/5] dt-bindings: Add support for LG LP079QX1-SP0V
 1536x2048 panel
Date: Thu, 7 Jul 2016 23:52:01 +0200
Message-ID: <20160707215159.GA744@mithrandir.ba.sec>
References: <1467089288-18355-1-git-send-email-ykk@rock-chips.com>
 <1467089472-18584-1-git-send-email-ykk@rock-chips.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1467089472-18584-1-git-send-email-ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
Cc: Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 28, 2016 at 12:51:12PM +0800, Yakir Yang wrote:
> The LG LP079QX1-SP0V is an 7.9" QXGA TFT with LED Backlight unit and
> 32 pins eDP interface. This module supports 1536x2048 mode.
>=20
> Signed-off-by: Yakir Yang <ykk-TNX95d0MmH7DzftRWevZcw@public.gmane.org>
> ---
>  .../devicetree/bindings/display/panel/lg,lp079qx1-sp0v.txt         | 7 +=
++++++
>  1 file changed, 7 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/panel/lg,lp=
079qx1-sp0v.txt

Applied, thanks.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJXfs78AAoJEN0jrNd/PrOhpNwP/3iChpWy4kGRJ+JWFKh4bbzr
YCAMukW/8SWn7dd5JaGp/9Ef2IyCo4P9KTlqRQp0aqjMEaz7xGRfCMBB71mdw2le
Ixx1Wi/00+mOkkms5MM+bhSIbmvw8sYeVHSbY8JcgYw8uMyNf54x+Lnb8IguTvFL
ryOoklWMjNdZX65I8PTSRih6EvivxK0ZR4Ube5c4SWw5oWBtQbHVDMNEWxrjloqO
HLIZcJ4pv45GnWHWAauvOOtyfkDkKoVbZ3m/NqWLngNvFhUIQiBl4T8XICRM68t9
wH/byIdNoI2+Ku0O7/hbc4gx+5nDmw1iJYtyuf9QWyWKCi89j3f0r7gGY3UQNfOv
lis53iV+Nch02/Ii+848aZnUPImIh9r4E5Qj2mOvAdbRO50aSwdOljCTECsk/RWL
DSBTfD25LPhr9BPjmaCgvoeBSjdRxB8/PSZgpObp4MQZ2XiCf2pBSCStnhA9h8WY
xbVm6oypaYcUi86w49YToMQYpZ6OFju5aQFQNJTm6wjXlYBsGKPx5UXsNCxYZ4Q+
r70EyYZ5isWvTFrplOmriYYiVEgkRh10GrsUBUtal2DF4tXnHgoIdwYoY17tBc5k
rPsFLi4hK6oTf8QDn9dXYVlOAByGcJdUPiAGA8vUYJU81m2yqxSG/Ouhk6XpMAfP
BmLdRnxFudLPEHx2ku6A
=WuTE
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
