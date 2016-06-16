From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun8i-q8-common: Add support for USB wifi
 controllers
Date: Thu, 16 Jun 2016 10:19:35 +0200
Message-ID: <20160616081935.GI5144@lukather>
References: <1466015030-18091-1-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="N8NGGaQn1mzfvaPg"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1466015030-18091-1-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--N8NGGaQn1mzfvaPg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2016 at 08:23:50PM +0200, Hans de Goede wrote:
> Some of the sun8i q8 boards have an usb wifi controller, on other
> variants this will result in an used usb root-hub, but the best
> way to deal with wifi on this boards is to simply let the kernel
> auto-detect usb or sdio wifi controllers.
>=20
> This has been tested on an a23 based q8 tablet with a RTL8188ETV wifi
> controller.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--N8NGGaQn1mzfvaPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXYmEXAAoJEBx+YmzsjxAgx3MP/1vQ4btmx2okCtapPgoU2qiS
9gNv6X7m3jBnRwGiebOaIYoe1IUqcTDXrKRJ+ccXEVgB6JHOYuH293J9oVeBYZ0J
KUsF2m8QpsVxFjaaEWwzPYkSfRzS+we03prfg7EtRbrru/K+587k5zqxhkNANe1x
DnrxLS+/CEzexVBTPj5cPnV1cgGUbnm0BGqELr0ktTBM0/kyAUHUeUREmrhvJh0W
YrTYrfxm2jd4kVPWks4MHmfJ6OuQwHMzQm35vyJmqIXuIKf9RuMepbLWJLYcfGTU
HPwsTiQjrmxLFcr1Ba+M6Ur28pXADzeNCeaxylNOLGyYIruKWK81oimVAYQlMg9/
6PXymO6OJFx1jGzImufEc3YD85oJoIoZRrhjxYrfVfMke1jHMejjPyKNTzj0WBpL
P/X7ZYoYFq9wWR5RqJD/80m5t68dGYt0tt0oDhJ53BVhWFOomFJnRPiObr+UpyjY
wqEf1uNtwEBIJr/rF78HZpAXLYps9ZG/2GV7FcR8SGVfj/3tpDc70SVddepafbET
norBg4hStjrFwhv7cEr3Sp1md/SKmBHKLTATEA63rO/2VtnV0yWElGR0At1G9Dw8
1bp+kl/tJDfQ//lIQ/Ldjy9H23IwRQZ5HPz/Z1zN/9UzYXlM1Hd3x5l5nNtad6kO
GYfAKGgUf2MiAweygPQ+
=iZJj
-----END PGP SIGNATURE-----

--N8NGGaQn1mzfvaPg--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
