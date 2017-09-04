From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/10] dmaengine: sun6i: Correct setting of
 clock autogating register for A83T/H3
Date: Mon, 4 Sep 2017 09:06:20 +0200
Message-ID: <20170904070620.3lpkmq6nt2qrgwah@flea>
References: <20170903224100.17893-1-stefan.bruens@rwth-aachen.de>
 <20170903224100.17893-2-stefan.bruens@rwth-aachen.de>
 <b88769ec-a42d-6b8e-d211-8f1cea139254@arm.com>
Reply-To: maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iatbwsmpe4tb2w4b"
Return-path: <linux-sunxi+bncBDSJBYGBRIMBB57WWPGQKGQESHV2STA-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Content-Disposition: inline
In-Reply-To: <b88769ec-a42d-6b8e-d211-8f1cea139254-5wv7dgnIgG8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: =?iso-8859-1?Q?Andr=E9?= Przywara <andre.przywara-5wv7dgnIgG8@public.gmane.org>
Cc: Stefan =?iso-8859-1?Q?Br=FCns?= <stefan.bruens-vA1bhqPz9FBZXbeN9DUtxg@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Code Kipper <codekipper-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org


--iatbwsmpe4tb2w4b
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 04, 2017 at 12:23:09AM +0100, Andr=C3=A9 Przywara wrote:
> On 03/09/17 23:40, Stefan Br=C3=BCns wrote:
> > The H83T uses a compatible string different from the A23, but requires
>=20
>       A83T
>=20
> > the same clock autogating register setting.
> >=20
> > The H3 also requires setting the clock autogating register, but has
> > the register at a different offset.
> >=20
> > Some currently available SoCs not yet supported by the sun6i-dma driver
> > will require new compatible strings. These SoCs either follow the A23
> > register model (e.g. V3s) or the H3 register model (A64, R40), so a new
> > variable is added to the config struct to group SoCs with common regist=
er
> > models.
>=20
> As mentioned in that other mail, using the actual properties as names
> here instead of grouping them to rather arbitrary groups seems more
> useful and future-proof to me and should be easier to read.
> In this case this should simplify this patch:
> sun8i_a23_dma_cfg =3D {
>  	.nr_max_channels =3D 8,
>  	.nr_max_requests =3D 24,
>  	.nr_max_vchans   =3D 37,
> +	.auto_clock_gate =3D 0x20,
> ...
> -	if (of_device_is_compatible(pdev->dev.of_node,
> -				    "allwinner,sun8i-a23-dma"))
> -		writel(SUN8I_DMA_GATE_ENABLE, sdc->base + SUN8I_DMA_GATE);
> +	if (sdc->cfg->auto_clock_gate)
> +		writel(SUN8I_DMA_GATE_ENABLE,
> +		       sdc->base + sdc->cfg->auto_clock_gate);

I agree.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.

--iatbwsmpe4tb2w4b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZrPtrAAoJEBx+YmzsjxAgQuUP/3JYzWfaEoi3T11Pz3hu0Kcn
4EKA+vrCUxXR5kWRZZ8Lx71YKfCRiMVLLhEumyE/nXkgtKo6P0v3Cf2S42mcDq3j
xoffwRPx84Yp7EByAWAxTGI3aLprSQsO0dyUHW6VJBs/Fdid+HjXMY+MOAnAPjXE
wrIvzwEDMINHhgjkwmuRDrANue/RSci3ynQBJNyZ27RVqVZ/znMlpZM0uywDRrjJ
DbmEyE0dEZ/AG3SfyNbEIgNcqfmXraOVvF4/0LczKvlHrmkIxQMQRtQn7S5MJ4MA
BIOMz3P8sFUgqjXkIt0eO2Q44su3g7tpUsR0GjIVBLbC2aNK/QXqnL4Tk3Bj9B78
t9UPCRSLN5JgPnBk1WScNfrD3eAJsTXBolt1hvIqWTRNMTdrYNamd8u+zAe2b1bq
kEf7Un02WOMXjrI1cKCrGWMit0hNsI5yh/auZ+NdcNVCxbwyvEgkczpTz2cKRn9y
UG3sSB/LQexAd8VSbeYnn6JeWUgo80ps+cTouaqiioSmp2GZQeRQUhSd91KH82xQ
ApUMBZ2Lr/ezBMmm+SG+5cjWY/7Gg98xDow6Ch0l83uQkBY0S0Ma3Zjpa+dFrw6g
ttAxdrd+LsNcLXKRXlFEeHB+JXjPc+cDMljDXtuvy/8kpuCuut4DLOIPHJMQ1Bsp
CPO7YkPEaShiPU2kbqkm
=pWEi
-----END PGP SIGNATURE-----

--iatbwsmpe4tb2w4b--
