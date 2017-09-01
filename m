From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 7/7] ARM: dts: sun8i: h3: Enable AP6212 BT on uart3 on
 Nanopi M1 Plus
Date: Fri, 1 Sep 2017 14:59:59 +0200
Message-ID: <20170901125959.6ae37ez34vb7mh6d@flea>
References: <1504062070-13523-1-git-send-email-embed3d@gmail.com>
 <1504062070-13523-8-git-send-email-embed3d@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="a7a6tnzfhxfntd4z"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1504062070-13523-8-git-send-email-embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--a7a6tnzfhxfntd4z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 30, 2017 at 05:01:10AM +0200, Philipp Rossak wrote:
> From: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The BT side of the AP6212 WiFi/BT combo module is connected to
> uart3.
>=20
> Enable BT on this board by enabling uart3 with using additionally
> the cts and rts pins.
>=20
> Signed-off-by: Philipp Rossak <embed3d-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

I've queued this patch for 4.15, but...

> ---
>  arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts b/arch/arm/boo=
t/dts/sun8i-h3-nanopi-m1-plus.dts
> index 3054308..8c12419 100644
> --- a/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> +++ b/arch/arm/boot/dts/sun8i-h3-nanopi-m1-plus.dts
> @@ -49,6 +49,7 @@
>  	aliases {
>  		ethernet0 =3D &emac;
>  		ethernet1 =3D &ap6212;
> +		serial1 =3D &uart3;

You'll also need an alias for serial 0 here. Can you send a follow up
patch to do so?

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--a7a6tnzfhxfntd4z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZqVnPAAoJEBx+YmzsjxAgXgAQAJTG1ZbHxmpBTsdi+GyQp/Ke
YJ8RCxz4W720EzxweL40zhJ9dVNCpYNh1ctqW52AstPIC9nIsz89aYmQoXGj/BCW
vPaTz8ELhwBuFcww4t1DBg5JtzdPSQSQ/NqbiGWnZbrWOsgfYn3ov9Dzjkc8ynVU
8G2QjHBvtQ9SqF7gid5XcdmlBadtIUGAjSS/imcXFJSk4y8IIyc0Wv5Ev79qlmTd
FvXfBGL2uVPyZK9ySysrrzkE5WdQb3Nul5DCBmhTHWrjL0ACt450CPdPW9vpqby8
YjgznkFb8nRvASPosfiBRALCzkfM3BFz+5LTHN6XwEooXxl43HIY+MW6RmJf5cfP
fecRoKDk96KoKBki97jic+u79AeNgwHGSkJpqmm9vdd86IQz1GZlvmcCOs91uqIK
o0mQs4Y8lNIrp5VuGJod6UaC7FO8hp+ZCqCKRem5Y/MOhkVlpD87TOmhMr8ezlW1
ICoxYWJ9MqAGbVhTj7qT7XQfmNh0lpcm1s6fxqN+G5tJnSudLVtApHlULc0RFQwi
YcB8hlpvEc1EYs87N2oMw68lGbwA8s/6ZijVbmOn+Mnyqfx/oZTsvAjzzUB6YQwP
NKdvAf58m5t4Key+kH7MSyCkT+xyn3y5Em/tDzNkGs2TeidSe10cWIK8qA799WeO
IGqIFfalCda9sU0L7nDC
=bshB
-----END PGP SIGNATURE-----

--a7a6tnzfhxfntd4z--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
