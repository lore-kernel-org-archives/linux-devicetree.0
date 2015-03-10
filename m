From: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH 1/1] OMAPDSS: Correct video ports description file path
 in DT binding doc
Date: Tue, 10 Mar 2015 12:31:20 +0200
Message-ID: <54FEC7F8.2080209@ti.com>
References: <1425744483-13188-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="cfJB3QbsxxPU2B2wPRd9ImpFHnx1Davp0"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425744483-13188-1-git-send-email-javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

--cfJB3QbsxxPU2B2wPRd9ImpFHnx1Davp0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07/03/15 18:08, Javier Martinez Canillas wrote:
> The doc refers to Documentation/devicetree/bindings/video/video-ports.t=
xt
> which does not exist. The documentation seems to be outdated and wants =
to
> refer to Documentation/devicetree/bindings/graph.txt instead.
>=20
> Suggested-by: Tomi Valkeinen <tomi.valkeinen-l0cyMroinI0@public.gmane.org>
> Signed-off-by: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8oXa1LcwEujcA@public.gmane.org=
k>
> ---
>  Documentation/devicetree/bindings/video/ti,omap-dss.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/video/ti,omap-dss.txt b/=
Documentation/devicetree/bindings/video/ti,omap-dss.txt
> index d5f1a3fe3109..e1ef29569338 100644
> --- a/Documentation/devicetree/bindings/video/ti,omap-dss.txt
> +++ b/Documentation/devicetree/bindings/video/ti,omap-dss.txt
> @@ -25,8 +25,8 @@ Video Ports
>  -----------
> =20
>  The DSS Core and the encoders have video port outputs. The structure o=
f the
> -video ports is described in Documentation/devicetree/bindings/video/vi=
deo-
> -ports.txt, and the properties for the ports and endpoints for each enc=
oder are
> +video ports is described in Documentation/devicetree/bindings/graph.tx=
t,
> +and the properties for the ports and endpoints for each encoder are
>  described in the SoC's DSS binding documentation.
> =20
>  The video ports are used to describe the connections to external hardw=
are, like
>=20

Thanks, queued for 4.1.

 Tomi



--cfJB3QbsxxPU2B2wPRd9ImpFHnx1Davp0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/sf4AAoJEPo9qoy8lh717JIP/R8O/yt80U4Fi+PT4KfLtK3J
1iWOrAADq6QieuUFcs8F0ztCvPOKsnLKPPP8sIJV555gB6hKSqqEhqg5LUHiAgHv
eiuhtgoKQOrECKqIV3lzY+kIYEyBtqp4ZlIPXKO7a3Luf+bFMgvveHd4w7wG4cDk
aPWsOnVYd8H0y5tjB48LjTD+Vas+ara5aqgk6n7LF+lFF80hTO//AsKOWQaZG7e9
SzYJaPkWQpS0fz0ZRQ0FaM5eBR8yfKx/GETJTGBW6iWRSZhCeXPuDTImqryyM1jl
W7qtj0ARZnKhB7U7aM3R3ynR50Fnl2YRyXzDKUjKlBGbrOGx65k9vkL/LbWlIBYZ
4hoa4XE6E2udZlwpwakrTLE08fAlgBxwHrO7Y07YCv+q2iBgH8IiFoya255vj1Pr
1ZAj8+GkCznk1BuX6hgfjRbgzj0KQ+OhSauOr+TS5eGF1LnHsqMykIpcluj7ABOn
7wBNhntktn0i4YpNisvRbdBY3r1a46gy43xlenp7WUNkHKBmpb2vBSjVWo4QN5k3
hktoBQfjwclxz4ylc99q2DM/6QoALD2TePbMODB/Di45vB8Tf9ZYXjud87Nsqh0R
J4HTewYQ3AyUrX5QaREIZENjltlFeAeIiSI04WLey1uUSAYHoXU7Fxj3/IFF2WpD
l0s6Uoimztt7DNnA1BE3
=QsVb
-----END PGP SIGNATURE-----

--cfJB3QbsxxPU2B2wPRd9ImpFHnx1Davp0--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
