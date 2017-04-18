From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: allwinner: a64: Add UART2 pin nodes
Date: Tue, 18 Apr 2017 07:34:58 +0200
Message-ID: <20170418053458.phcbp4da3vatejpg@lukather>
References: <20170414171320.19743-1-afaerber@suse.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="jzybeeumiuv4f6jr"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170414171320.19743-1-afaerber-l3A5Bk7waGM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--jzybeeumiuv4f6jr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 14, 2017 at 07:13:20PM +0200, Andreas F=E4rber wrote:
> UART2 is exposed on the Pi connector of Pine64. Make a pinctrl node
> available at the SoC level, to simplify enabling UART2 via DT overlay.
>=20
> Signed-off-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>

Applied, thanks!

Could you also create the node in the pine64 DTS (with an explicit
status =3D "disabled" in there) so that the overlay would be even easier
to make ?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jzybeeumiuv4f6jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJY9aV+AAoJEBx+YmzsjxAgrw8P/R/fC1dGWuQr+Ei9qXuf3oV2
qNQh7xV1vx0idW05pill8GyY3M2IBtwOlf7mB/WoLCD/5c5S15Zrd4r8n2F04D60
Foh4IvbBxGBIyqI+SJhb2zEBfhgbclel3ddR+GeozBYsp7SG7ijwyBYOy4IX1jPq
Ov4TUdeWnlOy11ISij9uqwDp15myjblBtnrWGQFE/Eu1c3Y+o7Ft+ZGnk9oyqUGG
pbUDiqLZgSmZufwzA9uVw7a53KQqA3qXH/0TdZ95JE6VjaplbTtsN2OzP7w7gttA
yLrZFESlNfhefC0zo4pjkjug898ngoBybxQC7A+SIlLJlKowTgHG5ss7ik5utAm2
n+13E8YBeE4OQcD0hHEW9jzes7Ab3QeW+p+/6Ql61W8DV5TolyuP2BG7RtQuRKiG
ObounDIV6wsCB26eO/qNc/wPk2VRBKq3YYZiaroQYMkmw6KlOAXRneirgxj3JTNa
1tUMLRFOP5gsKhogN7V6aeMhBZVC6deKTnhvxkxodnMdmLhUU7cVovbe7cKAAdQ3
KU6q6VMOFvJiy3QIMktdnJOPXniE5jj0wTfA57h3OIe14pq3TjVhYaxy7Osnanrz
dI9CLGGkRV5gCyOd9y6frEcLuqhceZI7RYPu3Rac4OFz3+/JTpNGsBWKWe9RpJtR
5/etY+ZC2JwovBjqPeCM
=tMvv
-----END PGP SIGNATURE-----

--jzybeeumiuv4f6jr--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
