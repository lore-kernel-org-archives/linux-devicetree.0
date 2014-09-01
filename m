From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2.2 2/2] dt-bindings: Adding compatible attribute for
 SKY81452 regulator
Date: Mon, 1 Sep 2014 11:31:58 +0100
Message-ID: <20140901103158.GO29327@sirena.org.uk>
References: <20140813190423.GI17528@sirena.org.uk>
 <1409539218-5571-1-git-send-email-jack.yoo@skyworksinc.com>
 <1409539218-5571-3-git-send-email-jack.yoo@skyworksinc.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="80d3ujMCT5hHQAFF"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1409539218-5571-3-git-send-email-jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Gyungoh Yoo <gyungoh-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gyungoh Yoo <jack.yoo-tjhQNA90jdKqndwCJWfcng@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--80d3ujMCT5hHQAFF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Sep 01, 2014 at 11:40:18AM +0900, Gyungoh Yoo wrote:
> Adding compatible attribute for SKY81452 regulator driver.

>  Required properties:
> +- compatible	: Must be "skyworks,sky81452-regulator"

Why is this a good idea - can this driver be used for anything other
than a sky81452?

--80d3ujMCT5hHQAFF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJUBEsbAAoJELSic+t+oim9wwMP/39LlAF9B4DxAOFkaY3rdgpI
AfaR5m1+Iurgc/9cIZ4a2VYd6wMhnPlxlSglMO8Q+oriXUs+EsdcDWbzj6/81K+j
46o4+SBE5sQAxHRapDYxlb4ttbtmCE+916TtWj5EBl4WH+ZSVTu+MlyKZf1+zB9L
0CXK8AKEXUoq0jT8bmRAGtAOi64libjZHftQlBzs2P7dBOjzOtoBDHEkv/JUuGkD
DQy6ChOj6bNxpWAut0YBpSHiyg2ANOOX7mYMMy2/mCragLFW8JkznCcfHP/ILB8D
pPXhgTC3nVTEVqOY6NHEu5GJvzr1cs9dkArmEyBvohLxzoEp4gW4GyDPOhVGoWF1
wFBav5lORcN6gKDtQFxBIF92DCC6XXbuK1fYeLfKxOAbRv84rUxN3SnVWFQ0mHy6
6CNNiy7+1XrOqoS16+F+07ZaJpk9JOQAR6CvurTEaF8Dm0c0vpfi+nmj5an1EhvP
uJmcaq6A8COQFMfCoEK15SD20ssx3tIeMSvKZcNn9ekVlI7QmdHSttKiWNuDtser
8tTLNPBeN+2WrdG166MKp3i8fAOiB9gncKN0a/5lfuXCyAadFND5qnzFy43wmym8
PLO1G7TDM1RwOhuG+/GL6s6dw+K4tPKcgwXcmy8D5hqZ/+OhP6xQR9tTeI5l9YJ2
ovxhDnsFqB+xHrwkmv/P
=nZuN
-----END PGP SIGNATURE-----

--80d3ujMCT5hHQAFF--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
