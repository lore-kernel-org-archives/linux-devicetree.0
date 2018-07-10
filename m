From: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Subject: Re: [PATCH v3 6/6] ARM: mx5: Set the DBGEN bit in ARM_GPC register
Date: Tue, 10 Jul 2018 18:23:38 +0200
Message-ID: <20180710162338.xchmiqm3xfvy6slo@earth.universe>
References: <1531238927-19579-1-git-send-email-fabio.estevam@nxp.com>
 <1531238927-19579-6-git-send-email-fabio.estevam@nxp.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============9216561480565100639=="
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1531238927-19579-6-git-send-email-fabio.estevam@nxp.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Fabio Estevam <fabio.estevam@nxp.com>
Cc: devicetree@vger.kernel.org, robh+dt@kernel.org, shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
List-Id: devicetree@vger.kernel.org


--===============9216561480565100639==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axr4l7db6rsbn5kr"
Content-Disposition: inline


--axr4l7db6rsbn5kr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jul 10, 2018 at 01:08:47PM -0300, Fabio Estevam wrote:
> On i.MX51/i.MX53 it is necessary to set the DBGEN bit in=20
> ARM_GPC register in order to turn on the debug clocks.
>=20
> The DBGEN bit of ARM_GPC register has the following description
> in the i.MX53 Reference Manual:
>=20
> "This allows the user to manually activate clocks within the debug
> system. This register bit directly controls the platform's dbgen_out
> output signal which connects to the DAP_SYS to enable all debug clocks.
> Once enabled, the clocks cannot be disabled except by asserting the
> disable_trace input of the DAP_SYS."
>=20
> Based on a previous patch from Sebastian Reichel.
>=20
> Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
> ---
> Changes since v2:
> - Also check for "secure-reg-access" presence (Sebastian)
> - Call of_node_put() (Sebastian)
>=20
>  arch/arm/mach-imx/common.h     |  1 +
>  arch/arm/mach-imx/cpu-imx5.c   | 43 ++++++++++++++++++++++++++++++++++++=
++++++
>  arch/arm/mach-imx/mach-imx51.c |  2 +-
>  arch/arm/mach-imx/mach-imx53.c |  2 +-
>  4 files changed, 46 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/arm/mach-imx/common.h b/arch/arm/mach-imx/common.h
> index 93225db7..423dd76 100644
> --- a/arch/arm/mach-imx/common.h
> +++ b/arch/arm/mach-imx/common.h
> @@ -62,6 +62,7 @@ void imx_gpc_set_arm_power_up_timing(u32 sw2iso, u32 sw=
);
>  void imx_gpc_set_arm_power_down_timing(u32 sw2iso, u32 sw);
>  void imx25_pm_init(void);
>  void imx27_pm_init(void);
> +void imx5_pmu_init(void);
> =20
>  enum mxc_cpu_pwr_mode {
>  	WAIT_CLOCKED,		/* wfi only */
> diff --git a/arch/arm/mach-imx/cpu-imx5.c b/arch/arm/mach-imx/cpu-imx5.c
> index 4f2d1c7..bba6e9b 100644
> --- a/arch/arm/mach-imx/cpu-imx5.c
> +++ b/arch/arm/mach-imx/cpu-imx5.c
> @@ -117,3 +117,46 @@ int mx53_revision(void)
>  	return mx5_cpu_rev;
>  }
>  EXPORT_SYMBOL(mx53_revision);
> +
> +#define ARM_GPC		0x4
> +#define DBGEN		BIT(16)
> +
> +/*
> + * This enables the DBGEN bit in ARM_GPC register, which is
> + * required for accessing some performance counter features.
> + * Technically it is only required while perf is used, but to
> + * keep the source code simple we just enable it all the time
> + * when the kernel configuration allows using the feature.
> + */
> +void __init imx5_pmu_init(void)
> +{
> +	void __iomem *tigerp_base;
> +	struct device_node *np;
> +	u32 gpc;
> +
> +	if (!IS_ENABLED(CONFIG_ARM_PMU))
> +		return;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "arm,cortex-a8-pmu");
> +	if (!np)
> +		return;
> +
> +	if (!of_property_read_bool(np, "secure-reg-access"))
> +		goto exit;

