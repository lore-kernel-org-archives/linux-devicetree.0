From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 00/11] make struct of_device_id.data const
Date: Fri, 13 Jul 2012 16:24:26 +0000
Message-ID: <201207131624.27266.arnd@arndb.de>
References: <1342182734-321-1-git-send-email-y> <5000175E.4070702@gmail.com>
 <20120713134638.GH592@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120713134638.GH592-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
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
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Friday 13 July 2012, Uwe Kleine-K=F6nig wrote:
> On Fri, Jul 13, 2012 at 07:41:02AM -0500, Rob Herring wrote:
> > On 07/13/2012 07:32 AM, y@pengutronix.de wrote:
> > > From: Uwe Kleine-K=F6nig <u.kleine-koenig-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> > > =

> > > this series' goal is to make struct of_device_id.data const.
> > > Conceptually a driver must not modify the data contained there so mak=
ing
> > > it const is the right thing.
> > > =

> > > This change might introduce warnings because drivers don't use const =
to
> > > access the data pointed to by of_device_id.data. In most cases the fix
> > > is to add some consts.
> > > =

> > > This series (apart from adding this const in patch 10) fixes all driv=
ers
> > > covered by all arm defconfigs (based on v3.5-rc6).
> > > =

> > =

> > What about other arches?
>
> I didn't looked at them, mainly because I don't have the scripts for
> arches other than arm to do such testing. Also note that it introduces
> only some warnings, but no breakage. So adding the const in the merge
> window might be ok?!

I think it makes sense to change the drivers that are easy to find now:

git grep -A6 of_device_id | grep '\<data\>.*=3D'  | brain

arch/c6x/platforms/plldata.c-   { .compatible =3D "ti,c6455-pll", .data =3D=
 c6455_setup_clocks },
