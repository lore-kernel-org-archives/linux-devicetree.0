From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: s2mps11: Add support S2MPS13 regulator
 device
Date: Mon, 17 Nov 2014 23:48:25 +0000
Message-ID: <20141117234825.GF22111@sirena.org.uk>
References: <1416184980-532-1-git-send-email-cw00.choi@samsung.com>
 <1416184980-532-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1416184980-532-3-git-send-email-cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, geunsik.lim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 17, 2014 at 09:42:57AM +0900, Chanwoo Choi wrote:
> This patch adds S2MPS13 regulator device to existing S2MPS11 device driver.
> The S2MPS13 has just different number of regulators from S2MPS14.
> The S2MPS13 regulator device includes LDO[1-40] and BUCK[1-10].

Acked-by: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>

--l+goss899txtYvYf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJUaolIAAoJECTWi3JdVIfQ+SoH/AjLN+bji/I/cMSMZH+MzlrJ
LyIgACLRdYUguhY5x1OYx81d2qb/h33csI7FteF4HuW228c9ZfJsVTwkTC2Lmr3X
r4to8odAvwUUOTIXLsvfiRmIj6ZRalvso2uX1N4qNoBhm84Coq7RS8mncr1EE12Y
Ngs2wcjA/VLRzKWK5o0NsKSf6MUINL6iJoh5UrhCPwUjuiyIvQ5bvGnEO1D1JkAU
mmi05rkY9mqTfM3PJwq36yWFw5Yxoy/UiWw+Hd0677S14916nuWoV2vU349mHyyo
VsxVZ5QXygUDBv+xGw9XrvHXZdI/R5vxbN7folfguvo9kzgpGC0bFGxOuwO3t+E=
=ArFH
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
