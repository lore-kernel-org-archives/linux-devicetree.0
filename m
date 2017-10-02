From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 01/12] pinctrl: move gpio-axp209 to pinctrl
Date: Mon, 2 Oct 2017 22:18:23 +0200
Message-ID: <20171002201823.s5o6mtwbszypjqcb@flea>
References: <20171002120854.5212-1-quentin.schulz@free-electrons.com>
 <20171002120854.5212-2-quentin.schulz@free-electrons.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="fqriwrg4pp77kybh"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20171002120854.5212-2-quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--fqriwrg4pp77kybh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 02, 2017 at 12:08:43PM +0000, Quentin Schulz wrote:
> To prepare the driver for the upcoming pinctrl features, move the GPIO
> driver AXP209 from GPIO to pinctrl subsystem.
>=20
> Signed-off-by: Quentin Schulz <quentin.schulz-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fqriwrg4pp77kybh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ0p8PAAoJEBx+YmzsjxAgyHYP/0mTawjGJvXmCr7y3VnG+RZS
uLN/1Y3MePiqw3DT+uMFhUCUFZAgXbxWHgpFAS3MJqU4oDNrzygWEST2GB4p0LaF
c4fcG9LK0JbChi3mL65VcS84s8/akql+Ft0WpCUYNOdoLS8u458npx47P/Myr/p5
ahdpQ8bk83ONv08PECyYyNZRRlhIm9fIfSb6mOGmwc075/i7ejCyAbFjSYYaw1Rs
sW6EHkjVkcsQ1fmFeW7u7s6Z9OD2/yrc9SxCDJa1A4jfkG/oJlScz/jkGXxYvOxL
1zXffLicNKdd4EEOMPTVFt9/2ANL68exvgGmE9SM6scMyILtkwvmXTrK5G3WiB9W
d7FIFLXzvmpJKYAUBbbfn1QeK6TaTTpWojxwpR4o4GU6iVdKIyO6osPN8AE3k1p9
JIdo+3NVldJks9rf/3W/3zbRhcH9jfSaYPByRTnA/RvnQPJRLGAvlndTzLjc6sVa
JL//HhKuUGyZx0wsXcmvKs1kY5c51o4sdt+nGjxPYRKRQ8c2kMPlNjmNw5F2cFle
+tMl4nEEQ2sqAStFYXRXIH7Uj//oO3S1g6SVdwy2w4kSvE+UdfmB4NgGl0FZn+ya
SlBupfkGEkiRmPPM8zEfwEh8IYiu+HkOPB3VrLLju4DgTWoeVhFnB/jeEM+MMZNQ
s5G5Lpj+Z9nQB8o88FYJ
=7zLz
-----END PGP SIGNATURE-----

--fqriwrg4pp77kybh--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