arch/mips/lantiq/irq.c- { .compatible =3D "lantiq,icu", .data =3D icu_of_in=
it },
arch/powerpc/platforms/83xx/suspend.c-          .data =3D &pmc_types[0],
arch/powerpc/platforms/cell/celleb_pci.c-               .data =3D &celleb_f=
ake_pci_spec,
arch/powerpc/platforms/cell/celleb_pci.c-               .data =3D &celleb_e=
pci_spec,
arch/powerpc/sysdev/fsl_msi.c-          .data =3D (void *)&mpic_msi_feature,
drivers/atm/fore200e.c-         .data =3D (void *) &fore200e_bus[1],
drivers/char/xilinx_hwicap/xilinx_hwicap.c-     { .compatible =3D "xlnx,opb=
-hwicap-1.00.b", .data =3D &buffer_icap_config},
drivers/i2c/busses/i2c-mpc.c-   {.compatible =3D "mpc5200-i2c", .data =3D &=
mpc_i2c_data_52xx, },
drivers/macintosh/mediabay.c-   .data           =3D &keylargo_mb_ops,
drivers/mfd/da9052-i2c.c-       { .compatible =3D "dlg,da9053-aa", .data =
=3D &da9052_i2c_id[1] },
drivers/net/can/mscan/mpc5xxx_can.c-    { .compatible =3D "fsl,mpc5200-msca=
n", .data =3D &mpc5200_can_data, },
drivers/scsi/qlogicpti.c-               .data =3D &qpti_template,
drivers/usb/host/fsl-mph-dr-of.c-       { .compatible =3D "fsl-usb2-mph", .=
data =3D &fsl_usb2_mpc8xxx_pd, },
drivers/watchdog/mpc8xxx_wdt.c-         .data =3D &(struct mpc8xxx_wdt_type=
) {

I'm optimistic that this list covers the vast majority of the non-ARM
drivers, and some of them don't even need any changes. I've done
patches for the others below.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
---
 arch/powerpc/platforms/83xx/suspend.c    |    2 +-
 arch/powerpc/platforms/cell/celleb_pci.c |    2 +-
 arch/powerpc/sysdev/fsl_msi.c            |    8 ++++----
 drivers/i2c/busses/i2c-mpc.c             |   12 ++++++------
 drivers/macintosh/mediabay.c             |    8 ++++----
 drivers/mfd/da9052-i2c.c                 |    4 ++--
 drivers/net/can/mscan/mpc5xxx_can.c      |    6 +++---
 drivers/scsi/qlogicpti.c                 |    2 +-
 drivers/watchdog/mpc8xxx_wdt.c           |    2 +-
 10 files changed, 23 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/suspend.c b/arch/powerpc/platforms=
/83xx/suspend.c
index 1a04671..1d769a2 100644
--- a/arch/powerpc/platforms/83xx/suspend.c
+++ b/arch/powerpc/platforms/83xx/suspend.c
@@ -326,7 +326,7 @@ static int pmc_probe(struct platform_device *ofdev)
 	const struct of_device_id *match;
 	struct device_node *np =3D ofdev->dev.of_node;
 	struct resource res;
-	struct pmc_type *type;
+	const struct pmc_type *type;
 	int ret =3D 0;
 =

 	match =3D of_match_device(pmc_match, &ofdev->dev);
diff --git a/arch/powerpc/platforms/cell/celleb_pci.c b/arch/powerpc/platfo=
rms/cell/celleb_pci.c
index 5822141..abc8af4 100644
--- a/arch/powerpc/platforms/cell/celleb_pci.c
+++ b/arch/powerpc/platforms/cell/celleb_pci.c
@@ -472,7 +472,7 @@ int __init celleb_setup_phb(struct pci_controller *phb)
 {
 	struct device_node *dev =3D phb->dn;
 	const struct of_device_id *match;
-	struct celleb_phb_spec *phb_spec;
+	const struct celleb_phb_spec *phb_spec;
 	int rc;
 =

 	match =3D of_match_node(celleb_phb_match, dev);
diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index 6e097de..51ffafa 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -368,7 +368,7 @@ static int __devinit fsl_of_msi_probe(struct platform_d=
evice *dev)
 	int err, i, j, irq_index, count;
 	int rc;
 	const u32 *p;
-	struct fsl_msi_feature *features;
+	const struct fsl_msi_feature *features;
 	int len;
 	u32 offset;
 	static const u32 all_avail[] =3D { 0, NR_MSI_IRQS };
@@ -502,15 +502,15 @@ static const struct fsl_msi_feature vmpic_msi_feature=
 =3D {
 static const struct of_device_id fsl_of_msi_ids[] =3D {
 	{
 		.compatible =3D "fsl,mpic-msi",
-		.data =3D (void *)&mpic_msi_feature,
+		.data =3D &mpic_msi_feature,
 	},
 	{
 		.compatible =3D "fsl,ipic-msi",
-		.data =3D (void *)&ipic_msi_feature,
+		.data =3D &ipic_msi_feature,
 	},
 	{
 		.compatible =3D "fsl,vmpic-msi",
-		.data =3D (void *)&vmpic_msi_feature,
+		.data =3D &vmpic_msi_feature,
 	},
 	{}
 };
diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index b76731e..57f7703 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -647,7 +647,7 @@ static int __devinit fsl_i2c_probe(struct platform_devi=
ce *op)
 	}
 =

 	if (match->data) {
-		struct mpc_i2c_data *data =3D match->data;
+		const struct mpc_i2c_data *data =3D match->data;
 		data->setup(op->dev.of_node, i2c, clock, data->prescaler);
 	} else {
 		/* Backwards compatibility */
@@ -730,24 +730,24 @@ static int mpc_i2c_resume(struct device *dev)
 SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume);
 #endif
 =

-static struct mpc_i2c_data mpc_i2c_data_512x __devinitdata =3D {
+static const struct mpc_i2c_data mpc_i2c_data_512x __devinitdata =3D {
 	.setup =3D mpc_i2c_setup_512x,
 };
 =

-static struct mpc_i2c_data mpc_i2c_data_52xx __devinitdata =3D {
+static const struct mpc_i2c_data mpc_i2c_data_52xx __devinitdata =3D {
 	.setup =3D mpc_i2c_setup_52xx,
 };
 =

-static struct mpc_i2c_data mpc_i2c_data_8313 __devinitdata =3D {
+static const struct mpc_i2c_data mpc_i2c_data_8313 __devinitdata =3D {
 	.setup =3D mpc_i2c_setup_8xxx,
 };
 =

-static struct mpc_i2c_data mpc_i2c_data_8543 __devinitdata =3D {
+static const struct mpc_i2c_data mpc_i2c_data_8543 __devinitdata =3D {
 	.setup =3D mpc_i2c_setup_8xxx,
 	.prescaler =3D 2,
 };
 =

-static struct mpc_i2c_data mpc_i2c_data_8544 __devinitdata =3D {
+static const struct mpc_i2c_data mpc_i2c_data_8544 __devinitdata =3D {
 	.setup =3D mpc_i2c_setup_8xxx,
 	.prescaler =3D 3,
 };
diff --git a/drivers/macintosh/mediabay.c b/drivers/macintosh/mediabay.c
index 831d751..3f8d032 100644
--- a/drivers/macintosh/mediabay.c
+++ b/drivers/macintosh/mediabay.c
@@ -63,7 +63,7 @@ struct media_bay_info {
 	int				value_count;
 	int				timer;
 	struct macio_dev		*mdev;
-	struct mb_ops*			ops;
+	const struct mb_ops*		ops;
 	int				index;
 	int				cached_gpio;
 	int				sleeping;
@@ -669,7 +669,7 @@ static int media_bay_resume(struct macio_dev *mdev)
 =

 /* Definitions of "ops" structures.
  */
-static struct mb_ops ohare_mb_ops =3D {
+static const struct mb_ops ohare_mb_ops =3D {
 	.name		=3D "Ohare",
 	.content	=3D ohare_mb_content,
 	.power		=3D ohare_mb_power,
@@ -678,7 +678,7 @@ static struct mb_ops ohare_mb_ops =3D {
 	.un_reset_ide	=3D ohare_mb_un_reset_ide,
 };
 =

-static struct mb_ops heathrow_mb_ops =3D {
+static const struct mb_ops heathrow_mb_ops =3D {
 	.name		=3D "Heathrow",
 	.content	=3D heathrow_mb_content,
 	.power		=3D heathrow_mb_power,
@@ -687,7 +687,7 @@ static struct mb_ops heathrow_mb_ops =3D {
 	.un_reset_ide	=3D heathrow_mb_un_reset_ide,
 };
 =

-static struct mb_ops keylargo_mb_ops =3D {
+static const struct mb_ops keylargo_mb_ops =3D {
 	.name		=3D "KeyLargo",
 	.init		=3D keylargo_mb_init,
 	.content	=3D keylargo_mb_content,
diff --git a/drivers/mfd/da9052-i2c.c b/drivers/mfd/da9052-i2c.c
index 82c9d64..352c58b 100644
--- a/drivers/mfd/da9052-i2c.c
+++ b/drivers/mfd/da9052-i2c.c
@@ -46,7 +46,7 @@ static int da9052_i2c_enable_multiwrite(struct da9052 *da=
9052)
 	return 0;
 }
 =

-static struct i2c_device_id da9052_i2c_id[] =3D {
+static const struct i2c_device_id da9052_i2c_id[] =3D {
 	{"da9052", DA9052},
 	{"da9053-aa", DA9053_AA},
 	{"da9053-ba", DA9053_BA},
@@ -104,7 +104,7 @@ static int __devinit da9052_i2c_probe(struct i2c_client=
 *client,
 		const struct of_device_id *deviceid;
 =

 		deviceid =3D of_match_node(dialog_dt_ids, np);
-		id =3D (const struct i2c_device_id *)deviceid->data;
+		id =3D deviceid->data;
 	}
 #endif
 =

diff --git a/drivers/net/can/mscan/mpc5xxx_can.c b/drivers/net/can/mscan/mp=
c5xxx_can.c
index 5caa572..8a8df82 100644
--- a/drivers/net/can/mscan/mpc5xxx_can.c
+++ b/drivers/net/can/mscan/mpc5xxx_can.c
@@ -251,7 +251,7 @@ static struct of_device_id mpc5xxx_can_table[];
 static int __devinit mpc5xxx_can_probe(struct platform_device *ofdev)
 {
 	const struct of_device_id *match;
-	struct mpc5xxx_can_data *data;
+	const struct mpc5xxx_can_data *data;
 	struct device_node *np =3D ofdev->dev.of_node;
 	struct net_device *dev;
 	struct mscan_priv *priv;
@@ -380,12 +380,12 @@ static int mpc5xxx_can_resume(struct platform_device =
*ofdev)
 }
 #endif
 =

-static struct mpc5xxx_can_data __devinitdata mpc5200_can_data =3D {
+static const struct mpc5xxx_can_data __devinitdata mpc5200_can_data =3D {
 	.type =3D MSCAN_TYPE_MPC5200,
 	.get_clock =3D mpc52xx_can_get_clock,
 };
 =

-static struct mpc5xxx_can_data __devinitdata mpc5121_can_data =3D {
+static const struct mpc5xxx_can_data __devinitdata mpc5121_can_data =3D {
 	.type =3D MSCAN_TYPE_MPC5121,
 	.get_clock =3D mpc512x_can_get_clock,
 };
diff --git a/drivers/scsi/qlogicpti.c b/drivers/scsi/qlogicpti.c
index b191dd5..53ed15b 100644
--- a/drivers/scsi/qlogicpti.c
+++ b/drivers/scsi/qlogicpti.c
@@ -1305,7 +1305,7 @@ static int __devinit qpti_sbus_probe(struct platform_=
device *op)
 	match =3D of_match_device(qpti_match, &op->dev);
 	if (!match)
 		return -EINVAL;
-	tpnt =3D match->data;
+	tpnt =3D (void *)match->data;
 =

 	/* Sometimes Antares cards come up not completely
 	 * setup, and we get a report of a zero IRQ.
diff --git a/drivers/watchdog/mpc8xxx_wdt.c b/drivers/watchdog/mpc8xxx_wdt.c
index 40f7bf1..e6a038a 100644
--- a/drivers/watchdog/mpc8xxx_wdt.c
+++ b/drivers/watchdog/mpc8xxx_wdt.c
@@ -193,7 +193,7 @@ static int __devinit mpc8xxx_wdt_probe(struct platform_=
device *ofdev)
 	int ret;
 	const struct of_device_id *match;
 	struct device_node *np =3D ofdev->dev.of_node;
-	struct mpc8xxx_wdt_type *wdt_type;
+	const struct mpc8xxx_wdt_type *wdt_type;
 	u32 freq =3D fsl_get_sys_freq();
 	bool enabled;
 =
