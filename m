From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/5] regulator: s5m8767: Do not use sec_reg* regmap
 helpers
Date: Wed, 18 Dec 2013 13:28:25 +0000
Message-ID: <20131218132825.GS28455@sirena.org.uk>
References: <1387286601-21646-1-git-send-email-k.kozlowski@samsung.com>
 <1387286601-21646-3-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pE9oldV/ca00Larp"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1387286601-21646-3-git-send-email-k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Samuel Ortiz <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thomas Abraham <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Amit Daniel Kachhap <amit.daniel-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--pE9oldV/ca00Larp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 17, 2013 at 02:23:18PM +0100, Krzysztof Kozlowski wrote:
> Replace calls to sec_reg* helpers with direct usage of regmap API. The
> sec_reg* helpers are error-prone as they mix u8 with unsigned int and
> order of some of parameters (val and mask in sec_reg_update()).

Applied, thanks.

--pE9oldV/ca00Larp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSsaL2AAoJELSic+t+oim9thgP/16aWfvcIBKLXdGUUVPsOkzP
zlVmlFYk+VQmnIFysXfHBn7+ZkREAgCoNrW/LRM5lWB7961t8vWGLe6Y+4smzdvc
e1kU57RRF8LyOVYhF2f9TuCGZ+D7t9Ofo4c5Q+5HP9jhMIEXw22vLYR+wMBnRsjs
MllKRQFH2R9u0S9YkQnJng17iQ1GgNULE2TnHiWVR1LxfscUD5oJvld263Zw+iJE
CiybZ8x3MTdyjlH7Rc2d2crkNAQ0426PK7ETYnwpZTQqTTHrJOcy/N5oTxv+IbEi
LoktyvNzCMwM5MZ6Y6w3o3G041PVzMGETFWTc7aDOY0asXehPo0JQKSf59VXVQDz
rbeB0GYYftSTJro2q77gWRq+lDDMDrX9UkyhKJJBP+5SAwA3ehtKwM5Aot5O/7r3
lWmrPeUhjz/2s/tjUJhA6d2G4ODWMOQuuhTLm4e3qhFgaykzZ8z6+TD958S7GBZt
03pAGd/lK1EqIduDFl/9qWfAuBrOvi9g+USDMVKe4aDUX8HQ5wacdP/gEN2ulZ4o
Dt7+BhCCPu3y8Zp8DlERIf9an9JpwHo9adOhWDZZQRJX3H/kfbJ3Xd0QpwQ7cSUi
ajDxDggYo6uEftVCYdIUKW/TN6Yd4DggdErCQ7aGbui3MrbcadhJJxmOX4CbG/JT
VyxDFPDPxbAMJN4YYHE0
=6ISc
-----END PGP SIGNATURE-----

--pE9oldV/ca00Larp--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
