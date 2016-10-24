From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH/RFT v2 09/17] regulator: fixed: Add over current event
Date: Mon, 24 Oct 2016 18:43:22 +0100
Message-ID: <20161024174322.GN17252@sirena.org.uk>
References: <20161024164634.4330-1-ahaslam@baylibre.com>
 <20161024164634.4330-10-ahaslam@baylibre.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="HL3CiL6n73+IAdG4"
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161024164634.4330-10-ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, nsekhar-l0cyMroinI0@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, khilman-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sshtylyov-hkdhdckH98+B+jHODAdFcQ@public.gmane.org, david-nq/r/kbU++upp/zk7JDF2g@public.gmane.org, manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, abailon-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--HL3CiL6n73+IAdG4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2016 at 06:46:26PM +0200, ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org wrote:
> From: Axel Haslam <ahaslam-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
>=20
> Some regulator supplies have an over-current pin that is
> activated when the hw detects an over current condition.
> When this happens, the hardware enters a current limited
> mode.

Please don't mix random enhancements like this into bigger system
specific RFC serieses, send them separately so they're easier to spot
and there's no confusion with dependencies and then reference them from
the system specific series when you post that.

--HL3CiL6n73+IAdG4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJYDkg5AAoJECTWi3JdVIfQlRUH/3twnLRIWMftcz2090Zn61Ei
ismfoSvRVF1WQE5FWcvwiVqidRFD1gPih27Li73JzBYBcUhqEt/4dj6Fw0WtiZD/
dc2GAnFMrXxh2wlmO1bFe+vDmbVrZQhOfhnduWKQeFab30LEIuOD+x/mJHRa++Kd
banUNSEej7ijkPM4UEoHsNxoO365bau/Xo43xL1zXvSV6GDtUBnKewCnOfcuMoEo
sNY9vmHfx22qcfLMab2tCGA5trXgDwGeuqsryClShnRJgO9l5pATyR/uLUm4+tLQ
+d7/l8YIW7GWNfOZd0zcd5ZBefa8ygCyaYNquI/sf22C0cK8B+vX9dqJ5zXbN1c=
=3/yd
-----END PGP SIGNATURE-----

--HL3CiL6n73+IAdG4--
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
