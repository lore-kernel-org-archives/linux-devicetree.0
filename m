From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 6/8] [Xilinx] xilinx_pcipr: Added Xilinx reconfigurable
	PCI endpoint driver.
Date: Fri, 16 Jul 2010 12:43:16 -0600
Message-ID: <AANLkTiklQHAKz9Gxkocszjyn7oSbCJmnoxr1soleRw8f@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-4-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-5-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-6-git-send-email-stephen.neuendorffer@xilinx.com>
	<19f2f30b-1b43-4729-a079-da1df0b04609@SG2EHSMHS001.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <19f2f30b-1b43-4729-a079-da1df0b04609-RaUQJvECHitZbvUCbuG1mrjjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This device has an internal bus which contains multiple devices, which
> are described in a device tree.
>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>

Looks sane to me.  A few comments below.

>
> ----
>
> This is probably still preliminary, although it actually works now.
> 1) It should probably correctly deallocate and free all the contained
> devices.
> 2) It should probably handle different device trees for multiple boards
> in the same system. =A0How to do this?
> ---
> =A0drivers/pci/Kconfig =A0 =A0 =A0 =A0| =A0 =A09 ++
> =A0drivers/pci/Makefile =A0 =A0 =A0 | =A0 =A02 +
> =A0drivers/pci/xilinx_pcipr.c | =A0197 ++++++++++++++++++++++++++++++++++=
++++++++++
> =A03 files changed, 208 insertions(+), 0 deletions(-)
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

