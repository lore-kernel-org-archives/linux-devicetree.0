From: Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 2/3] dmaengine: sun6i: Add support for
 Allwinner A23 (sun8i) variant
Date: Tue, 16 Sep 2014 12:35:40 +0200
Message-ID: <20140916103540.GF9948@lukather>
References: <1410616381-30226-1-git-send-email-wens@csie.org>
 <1410616381-30226-3-git-send-email-wens@csie.org>
Reply-To: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hcut4fGOf7Kh6EdG"
Return-path: <linux-sunxi+bncBD2ZNBF5VYJRBJ5H4CQAKGQEIJM22MY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1410616381-30226-3-git-send-email-wens-jdAy2FN1RRM@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Cc: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org


--hcut4fGOf7Kh6EdG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 13, 2014 at 09:53:00PM +0800, Chen-Yu Tsai wrote:
> The A23 SoC has the same dma engine as the A31 (sun6i), with a
> reduced amount of endpoints and physical channels. Add the proper
> config data and compatible string to support it.
>=20
> A slight difference in sun8i is an undocumented register needs
> to be toggled for dma to function.
>=20
> Signed-off-by: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
> ---
>  Documentation/devicetree/bindings/dma/sun6i-dma.txt |  2 +-
>  drivers/dma/Kconfig                                 |  4 ++--
>  drivers/dma/sun6i-dma.c                             | 20 +++++++++++++++=
+++++
>  3 files changed, 23 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/sun6i-dma.txt b/Docume=
ntation/devicetree/bindings/dma/sun6i-dma.txt
> index 3e145c1..9cdcba24d 100644
> --- a/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> +++ b/Documentation/devicetree/bindings/dma/sun6i-dma.txt
> @@ -4,7 +4,7 @@ This driver follows the generic DMA bindings defined in d=
ma.txt.
> =20
>  Required properties:
> =20
> -- compatible:	Must be "allwinner,sun6i-a31-dma"
> +- compatible:	Must be "allwinner,sun6i-a31-dma" or "allwinner,sun8i-a23-=
dma"
>  - reg:		Should contain the registers base address and length
>  - interrupts:	Should contain a reference to the interrupt used by this d=
evice
>  - clocks:	Should contain a reference to the parent AHB clock
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 9b1ea0e..5361aa7 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -395,12 +395,12 @@ config XILINX_VDMA
> =20
>  config DMA_SUN6I
>  	tristate "Allwinner A31 SoCs DMA support"
> -	depends on MACH_SUN6I || COMPILE_TEST
> +	depends on MACH_SUN6I || MACH_SUN8I || COMPILE_TEST
>  	depends on RESET_CONTROLLER
>  	select DMA_ENGINE
>  	select DMA_VIRTUAL_CHANNELS
>  	help
> -	  Support for the DMA engine for Allwinner A31 SoCs.
> +	  Support for the DMA engine first found in Allwinner A31 SoCs.
> =20
>  config NBPFAXI_DMA
>  	tristate "Renesas Type-AXI NBPF DMA support"
> diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
> index 89ca0c4..29667dd 100644
> --- a/drivers/dma/sun6i-dma.c
> +++ b/drivers/dma/sun6i-dma.c
> @@ -878,8 +878,20 @@ static struct sun6i_dma_config sun6i_a31_dma_cfg =3D=
 {
>  	.nr_max_vchans   =3D 53,
>  };
> =20
> +/*
> + * The A23 only has 8 physical channels, a maximum DRQ port id of 24,
> + * and a total of 37 usable source and destination endpoints.
> + */
> +
> +static struct sun6i_dma_config sun8i_a23_dma_cfg =3D {
> +	.nr_max_channels =3D 8,
> +	.nr_max_requests =3D 24,
> +	.nr_max_vchans   =3D 37,
> +};
> +
>  static struct of_device_id sun6i_dma_match[] =3D {
>  	{ .compatible =3D "allwinner,sun6i-a31-dma", .data =3D &sun6i_a31_dma_c=
fg },
> +	{ .compatible =3D "allwinner,sun8i-a23-dma", .data =3D &sun8i_a23_dma_c=
fg },
>  	{ /* sentinel */ }
>  };
> =20
> @@ -1008,6 +1020,14 @@ static int sun6i_dma_probe(struct platform_device =
*pdev)
>  		goto err_dma_unregister;
>  	}
> =20
> +	/*
> +	 * sun8i variant requires us to toggle an undocumented register,
> +	 * as seen in Allwinner's SDK.

The BSP I have has this:

static void sunxi_dma_hw_init(struct sunxi_dmadev *dev)
{
        struct sunxi_dmadev *sunxi_dev =3D dev;

        clk_prepare_enable(sunxi_dev->ahb_clk);
#ifdef CONFIG_ARCH_SUN8IW3
        writel(0x04, sunxi_dev->base + DMA_GATE);
#endif
}

/* All is ok, and open the clock */
sunxi_dma_hw_init(sunxi_dev);

So I guess we can say that it's not that undocumented :)

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--hcut4fGOf7Kh6EdG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJUGBJ8AAoJEBx+YmzsjxAgT84P/3z409e7xk7xnTaM0cDFhmNz
k48oB/ekb4ydmJoq8McnjdThKgeOicyHpZv8zBIvY30ERoMENDNu0AXiDk8zRhhn
RA77hp+O2XSEfuekXWXdRhFNRj/KLspW+H/+9hNUN4/iN+CQ2SM2PXhuukN0Rvqn
RLg9s7gut1FPvf8Zquy6JgYsWf/24x3ff/bdzJ2g9mDhLvrUO+tN8o3M+v8XQPAe
wJbIbnifiIfWL4XgKBDai7qQx0gatH5miNwjUueaLeMUM6CNmlorhqCZ+I5O20Ub
uASkgNtvt7hxhLAqgXgkLIi9svKQLqGgWjdDDKsaLTxWK3OasQ261zcICyxoi9yC
tghsoNfdQMlTBFQmM9Bz/jwAWO1G8t4rGjdeTFZZXhA7hQzWzjPSagI+ZweQ+6sy
EyizIQAR8PDX4pObqoqSqVkV2fs5T44qehhILLNBIonP2Jk0lcOYInKgQ/JFSAoi
z0nI/zcaIYLeXkp6bBJ3T+/OYzXZjlkSgDnc4FCt2PsHaj77EJJ+nwS/A+8a7oYm
jsPAoAYxfQ8PGiFVz0O0NZmGT1QXKBxOL9EKkEzISswpIeSGfqH9COm3Oi3EbMWz
I299LRLDelXBbzcd+YQhwoKRwUN/u7xM5FQvcMn6M7sdxPmO5qG58pmUvoJqS/F2
GGgjq2aaCykdrSryTA0a
=4hHq
-----END PGP SIGNATURE-----

--hcut4fGOf7Kh6EdG--
