From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 07/14] drivers/smsc911x: add DT support
Date: Wed, 18 Aug 2010 15:17:09 -0600
Message-ID: <AANLkTinK9PFm_XBgYQwWdCEtBAernkwdH2CcpftW4b=B@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-8-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org, David Miller <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>
List-Id: devicetree@vger.kernel.org

[cc'ing networking maintainer David Miller to keep him in the loop]

Hi Lorenzo,

A number of comments below and some rework required, but in general
the approach looks good and impact on the core driver is limited to
the start of the .probe() routine.

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> When OF is enabled the device driver should initialize the match table
> in order to be probable from the device tree. Furthermore, HW properties
> should be retrieved from the device tree node, so a device tree probe
> function is required to parse node properties at run-time. To avoid
> preprocessor macros, open firmware functions are defined in a separate
> C file that is optionally compiled-in.
>
> This patch adds the infrastructure needed to enable device tree parsing
> to smsc911 platform driver, inclusive of Makefile and device tree
> parsing functions. Driver properties should be defined and retrieved
> from the device tree if OF is enabled, otherwise the driver would fall
> back to platform data static initialization.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/net/Makefile =A0 =A0 =A0| =A0 =A03 +-
> =A0drivers/net/smsc911x-of.c | =A0 53 +++++++++++++++++++++++++++++++++++=
++++++++++
> =A0drivers/net/smsc911x.c =A0 =A0| =A0 28 ++++++++++++++++-------
> =A0drivers/net/smsc911x.h =A0 =A0| =A0 =A08 ++++++
> =A04 files changed, 82 insertions(+), 10 deletions(-)
> =A0create mode 100644 drivers/net/smsc911x-of.c
>
> diff --git a/drivers/net/Makefile b/drivers/net/Makefile
> index 0a0512a..0d2faf9 100644
> --- a/drivers/net/Makefile
> +++ b/drivers/net/Makefile
> @@ -243,7 +243,8 @@ obj-$(CONFIG_VXGE) +=3D vxge/
> =A0obj-$(CONFIG_MYRI10GE) +=3D myri10ge/
> =A0obj-$(CONFIG_SMC91X) +=3D smc91x.o
> =A0obj-$(CONFIG_SMC911X) +=3D smc911x.o
> -obj-$(CONFIG_SMSC911X) +=3D smsc911x.o
> +smsc911x_of-$(CONFIG_OF) :=3D smsc911x-of.o
> +obj-$(CONFIG_SMSC911X) +=3D smsc911x.o $(smsc911x_of-y)
> =A0obj-$(CONFIG_BFIN_MAC) +=3D bfin_mac.o
> =A0obj-$(CONFIG_DM9000) +=3D dm9000.o
> =A0obj-$(CONFIG_PASEMI_MAC) +=3D pasemi_mac_driver.o
> diff --git a/drivers/net/smsc911x-of.c b/drivers/net/smsc911x-of.c
> new file mode 100644
> index 0000000..b8751cf
> --- /dev/null
> +++ b/drivers/net/smsc911x-of.c
> @@ -0,0 +1,53 @@
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_platform.h>
> +#include <linux/of.h>
> +#include <linux/smsc911x.h>
> +#include <linux/kernel.h>
> +
> +#include "smsc911x.h"
> +
> +
> +int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct device_node *node =3D pdev->dev.of_node;
> + =A0 =A0 =A0 int ret =3D -ENODEV;
> + =A0 =A0 =A0 const u32 *prop;
> +
> + =A0 =A0 =A0 if (!node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;

Nothing is allocated or needs to be undone in this routine in the
event of failure.  Instead of "goto err", you can just "return
-ENODEV" in each error case.

> +
> + =A0 =A0 =A0 prop =3D of_get_property(node, "flags", NULL);
> + =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> +
> + =A0 =A0 =A0 cfg->flags =3D of_read_number(prop, 1);

Looks like Linux-specific implementation details are being encoded
into the device tree.  What is the intended meaning for the "flags"
property?

> +
> + =A0 =A0 =A0 prop =3D of_get_property(node, "irq-polarity", NULL);
> + =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> +
> + =A0 =A0 =A0 cfg->irq_polarity =3D of_read_number(prop, 1);
> +
> + =A0 =A0 =A0 prop =3D of_get_property(node, "irq-type", NULL);
> + =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> +
> + =A0 =A0 =A0 cfg->irq_type =3D of_read_number(prop, 1);

Most interrupt controller bindings include an extra cell in the
interrupt specifier to encode flags like irq polarity and type.
Encoding these outside of the interrupt specifier makes things less
clear.

> +
> + =A0 =A0 =A0 prop =3D of_get_property(node, "phy-interface", NULL);
> + =A0 =A0 =A0 if (!prop)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> +
> + =A0 =A0 =A0 cfg->phy_interface =3D of_read_number(prop, 1);

There is a binding phy devices with support routines.  This network
device should use those instead of inventing something new.

> +
> + =A0 =A0 =A0 pr_info("%s: Parsed FDT info\n", node->name);
> + =A0 =A0 =A0 pr_info("FLAGS %d\n", cfg->flags);
> + =A0 =A0 =A0 pr_info("IRQ-POLARITY %d\n", cfg->irq_polarity);
> + =A0 =A0 =A0 pr_info("IRQ-TYPE %d\n", cfg->irq_type);
> + =A0 =A0 =A0 pr_info("PHY IF %d\n", cfg->phy_interface);

I prefer to see the dev_info() macro used for per-device-instance messages.

> + =A0 =A0 =A0 return 0;
> +err:
> + =A0 =A0 =A0 return ret;
> +}

I don't think it is necessary to have a separate .c file for this one
function.  I don't see any problem with it living in
drivers/net/smsc911x.c.  I'd rather have everything contained in a
single place.

> diff --git a/drivers/net/smsc911x.c b/drivers/net/smsc911x.c
> index cc55974..c56b8f7 100644
> --- a/drivers/net/smsc911x.c
> +++ b/drivers/net/smsc911x.c
> @@ -50,6 +50,7 @@
> =A0#include <linux/phy.h>
> =A0#include <linux/smsc911x.h>
> =A0#include <linux/device.h>
> +
> =A0#include "smsc911x.h"

Unrelated whitespace change.

>
> =A0#define SMSC_CHIPNAME =A0 =A0 =A0 =A0 =A0"smsc911x"
> @@ -1945,13 +1946,6 @@ static int __devinit smsc911x_drv_probe(struct pla=
tform_device *pdev)
>
> =A0 =A0 =A0 =A0pr_info("%s: Driver version %s.\n", SMSC_CHIPNAME, SMSC_DR=
V_VERSION);
>
> - =A0 =A0 =A0 /* platform data specifies irq & dynamic bus configuration =
*/
> - =A0 =A0 =A0 if (!pdev->dev.platform_data) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("%s: platform_data not provided\=
n", SMSC_CHIPNAME);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D -ENODEV;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_0;
> - =A0 =A0 =A0 }
> -
> =A0 =A0 =A0 =A0res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 "smsc911x-memory");
> =A0 =A0 =A0 =A0if (!res)
> @@ -1988,12 +1982,22 @@ static int __devinit smsc911x_drv_probe(struct pl=
atform_device *pdev)
>
> =A0 =A0 =A0 =A0pdata =3D netdev_priv(dev);
>
> + =A0 =A0 =A0 if (smsc911x_probe_dt(&pdata->config, pdev) =3D=3D -ENODEV)=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* platform data specifies irq & dynamic bu=
s configuration */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!pdev->dev.platform_data) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("%s: platform_da=
ta not provided\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 SMSC_CHIPNAME);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 retval =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out_0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* copy config parameters across to pdata */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memcpy(&pdata->config, config, sizeof(pdata=
->config));
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0dev->irq =3D irq_res->start;
> =A0 =A0 =A0 =A0irq_flags =3D irq_res->flags & IRQF_TRIGGER_MASK;
> =A0 =A0 =A0 =A0pdata->ioaddr =3D ioremap_nocache(res->start, res_size);
>
> - =A0 =A0 =A0 /* copy config parameters across to pdata */
> - =A0 =A0 =A0 memcpy(&pdata->config, config, sizeof(pdata->config));
>
> =A0 =A0 =A0 =A0pdata->dev =3D dev;
> =A0 =A0 =A0 =A0pdata->msg_enable =3D ((1 << debug) - 1);
> @@ -2150,6 +2154,11 @@ static const struct dev_pm_ops smsc911x_pm_ops =3D=
 {
> =A0#define SMSC911X_PM_OPS NULL
> =A0#endif
>
> +static struct of_device_id smsc911x_matches[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "smc,smsc-911"},
> + =A0 =A0 =A0 {},
> +};
> +
> =A0static struct platform_driver smsc911x_driver =3D {
> =A0 =A0 =A0 =A0.probe =3D smsc911x_drv_probe,
> =A0 =A0 =A0 =A0.remove =3D __devexit_p(smsc911x_drv_remove),
> @@ -2163,6 +2172,7 @@ static struct platform_driver smsc911x_driver =3D {
> =A0/* Entry point for loading the module */
> =A0static int __init smsc911x_init_module(void)
> =A0{
> + =A0 =A0 =A0 platform_init_match(&smsc911x_driver, smsc911x_matches);

the match table should be statically initialized into the driver
structure.  Right now that does require wrapping the line with #ifdef
CONFIG_OF which is a little stinky, but I'm working on a solution for
that.  Regardless, I don't like having to use a macro to set the
pointer at probe time when it can be done statically.

> =A0 =A0 =A0 =A0return platform_driver_register(&smsc911x_driver);
> =A0}
>
> diff --git a/drivers/net/smsc911x.h b/drivers/net/smsc911x.h
> index 016360c..5ec9a8b 100644
> --- a/drivers/net/smsc911x.h
> +++ b/drivers/net/smsc911x.h
> @@ -394,4 +394,12 @@
> =A0#define LPA_PAUSE_ALL =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(LPA_PAUSE_CA=
P | \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 LPA_PAUSE_ASYM)
>
> +#ifndef CONFIG_OF
> +static inline int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev) { return -ENO=
DEV; }
> +#else
> +extern int smsc911x_probe_dt(struct smsc911x_platform_config *cfg,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev);
> +#endif
> +

This hunk will of course also get merged into the main .c file if the
OF helper function is rolled into the main driver.

Cheers,
g.

> =A0#endif =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* __SMSC911X_H=
__ */
> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