There is still a missing of_node_put() here. Otherwise

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>

> +	np =3D of_find_compatible_node(NULL, NULL, "fsl,imx51-tigerp");
> +	if (!np)
> +		goto exit;
> +
> +	tigerp_base =3D of_iomap(np, 0);
> +	if (!tigerp_base)
> +		goto exit;
> +
> +	gpc =3D readl_relaxed(tigerp_base + ARM_GPC);
> +	gpc |=3D DBGEN;
> +	writel_relaxed(gpc, tigerp_base + ARM_GPC);
> +	iounmap(tigerp_base);
> +exit:
> +	of_node_put(np);
> +
> +}
> diff --git a/arch/arm/mach-imx/mach-imx51.c b/arch/arm/mach-imx/mach-imx5=
1.c
> index 3835b6a..8838fba 100644
> --- a/arch/arm/mach-imx/mach-imx51.c
> +++ b/arch/arm/mach-imx/mach-imx51.c
> @@ -52,7 +52,7 @@ static void __init imx51_dt_init(void)
>  {
>  	imx51_ipu_mipi_setup();
>  	imx_src_init();
> -
> +	imx5_pmu_init();
>  	imx_aips_allow_unprivileged_access("fsl,imx51-aipstz");
>  }
> =20
> diff --git a/arch/arm/mach-imx/mach-imx53.c b/arch/arm/mach-imx/mach-imx5=
3.c
> index 07c2e8d..5ec7100 100644
> --- a/arch/arm/mach-imx/mach-imx53.c
> +++ b/arch/arm/mach-imx/mach-imx53.c
> @@ -31,7 +31,7 @@ static void __init imx53_init_early(void)
>  static void __init imx53_dt_init(void)
>  {
>  	imx_src_init();
> -
> +	imx5_pmu_init();
>  	imx_aips_allow_unprivileged_access("fsl,imx53-aipstz");
>  }

--axr4l7db6rsbn5kr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAltE3YoACgkQ2O7X88g7
+ppFfQ//dAuGTHCKgetlfkdfKxgzcXrV/NXnTPm3qVlABfm7BDFTiyOc3yuo+6jo
6qP8USRMMjDODG8YZk7MgsIAgwu7JeLguJ8YKICu/fLBaHY1u6td/YETJ0u9TvHP
CSGzJimfBT6ZSi8DFNQuKtxtUa2U6pMprSk4UQ0hmrEpx7JW4NbfxZisLCgZP0Dm
c6SOPuVWukWSP6TTCXdcgwoEUsLr860Bout7rVdh+u3u32V11tBzRVvnHi8w4kTY
LEWvqHziGdaLHvN+edr/qCy4fRQCoHJ/cqg3ctW8lqf+jKezhbtTMFMsS/c6ALf+
CeEyvxpgVUbN2A5ZQ6yjG8cT9UOBvqeZ8TMlrzKuxuaAgO4IYpNpBLGReLGL+qzX
DtISPqrrKoO17owqvgBOT2AlmhuW6JbC/CqPgC04bl88wobfTiko6nk9t1wLjrDg
wAmOUWD2VE1YWjgjfcx0+fufSZ5UuRx+WfwlY46R6yWP8wP9B8625tVeuaxibex+
v5FhFPIZvaQ5N7rrNfGM2UTNiqQ9Lj/cr14NZ38GWwd1Hb3r9ITjJJHZSrfvQg+h
mGkRsWnH1UwikmGMnLr3qgBlj2Viocojxew6W/gfJ2YOUpf/GL3OjuTOjNA8lRrA
4Yk8qbC8tJapVZleoXWK//ovwi6cUjO33+J61K3qTYJY7b01O4c=
=iMGN
-----END PGP SIGNATURE-----

--axr4l7db6rsbn5kr--


--===============9216561480565100639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============9216561480565100639==--
