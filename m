From: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Subject: Re: [PATCH] RFC: Device overlay manager (PCI/USB + DT)
Date: Mon, 15 Jun 2015 17:56:35 +0300
Message-ID: <7B4810B3-61BE-4510-A884-3BC02D786A41@konsulko.com>
References: <1434139460-16194-1-git-send-email-pantelis.antoniou@konsulko.com> <1434379385.2069.33.camel@x220>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1434379385.2069.33.camel@x220>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Rob Herring <robherring2@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Matt Porter <mporter@konsulko.com>, Koen Kooi <koen@dominion.thruhere.net>, Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: devicetree@vger.kernel.org

Hi Paul,

> On Jun 15, 2015, at 17:43 , Paul Bolle <pebolle@tiscali.nl> wrote:
>=20
> Some remarks (that might not touch the subjects you want to get feedb=
ack
> on for an RFC).
>=20
> On Fri, 2015-06-12 at 23:04 +0300, Pantelis Antoniou wrote:
>> --- a/drivers/misc/Kconfig
>> +++ b/drivers/misc/Kconfig
>=20
>> +config DEV_OVERLAYMGR
>> +	tristate "Device overlay manager"
>> +	depends on OF
>> +	select OF_OVERLAY
>> +	default n
>=20
> Why bother with "default n"?=20
>=20
>> +	help
>> +	  Say Y here to include support for the automagical dev
>> +	  overlay manager.
>=20
>> --- /dev/null
>> +++ b/drivers/misc/devovmgr.c
>=20
>> +#include <linux/ctype.h>
>> +#include <linux/cpu.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/sizes.h>
>> +#include <linux/slab.h>
>> +#include <linux/proc_fs.h>
>> +#include <linux/configfs.h>
>> +#include <linux/types.h>
>> +#include <linux/stat.h>
>> +#include <linux/limits.h>
>> +#include <linux/file.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/firmware.h>
>> +#include <linux/pci.h>
>> +#include <linux/usb.h>
>> +#include <linux/mod_devicetable.h>
>> +#include <linux/workqueue.h>
>> +#include <linux/firmware.h>
>=20
> You're including <linux/firmware.h> twice.
>=20

Right,

>> +/* copy of drivers/pci/pci.h */
>=20
> Because?
>=20

Cause it=E2=80=99s not exported out of PCI core.

>> +static inline const struct pci_device_id *
>> +pci_match_one_device(const struct pci_device_id *id, const struct p=
ci_dev *dev)
>> +{
>> +	if ((id->vendor =3D=3D PCI_ANY_ID || id->vendor =3D=3D dev->vendor=
) &&
>> +	    (id->device =3D=3D PCI_ANY_ID || id->device =3D=3D dev->device=
) &&
>> +	    (id->subvendor =3D=3D PCI_ANY_ID ||
>> +		id->subvendor =3D=3D dev->subsystem_vendor) &&
>> +	    (id->subdevice =3D=3D PCI_ANY_ID ||
>> +		id->subdevice =3D=3D dev->subsystem_device) &&
>> +	    !((id->class ^ dev->class) & id->class_mask))
>> +		return id;
>> +	return NULL;
>> +}
>=20
>> +#if IS_ENABLED(CONFIG_USB)
>> +/* in drivers/usb/core/driver.c */
>> +extern int usb_match_device(struct usb_device *dev,
>> +		const struct usb_device_id *id);
>=20
> And that's an internal function of the usb core, isn't it?
>=20

Yes.

>> +static int __init dovmgr_init(void)
>> +{
>> +	int ret;
>> +
>> +	config_group_init(&dovmgr_subsys.su_group);
>> +
>> +#if IS_ENABLED(CONFIG_PCI)
>> +	ret =3D dovmgr_pci_init();
>> +	if (ret !=3D 0)
>> +		goto err_no_pci_init;
>> +#endif
>> +#if IS_ENABLED(CONFIG_USB)
>> +	ret =3D dovmgr_usb_init();
>> +	if (ret !=3D 0)
>> +		goto err_no_usb_init;
>> +#endif
>> +
>> +	ret =3D configfs_register_subsystem(&dovmgr_subsys);
>> +	if (ret !=3D 0) {
>> +		pr_err("%s: failed to register subsys\n", __func__);
>> +		goto err_no_configfs;
>> +	}
>> +	pr_info("%s: OK\n", __func__);
>> +	return 0;
>> +
>> +err_no_configfs:
>> +#if IS_ENABLED(CONFIG_USB)
>> +	dovmgr_usb_cleanup();
>> +err_no_usb_init:
>> +#endif
>> +#if IS_ENABLED(CONFIG_PCI)
>> +	dovmgr_pci_cleanup();
>> +err_no_pci_init:
>> +#endif
>> +	return ret;
>> +}
>> +late_initcall(dovmgr_init);
>=20
> Lot's of "#if IS_ENABLED(CONFIG_USB)" and "#if IS_ENABLED(CONFIG_PCI)=
"
> in the code. The above function is a rather ugly example.
>=20
> Is there a point to all this if neither PCI nor USB is enabled?
>=20
> USB can be 'm'. Does this build and work in that case?
>=20
> There's no MODULE_LICENSE() macro. If this is a module then loading i=
t
> will taint the kernel.
>=20
> There's also no function that is, well, called by module_exit() to al=
low
> (easy) unloading (and do the needed cleaning up on unload). Did you
> intend DEV_OVERLAYMGR to be bool instead?
>=20

Note this is an RFC after all, it=E2=80=99s not intended for inclusion =
as is. I just
present the technique and how it works. Yes, all those defines are prob=
ably
not good, but I=E2=80=99d like some remarks on the implementation first=
=2E


> Thanks,
>=20
>=20
> Paul Bolle
>=20

Regards

=E2=80=94 Pantelis
