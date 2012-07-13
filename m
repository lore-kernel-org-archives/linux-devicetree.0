From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [PATCH 00/11] make struct of_device_id.data const
Date: Fri, 13 Jul 2012 19:49:35 +0200
Message-ID: <20120713174935.GN592@pengutronix.de>
References: <1342182734-321-1-git-send-email-y> <5000175E.4070702@gmail.com>
 <20120713134638.GH592@pengutronix.de>
 <201207131624.27266.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201207131624.27266.arnd-r2nGTMty4D4@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello,

On Fri, Jul 13, 2012 at 04:24:26PM +0000, Arnd Bergmann wrote:
> On Friday 13 July 2012, Uwe Kleine-K=F6nig wrote:
> > On Fri, Jul 13, 2012 at 07:41:02AM -0500, Rob Herring wrote:
> > > On 07/13/2012 07:32 AM, y@pengutronix.de wrote:
> > > > From: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > > =

> > > > this series' goal is to make struct of_device_id.data const.
> > > > Conceptually a driver must not modify the data contained there so m=
aking
> > > > it const is the right thing.
> > > > =

> > > > This change might introduce warnings because drivers don't use cons=
t to
> > > > access the data pointed to by of_device_id.data. In most cases the =
fix
> > > > is to add some consts.
> > > > =

> > > > This series (apart from adding this const in patch 10) fixes all dr=
ivers
> > > > covered by all arm defconfigs (based on v3.5-rc6).
> > > > =

> > > =

> > > What about other arches?
> >
> > I didn't looked at them, mainly because I don't have the scripts for
> > arches other than arm to do such testing. Also note that it introduces
> > only some warnings, but no breakage. So adding the const in the merge
> > window might be ok?!
> =

> I think it makes sense to change the drivers that are easy to find now:
> =

> git grep -A6 of_device_id | grep '\<data\>.*=3D'  | brain
> =

