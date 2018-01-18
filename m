From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v3 01/12] clk: sunxi-ng: Mask nkmp factors when setting
 register
Date: Thu, 18 Jan 2018 11:53:23 +0100
Message-ID: <20180118105323.fk65vo42eyc6dbzz@flea.lan>
References: <20180117201421.25954-1-jernej.skrabec@siol.net>
 <20180117201421.25954-2-jernej.skrabec@siol.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="6q4btm2bzec5t5fe"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180117201421.25954-2-jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, wens-jdAy2FN1RRM@public.gmane.org, architt-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, Jose.Abreu-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, narmstrong-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Id: devicetree@vger.kernel.org


--6q4btm2bzec5t5fe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2018 at 09:14:10PM +0100, Jernej Skrabec wrote:
> Currently, if one of the factors isn't present, bit 0 gets always set to
> 1. For example, A83T has NMP PLLs modelled as NKMP PLL without K. Since
> K is not specified, it's offset, width and shift is 0. Driver assumes
> that lowest value possible is 1, otherwise we would get division by 0.
> That situation causes that bit 0 is always set, which may change wanted
> clock rate.
>=20
> Fix that by masking every factor according to it's specified width.
> Factors with width set to 0 won't have any influence to final register
> value.
>=20
> Signed-off-by: Jernej Skrabec <jernej.skrabec-gGgVlfcn5nU@public.gmane.org>

Acked-by: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--6q4btm2bzec5t5fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpgfKIACgkQ0rTAlCFN
r3SYvQ//UmbXMWHqepUl1Du0cP1776UEhGRH+prCCnAn4zBccM113wgozjTlbgI1
dlzdYZXV0EtWq2NA+wERaE4zi9owZismhBSUwIQtwcrorfyviSgsijCt9PtRGkio
doxYa/izgqhtz/Aj9NM7ekN/aKbzkjKveH/+KpTFkvI388cIwrumIbdyBL3lLq4J
t9djyJYWxeASezywALXjdR1kyhUnbUCGoTWa3IsftSGhMORKByEVNrkOsMfnNoOz
oyEhpMhNDrPCViUtodvj1GxEAlw7jvOAfqi0MdqbjAXa2XezaJgguxNKWbv/VJwI
wYHvMVN9lBMB+mO9BQL9BbVKoV+yh0CBtYBKJbBlKjitYp5TvYIfDfwB3gh3P7uv
ffAJg3hVe1z4YJFwhQ0VsCm8QvnZJpE/5PBQkhZP4n+uUfgkVjj99ssH3VlF2qf0
zkbilkHjh/EafoZ2xyCp0pL1PzOi3f8GtaM3IFdo+AVqrTKfB+mORZUsFMRn/9NS
Xy+cQ3hSSRDtVDV7ryXihAkAQniQa8GxclUfsxaztqAvAdtnAFl2q4H8amI5x+QZ
Xns+ybiAp42/io40xLoi8uNKrsslCEuHR8ZxxpeTpxpdONqUTYPCPjkaFqpCNd+a
SnWA05Y9WfupockFvcPkvrmcnUzuUgwSTZ3ZdyKdNrEsXcz2St0=
=NRHy
-----END PGP SIGNATURE-----

--6q4btm2bzec5t5fe--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
