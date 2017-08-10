From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7743: Add IIC cores to dtsi
Date: Thu, 10 Aug 2017 13:24:11 +0200
Message-ID: <20170810112411.GA4380@katana>
References: <1502196418-31341-1-git-send-email-biju.das@bp.renesas.com>
 <12d923ba-184c-ef59-f27b-41a7592a5f93@cogentembedded.com>
 <20170810080121.GE16647@verge.net.au>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170810080121.GE16647-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Cc: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>, Biju Das <biju.das-kTT6dE0pTRh9uiUsa/gSgQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Magnus Damm <magnus.damm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Chris Paterson <chris.paterson2-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > >+		i2c6: i2c@e60b0000 {
> >=20
> >    I'd use iic0 as the label.
>=20
> I have no preference here other than that we try to be consistent
> in DT for different R-Car SoCs. Wolfram, do you have an opinion on this?

Back then, for M2-W, I decided to go with the schematics/datasheets.
And those mentioned i2c6 rather than iic0. For that reason, the comment

"/* The memory map in the User's Manual maps the cores to bus numbers */"

exists in r8a7791.dtsi. Dunno the manual of this SoC here.


--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlmMQlcACgkQFA3kzBSg
KbbrDw/9GbIlcfEPP2pVfBfgSDS1AcPeWNphcRPskadWKquynFLGO3p3KnFMiIx1
hvU4TZm6coPeQGH11aW10LUHA7GGVpWN7Zu0HMJfm6UeVJX3Uw1WqK/ymBSNYrHb
tqN1HnzIaqymZsdy/Qrl8ERkGB/c8EHp7cTN9MXN2XBN6FR/I0U32NCatsXRCVyL
SA6w4/cSQIs+70XeLczpwuXm2nr1ehR6TdKTBJWuM26uJGzUZod5DLMZG/ZFvDrG
OMRiPx+n0rQL7vdUml9Vz76VPSOxJc170Of/zSKfJI4H2yly3AsZcqDumXwkuIFS
0EKFXMLiRialUaLHV6kAwbseR/RAZzqb3Js7AFItlTeKCzZsQz8Yn9NBd2pB5aT2
m+8A+pu6ISwz3Eqsxh4kLgRE+tK7WYGcBmAK8KJKuj8MQLg39LR/Fa2/hfTbzKf7
erRv4YLqfcddXBv5Mv+UBCa+LaJXYeWKakqTGYznYlGhFTt0oaTelmZXtXsqjXSo
lZ52ms3szZhPiefP0T+u5fLBhLkEWexYaC7bUSfRB3uPBLjGdNlrPz5HHMR0pbjk
vLNNNjiktknfrmLrkQqXQkD9N/6uubGstCQBB3IxuSF92t31WwLhYfEqw/dOjZzi
32JO1FNdM+frjFhkHLHoKZuswkdC+Z3qli+NCTYsL2eerKrecok=
=QDrh
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
