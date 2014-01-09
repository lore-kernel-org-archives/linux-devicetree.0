From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/3] regulator: Add support for S2MPA01 regulator
Date: Thu, 9 Jan 2014 10:34:38 +0000
Message-ID: <20140109103438.GE31886@sirena.org.uk>
References: <1389162390-4582-1-git-send-email-sachin.kamat@linaro.org>
 <1389162390-4582-2-git-send-email-sachin.kamat@linaro.org>
 <20140108123002.GY31886@sirena.org.uk>
 <CAK9yfHwZN93T=Cs0jZ=ce6PBnjoFM6OcpC2cT1TCZVjHLBEJ=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s7t4U/z+yZBgBzGu"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAK9yfHwZN93T=Cs0jZ=ce6PBnjoFM6OcpC2cT1TCZVjHLBEJ=Q@mail.gmail.com>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sachin Kamat <sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Sangbeom Kim <sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Patch Tracking <patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--s7t4U/z+yZBgBzGu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jan 09, 2014 at 10:39:34AM +0530, Sachin Kamat wrote:
> On 8 January 2014 18:00, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> >> +subsys_initcall(s2mpa01_pmic_init);

> > module_platform_driver().

> Just a small doubt here. Wouldn't changing this from subsys init to module init
> cause problems to devices like mmc which would want the regulators available
> (where they are not already enabled by the boot loader)?

This is resolved by using deferred probe.

--s7t4U/z+yZBgBzGu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSzns7AAoJELSic+t+oim9FTEP/jWGAOscM7URbZu7wFVrobmK
8avRDPiZlMOXstpNWxrJy3R+kMB/B9EswBZQYLWSNTmxYUPf3QS9kXocD3WRy6hi
+M7oCfcslbdxpKXjUKnrFqyItobjNVNEtLmKsBDmPQcTEiUWVcLzKl6fjcQxE+Af
BS7xCerGqL9cvGvC2TSTS0B7bTiaUdpUvRN35SEv8W8UZTTTSjWpd41d0famhWOY
cjnzg9NeM5trn/gs3XIyHb0EYIkSXP8SuZdh8OmfiUwt4kOfdrU38H8TT1Cq5HC4
BgZKnGfQuFH2FPq3kb9cEmXXJf1agsL6qlZ/xR0KVDdrMzoqGk14p/rk2dOWjUHj
LmN/SDoDo3uiAFaEhrEsAObitCsrchsDDmnT8EjIGLuGkSoiz/YdTBgvIkE1iIsU
Woj0XnYZtki7vTvtUQE4LpVTKQu7byQb584RHr4zCBEhUYhnVUDGzvG772QqJ5yO
q5xt2mDdGNaG59ESKJSOTIuES2T13Ygnrk3tRgIcm02lN/kaLuZTR262TszKqPpb
dwy8u0ho85Ez90PxOCHIhQh+HzpFBF8BojfkV1DKE6IWaqpHcfc9Gc3yvxoSiwCn
dB0zJSlW01fYvVaDaoskD1YrDo2AIAMpwV4wyD6qWEODUehC/bJDgmkslHPMLJiy
GExvjW8uVJ491sO5TsZ2
=6hcC
-----END PGP SIGNATURE-----

--s7t4U/z+yZBgBzGu--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