> arch/c6x/platforms/plldata.c-   { .compatible =3D "ti,c6455-pll", .data =
=3D c6455_setup_clocks },
> arch/mips/lantiq/irq.c- { .compatible =3D "lantiq,icu", .data =3D icu_of_=
init },
> arch/powerpc/platforms/83xx/suspend.c-          .data =3D &pmc_types[0],
> arch/powerpc/platforms/cell/celleb_pci.c-               .data =3D &celleb=
_fake_pci_spec,
> arch/powerpc/platforms/cell/celleb_pci.c-               .data =3D &celleb=
_epci_spec,
> arch/powerpc/sysdev/fsl_msi.c-          .data =3D (void *)&mpic_msi_featu=
re,
> drivers/atm/fore200e.c-         .data =3D (void *) &fore200e_bus[1],
> drivers/char/xilinx_hwicap/xilinx_hwicap.c-     { .compatible =3D "xlnx,o=
pb-hwicap-1.00.b", .data =3D &buffer_icap_config},
> drivers/i2c/busses/i2c-mpc.c-   {.compatible =3D "mpc5200-i2c", .data =3D=
 &mpc_i2c_data_52xx, },
> drivers/macintosh/mediabay.c-   .data           =3D &keylargo_mb_ops,
> drivers/mfd/da9052-i2c.c-       { .compatible =3D "dlg,da9053-aa", .data =
=3D &da9052_i2c_id[1] },
> drivers/net/can/mscan/mpc5xxx_can.c-    { .compatible =3D "fsl,mpc5200-ms=
can", .data =3D &mpc5200_can_data, },
> drivers/scsi/qlogicpti.c-               .data =3D &qpti_template,
> drivers/usb/host/fsl-mph-dr-of.c-       { .compatible =3D "fsl-usb2-mph",=
 .data =3D &fsl_usb2_mpc8xxx_pd, },
> drivers/watchdog/mpc8xxx_wdt.c-         .data =3D &(struct mpc8xxx_wdt_ty=
pe) {
> =

> I'm optimistic that this list covers the vast majority of the non-ARM
> drivers, and some of them don't even need any changes. I've done
> patches for the others below.
> =

> Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
> ---
>  arch/powerpc/platforms/83xx/suspend.c    |    2 +-
>  arch/powerpc/platforms/cell/celleb_pci.c |    2 +-
>  arch/powerpc/sysdev/fsl_msi.c            |    8 ++++----
>  drivers/i2c/busses/i2c-mpc.c             |   12 ++++++------
>  drivers/macintosh/mediabay.c             |    8 ++++----
>  drivers/mfd/da9052-i2c.c                 |    4 ++--
>  drivers/net/can/mscan/mpc5xxx_can.c      |    6 +++---
>  drivers/scsi/qlogicpti.c                 |    2 +-
>  drivers/watchdog/mpc8xxx_wdt.c           |    2 +-
>  10 files changed, 23 insertions(+), 26 deletions(-)
> =

> diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platfor=
ms/83xx/suspend.c
> index 1a04671..1d769a2 100644
> --- a/arch/powerpc/platforms/83xx/suspend.c
> +++ b/arch/powerpc/platforms/83xx/suspend.c
> @@ -326,7 +326,7 @@ static int pmc_probe(struct platform_device *ofdev)
>  	const struct of_device_id *match;
>  	struct device_node *np =3D ofdev->dev.of_node;
>  	struct resource res;
> -	struct pmc_type *type;
> +	const struct pmc_type *type;
>  	int ret =3D 0;
>  =

>  	match =3D of_match_device(pmc_match, &ofdev->dev);
> diff --git a/arch/powerpc/platforms/cell/celleb_pci.c b/arch/powerpc/plat=
forms/cell/celleb_pci.c
> index 5822141..abc8af4 100644
> --- a/arch/powerpc/platforms/cell/celleb_pci.c
> +++ b/arch/powerpc/platforms/cell/celleb_pci.c
> @@ -472,7 +472,7 @@ int __init celleb_setup_phb(struct pci_controller *ph=
b)
>  {
>  	struct device_node *dev =3D phb->dn;
>  	const struct of_device_id *match;
> -	struct celleb_phb_spec *phb_spec;
> +	const struct celleb_phb_spec *phb_spec;
>  	int rc;
>  =

>  	match =3D of_match_node(celleb_phb_match, dev);
> diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
> index 6e097de..51ffafa 100644
> --- a/arch/powerpc/sysdev/fsl_msi.c
> +++ b/arch/powerpc/sysdev/fsl_msi.c
> @@ -368,7 +368,7 @@ static int __devinit fsl_of_msi_probe(struct platform=
_device *dev)
>  	int err, i, j, irq_index, count;
>  	int rc;
>  	const u32 *p;
> -	struct fsl_msi_feature *features;
> +	const struct fsl_msi_feature *features;
>  	int len;
>  	u32 offset;
>  	static const u32 all_avail[] =3D { 0, NR_MSI_IRQS };
> @@ -502,15 +502,15 @@ static const struct fsl_msi_feature vmpic_msi_featu=
re =3D {
>  static const struct of_device_id fsl_of_msi_ids[] =3D {
>  	{
>  		.compatible =3D "fsl,mpic-msi",
> -		.data =3D (void *)&mpic_msi_feature,
> +		.data =3D &mpic_msi_feature,
This looks unrelated.

>  	},
>  	{
>  		.compatible =3D "fsl,ipic-msi",
> -		.data =3D (void *)&ipic_msi_feature,
> +		.data =3D &ipic_msi_feature,
>  	},
>  	{
>  		.compatible =3D "fsl,vmpic-msi",
> -		.data =3D (void *)&vmpic_msi_feature,
> +		.data =3D &vmpic_msi_feature,
>  	},
>  	{}
>  };
> diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
> index b76731e..57f7703 100644
> --- a/drivers/i2c/busses/i2c-mpc.c
> +++ b/drivers/i2c/busses/i2c-mpc.c
> @@ -647,7 +647,7 @@ static int __devinit fsl_i2c_probe(struct platform_de=
vice *op)
>  	}
>  =

>  	if (match->data) {
> -		struct mpc_i2c_data *data =3D match->data;
> +		const struct mpc_i2c_data *data =3D match->data;
>  		data->setup(op->dev.of_node, i2c, clock, data->prescaler);
>  	} else {
>  		/* Backwards compatibility */
> @@ -730,24 +730,24 @@ static int mpc_i2c_resume(struct device *dev)
>  SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume);
>  #endif
>  =

> -static struct mpc_i2c_data mpc_i2c_data_512x __devinitdata =3D {
> +static const struct mpc_i2c_data mpc_i2c_data_512x __devinitdata =3D {
I guess this results in a warning until after patch 10 is applied? (A
few more down below.)

In the meantime I expanded my defconfig build script to handle powerpc,
too. I'll check these. I think I'll have to let the build run over
night...

Thanks Arnd for your effort.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
