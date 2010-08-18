From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH 10/14] drivers/USB: isp1760 DT platform parsing and
	binding
Date: Wed, 18 Aug 2010 15:27:18 -0600
Message-ID: <AANLkTin6KTBVR2-bv+pPecg6uzTrM5jGwodOu0vghy5z@mail.gmail.com>
References: <1282158000-23081-1-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-2-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-3-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-4-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-5-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-6-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-7-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-8-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-9-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-10-git-send-email-lorenzo.pieralisi@arm.com>
	<1282158000-23081-11-git-send-email-lorenzo.pieralisi@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1282158000-23081-11-git-send-email-lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
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
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, philippe.robin-5wv7dgnIgG8@public.gmane.org, jeremy.kerr-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Aug 18, 2010 at 12:59 PM, Lorenzo Pieralisi
<lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org> wrote:
> When OF is enabled, each driver should define a match table to
> allow the kernel to recognise drivers suitable for a given device.
> Initialization is carried out through a static inline at driver init
> time. The match-table is declared following OF bindings.
> Driver properties are parsed from the device tree node at run time,
> but if the device tree probing fails, the driver falls back to static
> driver initialization (platform data).
>
> This patch adds the infrastructure to support device tree probing and
> initialization for isp1760 USB host controller. The build infrastructure
> changes accordingly in order to have a clean separation between OF and
> non-OF init code.
>
> Signed-off-by: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
> ---
> =A0drivers/usb/host/Makefile =A0 =A0 =A0| =A0 =A04 +-
> =A0drivers/usb/host/isp1760-hcd.h | =A0 =A07 ++++++
> =A0drivers/usb/host/isp1760-if.c =A0| =A0 43 ++++++++++++++++++++++++++--=
------------
> =A0drivers/usb/host/isp1760-of.c =A0| =A0 36 ++++++++++++++++++++++++++++=
+++++
> =A04 files changed, 73 insertions(+), 17 deletions(-)
> =A0create mode 100644 drivers/usb/host/isp1760-of.c
>
> diff --git a/drivers/usb/host/Makefile b/drivers/usb/host/Makefile
> index b6315aa..edf6e8a 100644
> --- a/drivers/usb/host/Makefile
> +++ b/drivers/usb/host/Makefile
> @@ -5,8 +5,8 @@
> =A0ifeq ($(CONFIG_USB_DEBUG),y)
> =A0 =A0 =A0 =A0EXTRA_CFLAGS =A0 =A0 =A0 =A0 =A0 =A0+=3D -DDEBUG
> =A0endif
> -
> -isp1760-objs :=3D isp1760-hcd.o isp1760-if.o
> +isp1760_of-$(CONFIG_OF) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D isp1760-of.o
> +isp1760-objs :=3D isp1760-hcd.o isp1760-if.o $(isp1760_of-y)
> =A0fhci-objs :=3D fhci-hcd.o fhci-hub.o fhci-q.o fhci-mem.o \
> =A0 =A0 =A0 =A0 =A0 =A0 fhci-tds.o fhci-sched.o
> =A0ifeq ($(CONFIG_FHCI_DEBUG),y)
> diff --git a/drivers/usb/host/isp1760-hcd.h b/drivers/usb/host/isp1760-hc=
d.h
> index 6931ef5..93afabd 100644
> --- a/drivers/usb/host/isp1760-hcd.h
> +++ b/drivers/usb/host/isp1760-hcd.h
> @@ -9,6 +9,13 @@ struct usb_hcd *isp1760_register(phys_addr_t res_start, =
resource_size_t res_len,
> =A0int init_kmem_once(void);
> =A0void deinit_kmem_cache(void);
>
> +#ifndef CONFIG_OF
> +static inline int isp1760_plat_probe_dt(int *devflags,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct platform_device *pdev) { return -ENO=
DEV; }
> +#else
> +extern int isp1760_plat_probe_dt(int *devflags, struct platform_device *=
pdev);
> +#endif
> +
> =A0/* EHCI capability registers */
> =A0#define HC_CAPLENGTH =A0 =A0 =A0 =A0 =A0 0x00
> =A0#define HC_HCSPARAMS =A0 =A0 =A0 =A0 =A0 0x04
> diff --git a/drivers/usb/host/isp1760-if.c b/drivers/usb/host/isp1760-if.c
> index ec85d0c..3a1839e 100644
> --- a/drivers/usb/host/isp1760-if.c
> +++ b/drivers/usb/host/isp1760-if.c
> @@ -17,7 +17,7 @@
>
> =A0#include "isp1760-hcd.h"
>
> -#ifdef CONFIG_PPC_OF
> +#if defined(CONFIG_PPC_OF)
> =A0#include <linux/of.h>
> =A0#include <linux/of_platform.h>
> =A0#endif
> @@ -305,6 +305,17 @@ static struct pci_driver isp1761_pci_driver =3D {
> =A0};
> =A0#endif
>
> +static const struct of_device_id of_isp1760_match[] =3D {
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "nxp,usb-isp1760",
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "nxp,usb-isp1761",
> + =A0 =A0 =A0 },
> + =A0 =A0 =A0 { },
> +};
> +
> +
> =A0static int __devinit isp1760_plat_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0int ret =3D 0;
> @@ -336,21 +347,22 @@ static int __devinit isp1760_plat_probe(struct plat=
form_device *pdev)
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0irqflags |=3D irq_res->flags & IRQF_TRIGGER_MASK;
>
> - =A0 =A0 =A0 if (priv) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->is_isp1761)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
ISP1761;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->bus_width_16)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
BUS_WIDTH_16;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->port1_otg)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
OTG_EN;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->analog_oc)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
ANALOG_OC;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->dack_polarity_high)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
DACK_POL_HIGH;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->dreq_polarity_high)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=3D ISP1760_FLAG_=
DREQ_POL_HIGH;
> + =A0 =A0 =A0 if (isp1760_plat_probe_dt(&devflags, pdev) =3D=3D -ENODEV) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->is_isp1761)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_ISP1761;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->bus_width_16)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_BUS_WIDTH_16;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->port1_otg)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_OTG_EN;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->analog_oc)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_ANALOG_OC;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->dack_polarity_hig=
h)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_DACK_POL_HIGH;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (priv->dreq_polarity_hig=
h)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 devflags |=
=3D ISP1760_FLAG_DREQ_POL_HIGH;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
> -
> =A0 =A0 =A0 =A0hcd =3D isp1760_register(mem_res->start, mem_size, irq_res=
->start,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 irqflags, &pd=
ev->dev, dev_name(&pdev->dev), devflags);
> =A0 =A0 =A0 =A0if (IS_ERR(hcd)) {
> @@ -394,6 +406,7 @@ static int __init isp1760_init(void)
>
> =A0 =A0 =A0 =A0init_kmem_once();
>
> + =A0 =A0 =A0 platform_init_match(&isp1760_plat_driver, of_isp1760_match);
> =A0 =A0 =A0 =A0ret =3D platform_driver_register(&isp1760_plat_driver);
> =A0 =A0 =A0 =A0if (!ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0any_ret =3D 0;
> diff --git a/drivers/usb/host/isp1760-of.c b/drivers/usb/host/isp1760-of.c
> new file mode 100644
> index 0000000..c98ee58
> --- /dev/null
> +++ b/drivers/usb/host/isp1760-of.c
> @@ -0,0 +1,36 @@
> +
> +#include <linux/platform_device.h>
> +
> +#include <linux/of.h>
> +#include "isp1760-hcd.h"
> +
> +int isp1760_plat_probe_dt(int *devflags, struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct device_node *dp =3D pdev->dev.of_node;
> + =A0 =A0 =A0 const u32 *prop;
> +
> + =A0 =A0 =A0 if (!dp)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> +
> + =A0 =A0 =A0 if (of_device_is_compatible(dp, "nxp,usb-isp1761"))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_ISP1761;
> +
> + =A0 =A0 =A0 /* Some systems wire up only 16 of the 32 data lines */
> + =A0 =A0 =A0 prop =3D of_get_property(dp, "bus-width", NULL);
> + =A0 =A0 =A0 if (prop && *prop =3D=3D 16)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_BUS_WIDTH_16;
> +
> + =A0 =A0 =A0 if (of_get_property(dp, "port1-otg", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_OTG_EN;
> +
> + =A0 =A0 =A0 if (of_get_property(dp, "analog-oc", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_ANALOG_OC;
> +
> + =A0 =A0 =A0 if (of_get_property(dp, "dack-polarity", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_DACK_POL_HIGH;
> +
> + =A0 =A0 =A0 if (of_get_property(dp, "dreq-polarity", NULL))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *devflags |=3D ISP1760_FLAG_DREQ_POL_HIGH;

All of these properties need to be documented before a driver is
merged.  To start, because these are chip-specific properties, they
should be prefixed with "nxp," to avoid future namespace collisions.
You can write a draft binding on devicetree.org.

> +
> + =A0 =A0 =A0 return 0;
> +}

Ditto to my previous comment on the smsc911x network driver, my
preference is to see this function in the main .c file.

> --
> 1.6.3.3
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
