From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] Regulator: mc34708: Add DT binding documentation
Date: Thu, 30 Apr 2015 19:56:57 +0100
Message-ID: <20150430185657.GB22845@sirena.org.uk>
References: <20150428141736.16243.57292.stgit@localhost>
 <20150428141738.16243.18377.stgit@localhost>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="v2s3/pFG/Viky4j9"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20150428141738.16243.18377.stgit@localhost>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Fuzzey <mfuzzey-mB3Nsq4MPf1BDgjK7y7TUQ@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--v2s3/pFG/Viky4j9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2015 at 04:17:38PM +0200, Martin Fuzzey wrote:

> +			pmic_sw3_reg: sw3 {
> +				regulator-name = "SW3";
> +				regulator-min-microvolt = <650000>;
> +				regulator-max-microvolt = <1425000>;
> +			};

These examples look awfully like you're just listiong the maximum range
allowed by the PMIC for all the supplies which is almost never something
someone would want to do on a real board.  Similarly all the names are
just the name of the regulator rather than something that looks like a
board specific name.

--v2s3/pFG/Viky4j9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJVQnr4AAoJECTWi3JdVIfQZVUH/0qfQXETVfbiEOMO/jRkAP4R
fQVfsxyBY7blQzPSdqxVRq598i/LS/64kD1eEAO0VdpN44yers7wU6xPiQp20bGO
2xNXwMqHR4wR+B98KiGcxy7jhU+iiO1GW2A6jpMkppfAqcYDYg8K955RM04HXFNS
0HId5uTbqj0iZygpvJiHMngeA/0GIOputn8wMl7yATkxXATzZ7lbPiEwoZvNZi9O
7sJ+F4/wN9OA0RSfeLAe5yaswZ+VgPXL8o+RZ5FjHoDauMAI53rhnJ+T3F71kkHh
Yp7b3Bq1uPaVWQLQK/kyV5wVF0KOGinJWHMuXwrRY/LowxG9spPDdfPYZ/rX420=
=Z1Ox
-----END PGP SIGNATURE-----

--v2s3/pFG/Viky4j9--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
