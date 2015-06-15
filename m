From: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
Subject: Re: [PATCH] RFC: Device overlay manager (PCI/USB + DT)
Date: Mon, 15 Jun 2015 16:43:05 +0200
Message-ID: <1434379385.2069.33.camel@x220>
References: <1434139460-16194-1-git-send-email-pantelis.antoniou@konsulko.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434139460-16194-1-git-send-email-pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Matt Porter <mporter-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Koen Kooi <koen-QLwJDigV5abLmq1fohREcCpxlwaOVQ5f@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Some remarks (that might not touch the subjects you want to get feedback
on for an RFC).

On Fri, 2015-06-12 at 23:04 +0300, Pantelis Antoniou wrote:
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
 
> +config DEV_OVERLAYMGR
> +	tristate "Device overlay manager"
> +	depends on OF
> +	select OF_OVERLAY
> +	default n

Why bother with "default n"? 

> +	help
> +	  Say Y here to include support for the automagical dev
> +	  overlay manager.

> --- /dev/null
> +++ b/drivers/misc/devovmgr.c

> +#include <linux/ctype.h>
> +#include <linux/cpu.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/spinlock.h>
> +#include <linux/sizes.h>
> +#include <linux/slab.h>
> +#include <linux/proc_fs.h>
> +#include <linux/configfs.h>
> +#include <linux/types.h>
> +#include <linux/stat.h>
> +#include <linux/limits.h>
> +#include <linux/file.h>
> +#include <linux/vmalloc.h>
> +#include <linux/firmware.h>
> +#include <linux/pci.h>
> +#include <linux/usb.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/workqueue.h>
> +#include <linux/firmware.h>

You're including <linux/firmware.h> twice.

> +/* copy of drivers/pci/pci.h */

Because?

> +static inline const struct pci_device_id *
> +pci_match_one_device(const struct pci_device_id *id, const struct pci_dev *dev)
> +{
> +	if ((id->vendor == PCI_ANY_ID || id->vendor == dev->vendor) &&
> +	    (id->device == PCI_ANY_ID || id->device == dev->device) &&
> +	    (id->subvendor == PCI_ANY_ID ||
> +		id->subvendor == dev->subsystem_vendor) &&
> +	    (id->subdevice == PCI_ANY_ID ||
> +		id->subdevice == dev->subsystem_device) &&
> +	    !((id->class ^ dev->class) & id->class_mask))
> +		return id;
> +	return NULL;
> +}

> +#if IS_ENABLED(CONFIG_USB)
> +/* in drivers/usb/core/driver.c */
> +extern int usb_match_device(struct usb_device *dev,
> +		const struct usb_device_id *id);

And that's an internal function of the usb core, isn't it?

> +static int __init dovmgr_init(void)
> +{
> +	int ret;
> +
> +	config_group_init(&dovmgr_subsys.su_group);
> +
> +#if IS_ENABLED(CONFIG_PCI)
> +	ret = dovmgr_pci_init();
> +	if (ret != 0)
> +		goto err_no_pci_init;
> +#endif
> +#if IS_ENABLED(CONFIG_USB)
> +	ret = dovmgr_usb_init();
> +	if (ret != 0)
> +		goto err_no_usb_init;
> +#endif
> +
> +	ret = configfs_register_subsystem(&dovmgr_subsys);
> +	if (ret != 0) {
> +		pr_err("%s: failed to register subsys\n", __func__);
> +		goto err_no_configfs;
> +	}
> +	pr_info("%s: OK\n", __func__);
> +	return 0;
> +
> +err_no_configfs:
> +#if IS_ENABLED(CONFIG_USB)
> +	dovmgr_usb_cleanup();
> +err_no_usb_init:
> +#endif
> +#if IS_ENABLED(CONFIG_PCI)
> +	dovmgr_pci_cleanup();
> +err_no_pci_init:
> +#endif
> +	return ret;
> +}
> +late_initcall(dovmgr_init);

Lot's of "#if IS_ENABLED(CONFIG_USB)" and "#if IS_ENABLED(CONFIG_PCI)"
in the code. The above function is a rather ugly example.

Is there a point to all this if neither PCI nor USB is enabled?

USB can be 'm'. Does this build and work in that case?

There's no MODULE_LICENSE() macro. If this is a module then loading it
will taint the kernel.

There's also no function that is, well, called by module_exit() to allow
(easy) unloading (and do the needed cleaning up on unload). Did you
intend DEV_OVERLAYMGR to be bool instead?

Thanks,


Paul Bolle

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
