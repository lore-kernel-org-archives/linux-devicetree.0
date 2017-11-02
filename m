From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 00/10] Allwinner H3/H5/A64(DE2) SimpleFB support
Date: Thu, 2 Nov 2017 16:44:47 +0100
Message-ID: <20171102154447.b5qo3rvu5djxupay@flea>
References: <20171027150658.18509-1-icenowy@aosc.io>
 <9bca10cc95d04f87a1122bc582402310@aosc.io>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="766nqwxqmfxoxega"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9bca10cc95d04f87a1122bc582402310-h8G6r0blFSE@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
Cc: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org


--766nqwxqmfxoxega
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 02, 2017 at 04:51:29PM +0800, Icenowy Zheng wrote:
> =E5=9C=A8 2017-10-27 23:06=EF=BC=8CIcenowy Zheng =E5=86=99=E9=81=93=EF=BC=
=9A
> > This patchset adds support for the SimpleFB on Allwinner SoCs with
> > "Display Engine 2.0".
> >=20
> > PATCH 1 to PATCH 3 are DE2 CCU fixes for H3/H5 SoCs.
> >=20
> > PATCH 4 adds the pipeline strings for DE2 SimpleFB.
> >=20
> > PATCH 5 to 7 adds necessary device tree nodes (DE2 CCU and SimpleFB)
> > for H3/H5 SoCs.
> >=20
> > PATCH 8 to 10 are for Allwinner A64 SoC to enable SimpleFB.
> >=20
> > Icenowy Zheng (10):
> >   dt-bindings: fix the binding of Allwinner DE2 CCU of A83T and H3
> >   clk: sunxi-ng: add support for Allwinner H3 DE2 CCU
> >   clk: sunxi-ng: fix the A64/H5 clock description of DE2 CCU
> >   dt-bindings: simplefb-sunxi: add pipelines for DE2
> >   ARM: sun8i: h3/h5: add DE2 CCU device node for H3
> >   arm64: allwinner: h5: add compatible string for DE2 CCU
> >   ARM: sunxi: h3/h5: add simplefb nodes
> >   dt-bindings: add binding for A64 DE2 CCU SRAM
> >   arm64: allwinner: a64: add DE2 CCU for A64 SoC
> >   arm64: allwinner: a64: add simplefb for A64 SoC
>=20
> Maxime, could you review and, if possible, apply the H3/5
> part of this patchset?

This came a bit late, we're too close from the merge window
now. Please resend them after -rc1 is out.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--766nqwxqmfxoxega
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ+z1vAAoJEBx+YmzsjxAgJQYP/RoY+HL7SVN8c/UCknR2nmtj
1hzOlmcXJs5ZeMxA5H7Mb0Hs/lhhAI8YhGK3y+ChH6VhmkgqtfExjIgKBDGmMpSt
LKeAP5cg0nDfxu1/XCBCp0u9O4bK0l9epggZ8+/1JjBZ3BuZcXBCcwrD+KqgrZDc
yvxsphuFBlerJwPOjTlDlpN4czKwYVledLwoC69Ru6/ijT7as55pcypVEK+SnXMH
vTZBPU4CigL29Ofpr+67SAxe/0Ow+9r+RxyPHdwaWYQUKBMVfyACjlO0uKadzUmB
aB0C3kp1/6HcUiNRF7+IEXuukidIC1PlH42EJdb2JFb2uRLg44f2wnLx8bmN/4Rr
AL1dtEXmJ7g3zixKNTa30fpoFXontBub9xYmDXOBuVEwBQtQU1QUWTrTn8IANY1j
94AcvxkRyPbcqWVsVNFItLdhq5yks/hAv0Rq7kTIGZxF43ZPn0FL55rG2q5lcV6f
r9N9RYmdw8MooOjipyO43+ZkiXQDCO+ZweOG83FwRnADytvIInJ58BQifLx3mBms
gYBwYabxO0ZnbwwHaoJAnLaezqiDNb8uhSq2vjvCZJWBkBSBAnKgnesC2VdvBvLQ
JWJzexem1yNxhcADeMnggSW4TOjJGQCZCNVnUuPmFyRalH0a2eNfQ7rH/cAlSjHo
gRHUEFSSGpSoQdA6jLeh
=DTuu
-----END PGP SIGNATURE-----

--766nqwxqmfxoxega--
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
