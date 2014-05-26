From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] regulator: pfuze100: Support SWB enable/disable
Date: Mon, 26 May 2014 15:57:39 +0100
Message-ID: <20140526145739.GO22111@sirena.org.uk>
References: <1401093941-12386-1-git-send-email-xobs@kosagi.com>
 <1401093941-12386-2-git-send-email-xobs@kosagi.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ijVLzUSDbgcKP8+b"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1401093941-12386-2-git-send-email-xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sean Cross <xobs-nXMMniAx+RbQT0dZR+AlfA@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--ijVLzUSDbgcKP8+b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 26, 2014 at 04:45:40PM +0800, Sean Cross wrote:

> +			.enable_reg = (base),	\
> +			.enable_mask = 0x48,	\

I note that this is a two bit field - what do the two bits mean?

--ijVLzUSDbgcKP8+b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTg1ZgAAoJELSic+t+oim9JwwP/1EarbuTjJ65mv8RIuOB4vhC
MEwgk7KCTJyH6z1rq62s6tupFQ2+0T0HYd88pj6zF7Xql+vITWYEuGtdVB1ciogg
ldU4CrOU4xvI7LKUleQwaku5cqvQhEHH71pJjWOBlDv1Wc3HGoMa5Vp2V6nSLKWi
Yo4w7JiV/nYrVDESFTAeVrjLzLqjAwsdpgHpj+3cuVJWAGwqcpJgUzwjJlirTY6m
fQrAv7LCz9xApGWXe/cR+dj4KF0yeAdOVNjgs6LIAdrpJZBU4yREZkhO5xb7Agjs
CEu3O3KOcDke+V+fCvKmYuRsmIt8gDSEKCAj+d1FGDiMomDDeROwB8S9kFhEn7Rj
fh3C8k6V6iIopm7YLlZjJcWFwo3Uo5Lgt+6cem+U5DBT7gKJAlsugGJAwGc2CG5E
0aINVBsmUD/JnZNlidaVuKJwfQgqMiUrRrX2S9OaDH4JhLmPn3aabqd4OCnxP1Y4
ovFO+NERH1me4DYDAYshEM57r2ffTDcEzE69+u1FPZ0iYw3n8Li/HfMAyc2fFAGk
YLe2fX/2/T/0zYRX1RgZnUXLK4PEDPSH/PTXcf9+yNmDIFWu4ddoKLD6fOcbi6xp
MfsLt7i8Co2+EvFBboFNm7pob6Q9JTQhOXozT6kymI7TUm1srSjzJu0S2vhnY9lx
LYjqrXALpHKcNFhsVDSG
=gKEJ
-----END PGP SIGNATURE-----

--ijVLzUSDbgcKP8+b--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
