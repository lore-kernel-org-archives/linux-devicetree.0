From: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v3 4/4] drivers: firmware: xilinx: Add debugfs interface
Date: Wed, 31 Jan 2018 19:48:00 +0000
Message-ID: <DM2PR0201MB076787151BE9EE4EA1F32BD3B8FB0@DM2PR0201MB0767.namprd02.prod.outlook.com>
References: <1516836074-4149-1-git-send-email-jollys@xilinx.com>
 <1516836074-4149-5-git-send-email-jollys@xilinx.com>
 <20180125093057.GA1936@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125093057.GA1936-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org" <matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org>, "sudeep.holla-5wv7dgnIgG8@public.gmane.org" <sudeep.holla-5wv7dgnIgG8@public.gmane.org>, "hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org" <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, "robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Greg,
Thanks for review comments. All will be taken care in next version patch.

Thanks,
Jolly Shah

> -----Original Message-----
> From: Greg KH [mailto:gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org]
> Sent: Thursday, January 25, 2018 1:31 AM
> To: Jolly Shah <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Cc: ard.biesheuvel-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; mingo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org; matt-mF/unelCI9GS6iBeEJttW/XRex20P6io@public.gmane.org=
;
> sudeep.holla-5wv7dgnIgG8@public.gmane.org; hkallweit1-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org;
> dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org; michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org; robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org;
> mark.rutland-5wv7dgnIgG8@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org; linux-
> kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jolly Shah
> <JOLLYS-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>; Rajan Vaja <RAJANV-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> Subject: Re: [PATCH v3 4/4] drivers: firmware: xilinx: Add debugfs interf=
ace
>=20
> On Wed, Jan 24, 2018 at 03:21:14PM -0800, Jolly Shah wrote:
> > Firmware-debug provides debugfs interface to all APIs.
>=20
> I don't understand this changelog comment, care to make it more
> informational?  At least describe the debugfs files you are adding so tha=
t people
> have a chance to understand what is going on here :)
>=20
> > diff --git a/drivers/firmware/xilinx/zynqmp/Kconfig
> > b/drivers/firmware/xilinx/zynqmp/Kconfig
> > index 8f7709d..bdd0188 100644
> > --- a/drivers/firmware/xilinx/zynqmp/Kconfig
> > +++ b/drivers/firmware/xilinx/zynqmp/Kconfig
> > @@ -13,4 +13,11 @@ config ZYNQMP_FIRMWARE
> >  	  Say yes to enable zynqmp firmware interface driver.
> >  	  In doubt, say N
> >
> > +config ZYNQMP_FIRMWARE_DEBUG
> > +	bool "Enable Xilinx Zynq MPSoC firmware debug APIs"
> > +	default ARCH_ZYNQMP && ZYNQMP_FIRMWARE && DEBUG_FS
> > +	help
> > +	  Say yes to enable zynqmp firmware interface debug APIs.
> > +	  In doubt, say N
>=20
> So your default is going to be Y if the driver is selected?  That's not g=
ood, just
> leave the default alone please.
>=20
> > +
> >  endmenu
> > diff --git a/drivers/firmware/xilinx/zynqmp/Makefile
> > b/drivers/firmware/xilinx/zynqmp/Makefile
> > index 6629781..02f0c9a 100644
> > --- a/drivers/firmware/xilinx/zynqmp/Makefile
> > +++ b/drivers/firmware/xilinx/zynqmp/Makefile
> > @@ -2,3 +2,4 @@
> >  # Makefile for Xilinx firmwares
> >
> >  obj-$(CONFIG_ZYNQMP_FIRMWARE) +=3D firmware.o firmware-ggs.o
> > +obj-$(CONFIG_ZYNQMP_FIRMWARE_DEBUG) +=3D firmware-debug.o
> > diff --git a/drivers/firmware/xilinx/zynqmp/firmware-debug.c
> > b/drivers/firmware/xilinx/zynqmp/firmware-debug.c
> > new file mode 100644
> > index 0000000..daefc62
> > --- /dev/null
> > +++ b/drivers/firmware/xilinx/zynqmp/firmware-debug.c
> > @@ -0,0 +1,511 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Xilinx Zynq MPSoC Firmware layer for debugfs APIs
> > + *
> > + *  Copyright (C) 2014-2018 Xilinx, Inc.
> > + *
> > + *  Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > + *  Davorin Mista <davorin.mista-XdEHnvbJQ9jQT0dZR+AlfA@public.gmane.org>
> > + *  Jolly Shah <jollys-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > + *  Rajan Vaja <rajanv-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> > + */
> > +
> > +#include <linux/compiler.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/uaccess.h>
> > +#include <linux/firmware/xilinx/zynqmp/firmware.h>
> > +#include <linux/firmware/xilinx/zynqmp/firmware-debug.h>
> > +
> > +#define DRIVER_NAME	"zynqmp-firmware"
>=20
> You define this in 2 places, but only use it in one, you don't need this =
at all,
> please remove all instances.
>=20
> > +static int process_api_request(u32 pm_id, u64 *pm_api_arg, u32
> > +*pm_api_ret) {
> > +	const struct zynqmp_eemi_ops *eemi_ops =3D get_eemi_ops();
> > +	u32 pm_api_version;
> > +	int ret;
> > +
> > +	if (!eemi_ops)
> > +		return -ENXIO;
> > +
> > +	switch (pm_id) {
> > +	case PM_GET_API_VERSION:
> > +		eemi_ops->get_api_version(&pm_api_version);
> > +		pr_info("%s PM-API Version =3D %d.%d\n", __func__,
> > +			pm_api_version >> 16, pm_api_version & 0xffff);
>=20
> This is a _very_ noisy function, dumping a lot of stuff to the kernel log=
.  Why?
> Why not send it back to the caller of the debugfs file reader instead?
>=20
> > +	case PM_GET_NODE_STATUS:
> > +		ret =3D eemi_ops->get_node_status(pm_api_arg[0],
> > +						&pm_api_ret[0],
> > +						&pm_api_ret[1],
> > +						&pm_api_ret[2]);
> > +		if (!ret)
> > +			pr_info("GET_NODE_STATUS:\n\tNodeId:
> %llu\n\tStatus: %u\n\tRequirements: %u\n\tUsage: %u\n",
> > +				pm_api_arg[0], pm_api_ret[0],
> > +				pm_api_ret[1], pm_api_ret[2]);
>=20
> Multi-line dmesg messages?  Not good, you just lost the logging level for=
 the
> multiple lines :(
>=20
> Again, don't do this at all, just put it in file output instead.  That wa=
y tools/users
> can actually use it, instead of having to dig through kernel log messages=
.
>=20
> > +/**
> > + * zynqmp_pm_api_debugfs_init - Initialize debugfs interface
> > + *
> > + * Return:      None
> > + */
> > +void zynqmp_pm_api_debugfs_init(void) {
> > +	struct dentry *root_dir;
> > +	struct dentry *d;
> > +
> > +	/* Initialize debugfs interface */
> > +	root_dir =3D debugfs_create_dir(DRIVER_NAME, NULL);
> > +	if (!root_dir) {
> > +		pr_warn("debugfs_create_dir failed\n");
>=20
> Why warn?  What can a user do about this?  Just return and move on.
>=20
> > +		return;
> > +	}
> > +
> > +	d =3D debugfs_create_file("pm", 0220, root_dir, NULL,
> > +				&fops_zynqmp_pm_dbgfs);
> > +	if (!d) {
> > +		pr_warn("debugfs_create_file power failed\n");
> > +		goto err_dbgfs;
> > +	}
> > +
> > +	d =3D debugfs_create_file("api_version", 0444, root_dir,
> > +				NULL, &fops_zynqmp_pm_dbgfs);
> > +	if (!d) {
> > +		pr_warn("debugfs_create_file api_version failed\n");
> > +		goto err_dbgfs;
>=20
> Same for these files, who cares if they were not created or not at all?
> No need to even check here at all, this whole function can be reduced to =
just 3
> lines:
> 	debugfs_create_dir(...);
> 	debugfs_create_file(...);
> 	debugfs_create_file(...);
>=20
> There, nice and simple.  Remember, debugfs doesn't matter, and it should =
be
> _really_ easy to use.  Don't make it more complex than it has to be pleas=
e.
>=20
> thanks,
>=20
> greg k-h
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
