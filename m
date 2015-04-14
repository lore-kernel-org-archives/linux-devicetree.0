From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH 1/2] Documentation: devicetree: root node serial-number
 property documentation
Date: Tue, 14 Apr 2015 16:31:02 +0200
Message-ID: <1429021862.2422.16.camel@collins>
References: <1427564371-26039-1-git-send-email-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature";
	boundary="=-UQcyCM+L8clR5VowIh00"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1427564371-26039-1-git-send-email-contact-W9ppeneeCTY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Hans De Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--=-UQcyCM+L8clR5VowIh00
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le samedi 28 mars 2015 =C3=A0 18:39 +0100, Paul Kocialkowski a =C3=A9crit :
> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>

Since the merge windows on both U-Boot and Linux are now open, I'd like
to attract your attention on this again.

Any comments/remarks are welcome!

> ---
>  Documentation/devicetree/booting-without-of.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/booting-without-of.txt b/Documentat=
ion/devicetree/booting-without-of.txt
> index 7768518..8b055897 100644
> --- a/Documentation/devicetree/booting-without-of.txt
> +++ b/Documentation/devicetree/booting-without-of.txt
> @@ -828,6 +828,10 @@ address which can extend beyond that limit.
>    name may clash with standard defined ones, you prefix them with your
>    vendor name and a comma.
> =20
> +  Additional properties for the root node:
> +
> +    - serial-number : a string representing the board's serial number
> +
>    b) The /cpus node
> =20
>    This node is the parent of all individual CPU nodes. It doesn't


--=-UQcyCM+L8clR5VowIh00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAABAgAGBQJVLSSmAAoJEIT9weqP7pUMXPMP/iQqmklYMlJMwhPD4K6g4OIu
wXLHOn23M6PPxCvQT2AIfACzejzaxv3Yop8GGHFaD+pNF9QlfkEega8oChNdKkEJ
/Nwhz6xXK/GK0sXlbZkkIqVvyqjkDm4/g7/kJjGqrHF5bnbdsxS7eUovHlc75usU
7J4f67oVsUN2MoO3OGKgBGJ2pvrULt07mbwhtvgjGE3WazJ6JDVuiDSTezWBClYr
5kyWku0YfL8xyyUtU28u7YEMM1LKzz6mL52hXynRc4/M+SPEik20vPOLfg+KYC3o
0Qi2O1rpOmw9VGzLsiaJ52gIq8Axx84n10dXp0IwE6l4jj9DoxwD7JhhnyXj99X4
/19zN5tbvxzhVQsBH3X9ui+m/jERohoEXCXZamCpczIWWL5iajlIQahKQkjafgRK
+NCPYknsk41YKPDu0zfr4GixlHOcD6qFODZf5F30T4v5GBgLnhccAhqgVYu2DWxh
wCv3VcuwgZ9XZpdaUv75nu9rTeeaCl+rAupTXOA8lF23C+i5INjX4Ut9tD83xLtD
JTiOSVU7yp+KTw3C65tqshHUt5kYQ26yRr5Z51LwMs5AzsC0Iyv53TDZGq86uvds
/ZEqqtE5mY8HuiXmxGyVoTlnywcrKWv9/OgG/HDDxr/WlFV9lku5LGdoRVyqQ9Zx
PKYFxZD2p3OKLm38YOTY
=/R/7
-----END PGP SIGNATURE-----

--=-UQcyCM+L8clR5VowIh00--

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
