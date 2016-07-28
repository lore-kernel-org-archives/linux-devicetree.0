From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: dts: sun8i: Add ethernet1 alias to Orange Pi 2
 dts
Date: Thu, 28 Jul 2016 20:20:12 +0200
Message-ID: <20160728182012.GA26326@lukather>
References: <1468095718-18515-1-git-send-email-hdegoede@redhat.com>
 <1468095718-18515-3-git-send-email-hdegoede@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1468095718-18515-3-git-send-email-hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 09, 2016 at 10:21:57PM +0200, Hans de Goede wrote:
> This will allow u-boot to fill in a mac-address for Orange Pi 2
> variants which use an sdio wifi without an eeprom for the mac.
>=20
> Signed-off-by: Hans de Goede <hdegoede-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmkzcAAoJEBx+YmzsjxAgrPEQAJoi1fAMrHhuF8qDlNb/3rl7
jWzK7bQhBo7XXtbsww6IxsP64WeauafbHqduvrEIuDECRKSSHmoTRrWRhRs0ON78
L01K1YRbuWBzcNTLQt6QbeSsdAVedWEHtVh2fn7Dd2/caYL5iuNUXzEZznr1sUt9
GrAwyp7WYjLrfjbkny0lZxE3xVtpfQYXOjG+wLcGZc8+26YAO3k1vedW4F7Jz2XD
U+koAN85uQGr+THdCbaLUyxLBkaX5E9r8+P9FXiko0ffysQAqYqNQ2+S5y59eK2E
fRvX+GE/n9BS9QHOHEB9LNrVzRoP5RPhI2O85hl9rNRB9MyQLqxAMJE7q3+JDUNb
2iaDzg7/1RstSaA0oy5QEC3DdUYyyjj09T+VgmOZfqr2uPYZ7Q0zhX44qCb4WpcO
7I0i/jxNZFMz3p0qzvEUX3x0zY4ID9UdKdKp/HB1xG3GeS3YxCXXezZTuBfl/KTQ
Q9P5pxbdBry+xLwylzzL7D4ElsBLONU7DCjamvnpISi9897qjo5rRb3o3CPyvSON
rTaNKtoG8kMOSgPidDmNuC+kg9hn8yFVxzY8DdiAwPaP38RbqUkPuoOqXuq3eWEN
irQ/8HFYMbVIMASQeRt1ArAy3vSNLuvg27iXQLzLx6+v4dsWGaIIk5jwVJ+g6G6q
iQVcNSqUsjSmpxIeQzpN
=Y00S
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
