From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 4/4] ARM: dts: sun8i: Add dts file for the Orange Pi Lite
 SBC
Date: Thu, 28 Jul 2016 20:21:29 +0200
Message-ID: <20160728182129.GB26326@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <1468095718-18515-4-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4bRzO86E/ozDv8r1"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468095718-18515-4-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--4bRzO86E/ozDv8r1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 09, 2016 at 10:21:58PM +0200, Hans de Goede wrote:
> +	aliases {
> +		/* The H3 emac is not used so the wifi is ethernet0 */
> +		ethernet1 =3D &rtl8189ftv;

There's a mismatch between your comment and what you did here.

The rest is fine though.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4bRzO86E/ozDv8r1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmk0pAAoJEBx+YmzsjxAg2YUP/20CM3kxf5Cm2Cg6ngE4W1pX
PwN8AyKaZq60fTau7WIYk2yH29k02ioZTEUTqBjwgs56fkxz0FzQ+wHO1YBSYIHD
wL+EEVmATBHW/mQtcuqOPnPeFQDj0ZsCAuYrQRMAYo6uOv7lRBegjV1SaCWdsK8L
jOjHpdn+x5TMi9xcAKli9YXRb9ZBU+jKU4kC9ywXsXrhRmwD6vbkyYFJ6JUB5uFR
WeL7fL9EskdDxfUFVKQrlEzgWZII86XFeqK3ab30pbc9SULPBB2jZsvUGuLlXbGL
OXAvgP/VxHM8fnJMoOE8NwqPHKqWTjcPvwYHI/dagsiD8S5Tn4x9TNx902Y3HTXp
i6VO24H+RL1d9nxOaSgnweXp93uxtLEpB0A2gs4BwatAyYCBPg96GXXwn+Z4M1Av
s47KlhySPPnpQrSvf1I4+3dUGjYJ5o51Rc1gdWuLU32ebFBqQ/tfe9ZIXRS3WZJf
4h/iA48TuUcHqOKXN4A/oqQcVb3PR+tGvHpbgo6ud52mzlceRk1WI2dqB9Zq0AFM
WlabwxuOj6ZqLDfPP/ovePVwL6WJX+fp1vtwcIXlY3HGIZlz57XzllIIzQJ14c13
knHlsxA/7b3Wf20wmQFUShh0lf2giH5DtyTdGz5pfhqKnpISlAuXPIqbflyx8SpX
pm6lWi5dviAWNyKYAvON
=z8jV
-----END PGP SIGNATURE-----

--4bRzO86E/ozDv8r1--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
