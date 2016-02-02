From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: sun9i: a80-optimus: Remove i2c3 and uart4
Date: Tue, 2 Feb 2016 10:15:05 +0100
Message-ID: <20160202091505.GK4652@lukather>
References: <1454338798-5929-1-git-send-email-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCF9ydJxlAJsfRTu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1454338798-5929-1-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--FCF9ydJxlAJsfRTu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 01, 2016 at 10:59:58PM +0800, Chen-Yu Tsai wrote:
> i2c3 and uart4 are available on the GPIO header. Though these pins only
> have this one special function, the user may choose to use them as GPIOs
> instead.
>=20
> Since our policy is not to choose what function to present on the GPIO
> headers of development boards, remove them.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FCF9ydJxlAJsfRTu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsHOZAAoJEBx+YmzsjxAgrP0P/0/eDM4TycX2Ki2lZP0ypkGE
kUbcRqlcB1RtqixIQpHkHQk5hSf2HYWoCf6FXSCR264Xzw9j5Pywz4U48tKUh+Yl
FWQTXoV+A0cjuWYr7YmYCNTosOXtfGyljiB9EdN1bXrFt4Llc0h93d9HXAadBl04
/izNtFja9yKAi/tAgp+z1SMBxl4pGfjZKVpnNfKeXyWosxWAzupxv4L3xvbfwBB4
/gLSdqGfJKqmy6Il0xvHEsvApX5dGWezzaZoTrRd0N+6O/SRIxfEr9wH76y2Bajt
s26NEVibnsdfbruNM3kaVem5akbK0PYRiIa6OTMAlXP2PxfXO+Ff5TdM8yd6vSLN
+UkWn36Z0GZL0gUSmEZ9HHU57s9LjkCiJ/u3alcArPt7sLuFYjhwvYaBvvP/gabh
Qsy+76C/V9J9XI2xZopNEHyNGxGVfhhPUmGV3Z3G01Wv0CUWZ8LbnHDBB8dqdytL
M2tDlYjba/JVhttgJ5SlZNOFpUcamunoONTT1FzGYOJuIvG4XRk6/qgHtRPYbt7x
MDPH6pRLo0bCHXySg9ns5cYGtHeoxEPu1gjo7UyuKGl7gR1ImigLIeoztqYO788T
9vZP0I+TZ4JCGe1SH+g+dM1jve/KvisIFDPQDO+OjvNwt7V6wuctrRQpqCGzcAS3
3g1A8Jr9sm9P0GCoq4xd
=IFUU
-----END PGP SIGNATURE-----

--FCF9ydJxlAJsfRTu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
