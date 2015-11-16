From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 4/5] regulator: tps65912: Add regulator driver for the
 TPS65912 PMIC
Date: Mon, 16 Nov 2015 18:23:54 +0000
Message-ID: <20151116182354.GI31303@sirena.org.uk>
References: <20151106104322.GA18409@sirena.org.uk>
 <563CED25.6020405@ti.com>
 <20151106211651.GJ18409@sirena.org.uk>
 <5640DAC0.9080008@ti.com>
 <20151110095719.GC12392@sirena.org.uk>
 <56421FA5.1020103@ti.com>
 <20151110170447.GI12392@sirena.org.uk>
 <56422ECC.6070603@ti.com>
 <20151110184408.GJ12392@sirena.org.uk>
 <56424836.7000608@ti.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J+eNKFoVC4T1DV3f"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56424836.7000608-l0cyMroinI0@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Andrew F. Davis" <afd-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grygorii Strashko <grygorii.strashko-l0cyMroinI0@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--J+eNKFoVC4T1DV3f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 10, 2015 at 01:40:38PM -0600, Andrew F. Davis wrote:
> On 11/10/2015 12:44 PM, Mark Brown wrote:

> >There's also the third option where we don't have any compatible strings
> >in the subnodes at all.

> Ok, two, but would you really want to go that way? Matching by node name costs
> us all of the flexibility of DT sub-device selection. Still don't see an upside
> as we would now be locked to node names instead of compatible strings to declare
> component type compatibility (what they are for).

Yes, we should go that way.  No, there is nothing meaningful being lost
- the fact that there is zero paramterisation in the bindings and each
subfunction has the full device name as a compatible string ought to be
a big red flag here.

--J+eNKFoVC4T1DV3f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWSh86AAoJECTWi3JdVIfQkkUH/0a+ejxdEMwuTceJ0M1D/OX3
yKUf1LkhZJRe4Yx3jwXBWFu/+jCBW22/38XZUk584twlj28dYJN6AosUlAhwww2u
Bj5QEueDGbX95jfMhIokgzhudHjEnlLU6PqmUxgXI/lYxDSbktBZw14m7YqqMvaG
T7Jhtu+duapKXJ+TlkVUhpv18CoDeBN4JcZOq56keT7wP2cKbrqRueddXUEkJz7K
eCZM7hzy9sJCu/BecnNl934WpPUfyIDrQhXs0h4RiEF+Yrz0XFDJEc7s6/1VxuN1
F5sjgsNEvc+bBfE4YL5mOb6MR2kDKqrN6z72u4SdskaY8Gjz0B5o8H4b3rZ07ww=
=Tl/0
-----END PGP SIGNATURE-----

--J+eNKFoVC4T1DV3f--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
