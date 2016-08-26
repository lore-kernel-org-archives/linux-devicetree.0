From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: sun8i-h3: Add UART1 pinctrl
Date: Sat, 27 Aug 2016 00:29:32 +0200
Message-ID: <20160826222932.GI3165@lukather>
References: <1472107494-20740-1-git-send-email-woogyom.kim@gmail.com>
 <1472107494-20740-2-git-send-email-woogyom.kim@gmail.com>
 <20160826071056.GA10545@lukather>
 <89195613-d5b6-bfc6-1c8c-0d74d9d02a99@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="AptwxgnoZDC4KQWS"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <89195613-d5b6-bfc6-1c8c-0d74d9d02a99-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Milo Kim <woogyom.kim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--AptwxgnoZDC4KQWS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Milo,

On Fri, Aug 26, 2016 at 05:00:37PM +0900, Milo Kim wrote:
> On 08/26/2016 04:10 PM, Maxime Ripard wrote:
> >>+			uart1_pins_a: uart1@0 {
> >>> +				allwinner,pins =3D "PG6", "PG7";
> >>> +				allwinner,function =3D "uart1";
> >>> +				allwinner,drive =3D <SUN4I_PINCTRL_10_MA>;
> >>> +				allwinner,pull =3D <SUN4I_PINCTRL_NO_PULL>;
> >>> +			};
> >>> +
> >Our policy is that we don't introduce new pinctrl nodes that are not
> >used by any board to avoid bloating the DT too much with unused nodes.
> >
> >If you have a board using it, please submit that change as well.
>=20
> OK, I agree.
>=20
> However, this pinmux is only useful in case PA5 is assigned for PWM.
> PA5 is commonly used for UART0_RX, so I'd like to add UART1 node into *.d=
ts
> and disable it (status =3D "disabled"). Does it make sense?

I guess UART1 is either used or not used on that board. In the former
case, it should be enabled, in the latter, left out of the DTS
entirely.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--AptwxgnoZDC4KQWS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXwMLMAAoJEBx+YmzsjxAgRy4P/ApeOZdmr5YRg8ZXe2/2l1ou
v//coqmbaExBtCv1kP2jABXtxr1lL1mkZO0OKF2WAi+M60zjA9U0Og/+4HVKSteJ
7G4em8K7hNfjsBqJQ8Duhd0A4xheo1Jeh8qDeFIuBjjdQRYGWZrVIl5e+PvOIYT2
tknWZKo9zWKrs23ZNW9rCxwk6Zcs1y6rvIn8Utk1g91KE4zUgmsJd6p3j0BUSpcn
9kTzgxzq/nqFGdiDEn8exHBldTtNRyj+UaCEligc0/YhrlIr8ZwTEzN0Nubh8PWa
M3pa9G21EzRs8EoU1KeDGr6e+gC8PBgOUZjl0ZxU2UMrceVUMnInG+/GqL5yCkYC
Ly4sOtAbMTzkVlGvxwM8q8/k8etsjtyUwtRuVV1Q9ywYkRBkivjrueqbzGK/rXry
NxFtJUHviA4Eyx909s1gKTf+lBWzZWeUbm00e1Keco+HXthKJ+cXvqJq8diEOc16
6tk2YL2YZEInY2qkZEZu2SgrSWfNwMtvEunyyurQKoxm02zbXUal/2HAPLMt7kwe
ISQy+m0r6AskHKNCc9WSacHCWo3dd1k/3FphCKalETu11LBZyka/mTeB27gNTwtV
jQNH+hpy0x+5iGwXTvGPI4mxFTJ8y/jB+AKrdZq9e41rKIgPcOnqdGf1IZvBEwl1
OrE+OaMzdmw+Z3Ma7Zws
=m87D
-----END PGP SIGNATURE-----

--AptwxgnoZDC4KQWS--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
