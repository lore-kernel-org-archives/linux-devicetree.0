From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [linux-sunxi][PATCH] ARM: dts: sun7i: Add I2S0 pinctrl settings
Date: Mon, 24 Jul 2017 10:20:22 +0200
Message-ID: <20170724082022.wpeqrxjayqnpiw2p@flea>
References: <20170722064313.7535-1-codekipper@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="2jzefhzpavb5zyix"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170722064313.7535-1-codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--2jzefhzpavb5zyix
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Marcus,

On Sat, Jul 22, 2017 at 08:43:13AM +0200, codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org wrote:
> From: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>=20
> The A20 SoC has a couple of i2s blocks. This patch adds
> the pinctrl settings for block i2s0.
>=20
> Signed-off-by: Marcus Cooper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

We're not adding pin groups that are not used by anyone. If you have a
board using them, please send the DT for that board too.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--2jzefhzpavb5zyix
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZda3GAAoJEBx+YmzsjxAgKUQP+wQrmRfFQaImmOkoi6c4oAh2
UK+i/c1D8LCrs6OoiTXl3GvAhfU+9/cGJzssP63ZzqXP0p9q2040lJx3u6zFcY1Z
4b2DcF5S//Fd4Gy2Vw9v9xiF/ECPnF8yfBSZXb4cfPFw898lgvtx4M9lt/b1qXv0
OXxjpLtDL0ap1arapbbNYgNgjKL6ZuIy7RnrjdTbbb836zAa9aTvQ9bJ5qIIneEu
IKgI9reYE76oRmavwJZqNr/nt8ptWuF2d60W0L0KR5JYz8Youmm7Ci0JKlVLuMQl
k8AKoM6T+wTj1mS6YhZOPY/D7WBamesmUdFgnR5A7DBZjJjiLgedJDmgKf7SqBfg
1HNg7nWRLyEsZE1bC4R/BOSwYfk2BQBSe9Fm0dN7+OTrUQZaOCKnUM7uz1xMZYoH
YXKz/1OEnqLWRlEGPSSyKBSS2h3qss1MZ00Hio8a8pbSwVesJ2aRI4USR7hsEfOW
P+VH1OCZQ2dBb6oXYLuPI02H4cEa56bSCSRu+uLjKOa0uF+WPAbgWXaPiRiVLWhE
D4THlNyzTmQexoadYiKNwH3rjmd0h1ToQgUWw3iLgqopOKB11ZtxDp/FIQapmA3J
voDMbZtJIVqspqv3PQhSy0+XDS6+pap6vR3w7yS8covdRgsl9sJmsCYSbfWOK/xY
uhZtLlCzioavn3/9lhKT
=qlPK
-----END PGP SIGNATURE-----

--2jzefhzpavb5zyix--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
