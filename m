From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] of/overlay: Directly include idr.h
Date: Tue, 17 Feb 2015 18:33:51 +0900
Message-ID: <20150217093351.GT9110@finisterre.sirena.org.uk>
References: <1424140618-22987-1-git-send-email-broonie@kernel.org>
 <56CDBF0A-4E66-406D-9086-7C0128FEC6C7@konsulko.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y51z1SGMnxVzkhDv"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CDBF0A-4E66-406D-9086-7C0128FEC6C7-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--Y51z1SGMnxVzkhDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 17, 2015 at 11:15:28AM +0200, Pantelis Antoniou wrote:
> > providing the interface, instead relying on an implicit inclusion. Make
> > the dependency implict to avoid potential future build issues if the

s/implicit/explicit/

--Y51z1SGMnxVzkhDv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU4wr7AAoJECTWi3JdVIfQxnwH/0actEnMQVy30mV3U6BKLDVQ
T3xpJUE1bWQx4XNq3Fay9xAtTvZjPCk4eCkXBWdZ2Bsv20RSp0QB/3Gz6caHqYzb
9w7O7ppCGkE10Gy1A9GsX3l5wE6gTXJs425CgqNhMudO18+5RAMjPZFacO8KruNC
9Xm8EWvhozMMMjGEGwHHbhzsOYHUyzpYLa/+q7yGKiNpHf0n1t24lHvJB1fgVD99
vZfdgI5R9X6JY1eKeayibjQOFdGUWW5LGfkmRwr26TM6JbPP64msKUBq2MJX5iPg
Rs3ZifFg6arux0hVsfrr7RdMRyC8SBjt2DOZN/PQZRE6h39b9k+VHGjEiORzjPg=
=UHoN
-----END PGP SIGNATURE-----

--Y51z1SGMnxVzkhDv--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
