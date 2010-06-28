From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] xilinx_pcipr: Added Xilinx reconfigurable PCI endpoint
	driver.
Date: Mon, 28 Jun 2010 15:23:19 -0700
Message-ID: <AANLkTiljI1vQGuL16YdpxYZ2EjGjiucLO9ixVyKgWkmY@mail.gmail.com>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<eab0dbb2-2819-4d1e-b8fd-630fb0912b31@SG2EHSMHS006.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <eab0dbb2-2819-4d1e-b8fd-630fb0912b31-RaUQJvECHiv5op9OF0Koj7jjLBE8jN/0@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Mon, Jun 28, 2010 at 10:47 AM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This bus has an internal bus which contains some devices, which
> are described in a device tree. =A0This code is *very* preliminary
> and mainly exists to exercise the device tree code on an arbitrary
> architecture.
> ---
> =A0drivers/pci/Kconfig =A0 =A0 =A0 =A0| =A0 =A09 ++
> =A0drivers/pci/Makefile =A0 =A0 =A0 | =A0 =A02 +
> =A0drivers/pci/xilinx_pcipr.c | =A0203 ++++++++++++++++++++++++++++++++++=
++++++++++
> =A03 files changed, 214 insertions(+), 0 deletions(-)
> =A0create mode 100644 drivers/pci/xilinx_pcipr.c
>
> diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
> index 34ef70d..ec9b25d 100644
> --- a/drivers/pci/Kconfig
> +++ b/drivers/pci/Kconfig
> @@ -65,3 +65,12 @@ config PCI_IOAPIC
> =A0 =A0 =A0 =A0depends on ACPI
> =A0 =A0 =A0 =A0depends on HOTPLUG
> =A0 =A0 =A0 =A0default y
> +
> +config XILINX_PCIPR
> + =A0 =A0 =A0 tristate "Xilinx OF-based PCI endpoint"
> + =A0 =A0 =A0 depends on PCI
> + =A0 =A0 =A0 select OF
> + =A0 =A0 =A0 select OF_FLATTREE
> + =A0 =A0 =A0 =A0select OF_DEVICE
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Enable support for Xilinx PCIPR endpoint
> \ No newline at end of file
> diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
> index 0b51857..ec44c21 100644
> --- a/drivers/pci/Makefile
> +++ b/drivers/pci/Makefile
> @@ -62,6 +62,8 @@ obj-$(CONFIG_PCI_SYSCALL) +=3D syscall.o
>
> =A0obj-$(CONFIG_PCI_STUB) +=3D pci-stub.o
>
> +obj-$(CONFIG_XILINX_PCIPR) +=3D xilinx_pcipr.o
> +
> =A0ifeq ($(CONFIG_PCI_DEBUG),y)
> =A0EXTRA_CFLAGS +=3D -DDEBUG
> =A0endif
> diff --git a/drivers/pci/xilinx_pcipr.c b/drivers/pci/xilinx_pcipr.c
> new file mode 100644
> index 0000000..17fde0b
> --- /dev/null
> +++ b/drivers/pci/xilinx_pcipr.c
> @@ -0,0 +1,203 @@
> +/*
> + * =A0Copyright 2010 Xilinx, Inc.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/kernel.h>
> +#include <linux/pci.h>
> +#include <linux/ide.h>
> +#include <linux/init.h>
> +#include <linux/dmi.h>
> +
> +#include <linux/of_fdt.h>
> +#include <linux/of_platform.h>
> +
> +
> +#include <asm/io.h>
> +
> +#define DRV_NAME "xilinx_pcipr"
> +
> +
> +unsigned char pcipr_dtb[] =3D {
> + =A00xd0, 0x0d, 0xfe, 0xed, 0x00, 0x00, 0x01, 0x6a, 0x00, 0x00, 0x00, 0x=
38,
> + =A00x00, 0x00, 0x01, 0x24, 0x00, 0x00, 0x00, 0x28, 0x00, 0x00, 0x00, 0x=
11,
> + =A00x00, 0x00, 0x00, 0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
46,
> + =A00x00, 0x00, 0x00, 0xec, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
00,
> + =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x=
01,
> + =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x=
04,
> + =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x=
03,
> + =A00x00, 0x00, 0x00, 0x04, 0x00, 0x00, 0x00, 0x0f, 0x00, 0x00, 0x00, 0x=
01,
> + =A00x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x33, 0x00, 0x00, 0x00, 0x=
1b,
> + =A00x78, 0x6c, 0x6e, 0x78, 0x2c, 0x70, 0x6c, 0x62, 0x2d, 0x76, 0x34, 0x=
36,
> + =A00x2d, 0x31, 0x2e, 0x30, 0x33, 0x2e, 0x61, 0x00, 0x78, 0x6c, 0x6e, 0x=
78,
> + =A00x2c, 0x70, 0x6c, 0x62, 0x2d, 0x76, 0x34, 0x36, 0x2d, 0x31, 0x2e, 0x=
30,
> + =A00x30, 0x2e, 0x61, 0x00, 0x73, 0x69, 0x6d, 0x70, 0x6c, 0x65, 0x2d, 0x=
62,
> + =A00x75, 0x73, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01, 0x78, 0x70, 0x73, 0x=
2d,
> + =A00x68, 0x77, 0x69, 0x63, 0x61, 0x70, 0x40, 0x38, 0x30, 0x30, 0x33, 0x=
30,
> + =A00x30, 0x30, 0x30, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x=
17,
> + =A00x00, 0x00, 0x00, 0x1b, 0x78, 0x6c, 0x6e, 0x78, 0x2c, 0x78, 0x70, 0x=
73,
> + =A00x2d, 0x68, 0x77, 0x69, 0x63, 0x61, 0x70, 0x2d, 0x31, 0x2e, 0x30, 0x=
30,
> + =A00x2e, 0x61, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x=
08,
> + =A00x00, 0x00, 0x00, 0x26, 0x80, 0x03, 0x00, 0x00, 0x00, 0x01, 0x00, 0x=
00,
> + =A00x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x=
2a,
> + =A00x76, 0x69, 0x72, 0x74, 0x65, 0x78, 0x35, 0x00, 0x00, 0x00, 0x00, 0x=
03,
> + =A00x00, 0x00, 0x00, 0x06, 0x00, 0x00, 0x00, 0x36, 0x66, 0x61, 0x6c, 0x=
73,
> + =A00x65, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x=
02,
> + =A00x00, 0x00, 0x00, 0x09, 0x23, 0x61, 0x64, 0x64, 0x72, 0x65, 0x73, 0x=
73,
> + =A00x2d, 0x63, 0x65, 0x6c, 0x6c, 0x73, 0x00, 0x23, 0x73, 0x69, 0x7a, 0x=
65,
> + =A00x2d, 0x63, 0x65, 0x6c, 0x6c, 0x73, 0x00, 0x63, 0x6f, 0x6d, 0x70, 0x=
61,
> + =A00x74, 0x69, 0x62, 0x6c, 0x65, 0x00, 0x72, 0x65, 0x67, 0x00, 0x78, 0x=
6c,
> + =A00x6e, 0x78, 0x2c, 0x66, 0x61, 0x6d, 0x69, 0x6c, 0x79, 0x00, 0x78, 0x=
6c,
> + =A00x6e, 0x78, 0x2c, 0x73, 0x69, 0x6d, 0x75, 0x6c, 0x61, 0x74, 0x69, 0x=
6f,
> + =A00x6e, 0x00
> +};
> +unsigned int pcipr_dtb_len =3D 362;
> +
> +
> +struct xilinx_pcipr_drvdata {
> + =A0 =A0 =A0 unsigned long *blob;
> + =A0 =A0 =A0 struct device_node *child_nodes;
> +};
> +
> +/**
> + * =A0 =A0 xilinx_pcipr_probe - Setup the endpoint
> + * =A0 =A0 @dev: PCI device to set up
> + */
> +static int __devinit xilinx_pcipr_probe(struct pci_dev *pdev, const stru=
ct pci_device_id *id)
> +{
> + =A0int ret;
> + =A0struct xilinx_pcipr_drvdata *drvdata;
> + =A0 =A0 =A0 dev_dbg(&pdev->dev, "xilinx_pcipr_probe\n");
> +
> + =A0 =A0 =A0 drvdata =3D kzalloc(sizeof(struct xilinx_pcipr_drvdata), GF=
P_KERNEL);
> + =A0 =A0 =A0 if (!drvdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't allocate devi=
ce private record\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dev_set_drvdata(&pdev->dev, (void *)drvdata);
> +
> +/* =A0 =A0 /\* */
> +/* =A0 =A0 =A0* If we failed to assign proper bus numbers for this cardb=
us */
> +/* =A0 =A0 =A0* controller during PCI probe, its subordinate pci_bus is =
NULL. */
> +/* =A0 =A0 =A0* Bail out if so. */
> +/* =A0 =A0 =A0*\/ */
> +/* =A0 =A0 if (!dev->subordinate) { */
> +/* =A0 =A0 =A0 =A0 =A0 =A0 dev_printk(KERN_ERR, &dev->dev, "no bus assoc=
iated! " */
> +/* =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"(try 'pci=3Dassign-bu=
sses')\n"); */
> +/* =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV; */
> +/* =A0 =A0 } */
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Do some basic sanity checking..
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (pci_enable_device(pdev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 ret =3D pci_request_regions(pdev, "xilinx_pcipr");
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto disable;
> +
> + =A0 =A0 =A0 if (!pci_resource_start(pdev, 0)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_printk(KERN_ERR, &pdev->dev, "No cardbu=
s resource!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto release;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 drvdata->blob =3D pcipr_dtb;
> +
> +/* =A0 =A0 /\* */
> +/* =A0 =A0 =A0* Ok, start setup.. Map the cardbus registers, */
> +/* =A0 =A0 =A0* and request the IRQ. */
> +/* =A0 =A0 =A0*\/ */
> +/* =A0 =A0 socket->base =3D ioremap(pci_resource_start(pdev, 0), 0x1000)=
; */
> +/* =A0 =A0 if (!socket->base) { */
> +/* =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM; */
> +/* =A0 =A0 =A0 =A0 =A0 =A0 goto release; */
> +/* =A0 =A0 } */
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* report the subsystem vendor and device for help debugg=
ing
> + =A0 =A0 =A0 =A0* the irq stuff...
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 dev_printk(KERN_INFO, &pdev->dev, "Xilinx PCIPR bridge foun=
d [%04x:%04x]\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev->subsystem_vendor, pdev->subsys=
tem_device);
> +
> +
> + =A0 =A0 =A0 // =A0 =A0 =A0yenta_fixup_parent_bridge(dev->subordinate);
> +
> + =A0 =A0 =A0 // initialize our sub-devices.
> +
> +
> + =A0 =A0 =A0 unflatten_partial_device_tree(drvdata->blob, &drvdata->chil=
d_nodes);
> + =A0 =A0 =A0 of_platform_bus_probe(drvdata->child_nodes, NULL, &pdev->de=
v);

This looks fairly sane.  As we talked about before, you'll probably
want to use the firmware loading mechanism to inject the dtb fragment
into the kernel.

g.
