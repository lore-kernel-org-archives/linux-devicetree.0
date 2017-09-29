From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 03/14] drm/sun4i: tcon: Add variant callback for TCON
 output muxing
Date: Fri, 29 Sep 2017 12:19:18 +0200
Message-ID: <20170929101918.h7lfefk3bjj2lf74@flea>
References: <20170929082306.16193-1-wens@csie.org>
 <20170929082306.16193-4-wens@csie.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rnbhxdod6u7v4b3i"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170929082306.16193-4-wens-jdAy2FN1RRM@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--rnbhxdod6u7v4b3i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2017 at 08:22:55AM +0000, Chen-Yu Tsai wrote:
>  static const struct sun4i_tcon_quirks sun5i_a13_quirks =3D {
> -	.has_unknown_mux =3D true,
> -	.has_channel_1	=3D true,
> +	.has_unknown_mux	=3D true,
> +	.has_channel_1		=3D true,
> +	.set_mux		=3D sun5i_a13_tcon_set_mux,

I guess we could even retire has_unknown_mux now, since it provides
the same information than if set_mux is set or to NULL.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rnbhxdod6u7v4b3i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZzh4mAAoJEBx+YmzsjxAgwWYP/Rporx0Mcrqx2I//WLihReUe
aumbEsSpNLO7iq4NWXzbkZ2by+qRJAJNqZfQ1h6S05Judyz2ZyXs4IKzTb3VX3yn
Hs5So/H+fX8GtacxpqjpInNc/ewbQS2/fbrQwWnIFpnU91cRbtqVQcjuCbKcXFMI
tNfkDcz2WHsGaG0vPb6/DBMYhMrPnNvNP8NoWqD2WAiqeTn4u8gExO0xuVauXx3t
CbFMq0cIZP1UWnYBEyAzV6BxMwPjMuMboGTEgiE6OfwjYY42ShlLaNRVMRc8fGPC
tHZFWxXRSJTWgf9Ylf/ZiPUjofG72GfCqWKatXs5h4nsIjVkfIn/s+vTsxQb3vTU
caOUzQkV+jRlowPy1OG9A15vTVC4E/HqK4rwT+61UPsFCGH9MPRByoAneE07v1/S
Fp3L+qLxFTWftmv+ArEDCDoi0j20K6bQyz3JHFD+QDMLnbZ1UZhiB5kVXTL2bbOz
WFrMUSGXDoSQLq4Z6K2F2DiZcA8cb0cwKYxE30rmfDsbS3rSRAK8YTbReA22R2vf
DnaAvTM1jibuQ6cEycvbfLbQLEHKl7cThsfscnw/LI8gAQe5kyjGdbxEsxPltu6E
5eY5/cEJ/rigcXvxH9v/pmSkylpSf5uYlC5+5Vr0JrNgyofMeIEGziS6+tj4xsJ/
oSTYMD5Zok+kxSRAqXML
=EIN/
-----END PGP SIGNATURE-----

--rnbhxdod6u7v4b3i--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
