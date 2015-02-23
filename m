From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2] mfd: arizona: Move useful defines into a dt-binding
 include
Date: Tue, 24 Feb 2015 00:49:57 +0900
Message-ID: <20150223154957.GI6236@finisterre.sirena.org.uk>
References: <1424521077-5954-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D+WCZLadiceW8Bs8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1424521077-5954-1-git-send-email-ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Charles Keepax <ckeepax-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--D+WCZLadiceW8Bs8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Feb 21, 2015 at 12:17:57PM +0000, Charles Keepax wrote:
> Move parts of linux/mfd/arizona/pdata.h and gpio.h into a new file in
> the dt-binding directory for use by device tree bindings. This also
> makes gpio.h redundant so remove it in the process.

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--D+WCZLadiceW8Bs8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJU60wkAAoJECTWi3JdVIfQxSYH/jDCuvUl1sc5DL9Ce5Avx/tn
Xdj5g8YuG0R+24cAnU6AV7NG9P2RuvBAhBVRssuq6Ogf9mu8Vqcz8qyN+ahpEyAF
pqje2AB7/qwzuAve8RGVHqFBdWL1hykd9gDRB3qrk5WILHet/WnMFL8Sf7CZl7op
jUj+O31gygSsj4Xy+hlGYmNA0Xie6VbLO2pqbJTMRFetFM4mHBzp44EOnc8SI2uV
8JM5HeCPgqqHdT38MK1HKdge5MYIWNzbslzOtmonAbGo6AwQtS3+TE3K9fTgWKmq
cH+fGdkUZhsFmkgbiHbvkPkdvIOc+OASdUgHNPDf0q6096/bE+7MtqN3tsWGRA4=
=Hwfp
-----END PGP SIGNATURE-----

--D+WCZLadiceW8Bs8--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
