From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: dts: add cubietech cubieboard4
Date: Tue, 10 Mar 2015 22:26:03 +0100
Message-ID: <20150310212603.GB5085@lukather>
References: <1425932398-7194-1-git-send-email-tyler.baker@linaro.org>
 <1425932398-7194-2-git-send-email-tyler.baker@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iXVVnr8Hn1WiTnFI"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1425932398-7194-2-git-send-email-tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--iXVVnr8Hn1WiTnFI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 01:19:57PM -0700, tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org wrote:
> From: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>=20
> Add a Cubietech Cubieboard4 device tree and instruct make to build it. Th=
is
> device tree has been derived from the sun9i-a80-optimus.dts as they are v=
ery
> similar in design[1]. Notably, I2C3 is not used on Cubieboard4 and the LE=
D/PWM
> definitions will need to be updated in the future.
>=20
> [1] http://dl.cubieboard.org/model/cc-a80/Hardware/CC-A80-HW-V1.1.pdf
>=20
> Signed-off-by: Tyler Baker <tyler.baker-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

Applied, thanks!

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--iXVVnr8Hn1WiTnFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJU/2FrAAoJEBx+YmzsjxAg0oIQAIWXEULgWPh2hoeX7r0woxBC
SSOViNoX5gfpzwdJtnXVjquS/MMMlwgKZncTs9bYhAaeG6nWVuFZO/oI8NtBLJ93
QOpNMmaO+uoByR88voD8L+/lJKtie6TDeUoqk8shj73ZMO3JVrfMpsgqF2JFmwaz
pJIUHZ4Hikob5Tp353UCvM7CohloniqnINWwWplrX5EyFkkoh88NecDyh128pXjb
ErnVdOgy+NupLXtU914+VaKT5kY0oTSbhvvQLmvsKwJ0E1urZNpWIK/QG40QczxQ
/fFNbeVHjEnAwY5dUKXbEZ4TgxaMWYUTPDo5o6pck03Wa6/QfRs4T5wek0gb2uhw
OBKWH37u7ydnpvkZ3/T6Rk4iopD2MXAq+lfVBSOOyemNQXVKvfLNoafkwANkUztm
XH7N5tDpzhAwpw+77BlxDt308LTBsFiaxqnL/dwXRRgwOT0kHpaD2Y+PFqqNzqDB
rcAlE3DQdr3bvlnBG274r66p+IffvQFYYwICfF6NlEVFYV7OWJt14Dx2qLabX9Mf
KOXcDSrvA1lZlf8kjTR034+309cSi9St3oB7peT6hYL6Sey6iEdk2rWsX7SR7pd4
76xcIPxSF2InnRArkYjvTzWfQHPxYXQTRe5YZQuPXkhYvggVe0CTkqJ71zOAfHCX
S8VucJl95sAggak4ioRY
=2NVH
-----END PGP SIGNATURE-----

--iXVVnr8Hn1WiTnFI--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