OF_DEVICE is automatically enabled now.  You don't need to select it.
It also looks like your patch has whitespace inconsistencies.

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
> index 0000000..80f8f1a
> --- /dev/null
> +++ b/drivers/pci/xilinx_pcipr.c
> @@ -0,0 +1,197 @@
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
> +#include <linux/firmware.h>
> +
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/of_platform.h>
> +
> +#include <linux/io.h>
> +
> +#define DRV_NAME "xilinx_pcipr"
> +
> +struct xilinx_pcipr_drvdata {
> + =A0 =A0 =A0 struct device_node *child_nodes;
> + =A0 =A0 =A0 struct firmware *fw_entry;
> +};
> +
> +/**
> + * =A0 =A0 xilinx_pcipr_probe - Setup the endpoint
> + * =A0 =A0 @dev: PCI device to set up
> + */
> +static int __devinit xilinx_pcipr_probe(struct pci_dev *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 const struct pci_device_id *id)
> +{
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 struct xilinx_pcipr_drvdata *drvdata;
> + =A0 =A0 =A0 resource_size_t start, len;
> + =A0 =A0 =A0 struct property *ranges_prop;
> + =A0 =A0 =A0 unsigned long *value;
> + =A0 =A0 =A0 struct device_node *bus_node;
> +
> + =A0 =A0 =A0 dev_dbg(&pdev->dev, "xilinx_pcipr_probe\n");
> +
> + =A0 =A0 =A0 drvdata =3D kzalloc(sizeof(struct xilinx_pcipr_drvdata), GF=
P_KERNEL);
> + =A0 =A0 =A0 if (!drvdata) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Couldn't allocate device p=
rivate record\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 dev_set_drvdata(&pdev->dev, (void *)drvdata);
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Do some basic sanity checking..
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (pci_enable_device(pdev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EBUSY;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto free;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Enable the board to bus master. */
> + =A0 =A0 =A0 pci_set_master(pdev);
> +
> + =A0 =A0 =A0 if (request_firmware(&drvdata->fw_entry,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "xilinx_pcipr.dtb",=
 &pdev->dev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Couldn't get dtb\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto disable;
> + =A0 =A0 =A0 }
> +
> +
> + =A0 =A0 =A0 ret =3D pci_request_regions(pdev, "xilinx_pcipr");
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto release_dtb;
> +
> + =A0 =A0 =A0 if (!pci_resource_start(pdev, 0)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_printk(KERN_ERR, &pdev->dev, "No cardbu=
s resource!\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto release;
> + =A0 =A0 =A0 }
> +
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* report the subsystem vendor and device for help debugg=
ing
> + =A0 =A0 =A0 =A0* the irq stuff...
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 dev_printk(KERN_INFO, &pdev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Xilinx PCIPR bridge found [%04x:%04=
x]\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pdev->subsystem_vendor, pdev->subsys=
tem_device);
> +
> + =A0 =A0 =A0 /* Stuff the ranges property into the toplevel bus of the d=
evice
> + =A0 =A0 =A0 =A0 =A0tree, according to how the BARs are programmed */
> + =A0 =A0 =A0 start =3D pci_resource_start(pdev, 0);
> + =A0 =A0 =A0 len =3D pci_resource_len(pdev, 0);
> +
> + =A0 =A0 =A0 dev_printk(KERN_INFO, &pdev->dev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"Xilinx PCIPR bridge range %llx %llx=
",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(unsigned long long) start, (unsigne=
d long long) len);
> +
> + =A0 =A0 =A0 ranges_prop =3D kzalloc(sizeof(struct property), GFP_KERNEL=
);
> + =A0 =A0 =A0 ranges_prop->value =3D kzalloc(sizeof(unsigned long) * 3, G=
FP_KERNEL);
> + =A0 =A0 =A0 ranges_prop->name =3D "ranges";
> + =A0 =A0 =A0 ranges_prop->length =3D sizeof(unsigned long) * 3;
> + =A0 =A0 =A0 value =3D (unsigned long *)ranges_prop->value;
> + =A0 =A0 =A0 /* FIXME: gotta get this from the bridge */
> + =A0 =A0 =A0 value[0] =3D cpu_to_be32(0x80000000);
> + =A0 =A0 =A0 value[1] =3D cpu_to_be32(start);
> + =A0 =A0 =A0 value[2] =3D cpu_to_be32(len);
> +
> + =A0 =A0 =A0 unflatten_partial_device_tree((unsigned long *)drvdata->fw_=
entry->data,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 &drvdata->child_nodes);
> + =A0 =A0 =A0 of_node_get(drvdata->child_nodes);
> + =A0 =A0 =A0 bus_node =3D of_find_node_by_name(drvdata->child_nodes, "pl=
b");
> + =A0 =A0 =A0 prom_add_property(bus_node, ranges_prop);
> +
> + =A0 =A0 =A0 /* Generate child devices from the device tree */
> + =A0 =A0 =A0 of_platform_bus_probe(drvdata->child_nodes, NULL, &pdev->de=
v);
> +
> + =A0 =A0 =A0 pci_release_regions(pdev);
> +
> + =A0 =A0 =A0 goto out; /* Success */
> +
> + release:
> + =A0 =A0 =A0 pci_release_regions(pdev);
> +
> + release_dtb:
> + =A0 =A0 =A0 release_firmware(drvdata->fw_entry);
> +
> + disable:
> + =A0 =A0 =A0 pci_disable_device(pdev);
> + free:
> + =A0 =A0 =A0 kfree(drvdata);
> + =A0 =A0 =A0 dev_set_drvdata(&pdev->dev, NULL);
> + out:
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int __devexit xilinx_pcipr_remove(struct pci_dev *pdev)
> +{
> + =A0 =A0 =A0 struct device *dev =3D &pdev->dev;
> + =A0 =A0 =A0 struct xilinx_pcipr_drvdata *drvdata =3D dev_get_drvdata(de=
v);
> +
> + =A0 =A0 =A0 /* FIXME: Release the contained devices. There should proba=
bly
> +be a device-tree method to free a whole tree of devices, essentially
> +the inverse of of_platform_bus_probe
> + =A0 =A0 =A0 */
> +
> + =A0 =A0 =A0 release_firmware(drvdata->fw_entry);
> + =A0 =A0 =A0 pci_disable_device(pdev);
> + =A0 =A0 =A0 kfree(drvdata);
> + =A0 =A0 =A0 dev_set_drvdata(dev, NULL);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +
> +static const struct pci_device_id xilinx_pcipr_ids[] =3D {
> + =A0 =A0 =A0 { PCI_VDEVICE(XILINX, 0x0505), 0 },
> + =A0 =A0 =A0 { 0, },
> +};
> +MODULE_DEVICE_TABLE(pci, xilinx_pcipr_ids);
> +
> +pci_ers_result_t *xilinx_pcipr_error_detected(struct pci_dev *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 enum pci_channel_state error) {
> + =A0 =A0 =A0 dev_printk(KERN_INFO, &pdev->dev, "Error detected!\n");
> + =A0 =A0 =A0 return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static struct pci_error_handlers xilinx_pcipr_error_handlers =3D {
> + =A0 =A0 =A0 /* PCI bus error detected on this device */
> + =A0 =A0 =A0 .error_detected =3D xilinx_pcipr_error_detected,
> +};
> +
> +static struct pci_driver =A0xilinx_pcipr_driver =3D {
> + =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "XILINX_PCIPR",
> + =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D xilinx_pcipr_ids,
> + =A0 =A0 =A0 .probe =A0 =A0 =A0 =A0 =A0=3D xilinx_pcipr_probe,
> + =A0 =A0 =A0 .remove =A0 =A0 =A0 =A0 =3D __devexit_p(xilinx_pcipr_remove=
),
> + =A0 =A0 =A0 .err_handler =A0 =A0=3D &xilinx_pcipr_error_handlers,
> +};
> +
> +static int __init xilinx_pcipr_init(void)
> +{
> + =A0 =A0 =A0 return ide_pci_register_driver(&xilinx_pcipr_driver);
> +}
> +
> +static void __exit xilinx_pcipr_exit(void)
> +{
> + =A0 =A0 =A0 pci_unregister_driver(&xilinx_pcipr_driver);
> +}
> +
> +module_init(xilinx_pcipr_init);
> +module_exit(xilinx_pcipr_exit);
> +
> +MODULE_AUTHOR("Xilinx Research Labs");
> +MODULE_DESCRIPTION("PCI driver for PCI reconfigurable endpoint");
> +MODULE_LICENSE("GPL");
> --
> 1.5.6.6
>
>
>
> This email and any attachments are intended for the sole use of the named=
 recipient(s) and contain(s) confidential information that may be proprieta=
ry, privileged or copyrighted under applicable law. If you are not the inte=
nded recipient, do not read, copy, or forward this email message or any att=
achments. Delete this email message and any attachments immediately.
>
>
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
