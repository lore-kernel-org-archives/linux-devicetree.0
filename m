From: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Thu, 4 Dec 2014 13:30:05 +0200
Message-ID: <8795CB40-87D6-4683-8396-987A49E94574@konsulko.com>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com> <20141204103104.7D8E0C40992@trevor.secretlab.ca>
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141204103104.7D8E0C40992-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hi Grant,

> On Dec 4, 2014, at 12:31 , Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
>=20
> Kees,
>=20
> I'm copying you on this email. This is a new interface being proposed
> for making live changes to the device tree at runtime, which gives
> pretty close to direct control to userspace of the Linux device model=
=2E
> Userspace can supply a blob that causes devices to get added or remov=
ed
> from /sys/devices, and can change how a device is accessed. This is
> definitely a security concern and I would love to get your opinion on
> the interface.
>=20
> Naturally, the interface has been made root-only, but I don't think t=
hat
> is enough. I think we need a method which parts of the devicetree can=
 be
> modified by a devicetree overlay. I've been thinking in terms of addi=
ng
> allow/deny properties that control whether or not changes can be made
> below a particular node, with the default for the whole tree to be
> 'deny'. That way the devicetree for the platform can restrict dynamic
> change to only the node that need to be modifed.
>=20
> What do you think?
>=20
> Pantelis, I've made comments below on the patch...
>=20
> On Wed,  3 Dec 2014 13:23:28 +0200
> , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> wrote:
>> Add a runtime interface to using configfs for generic device tree ov=
erlay
>> usage. With it its possible to use device tree overlays without havi=
ng
>> to use a per-platform overlay manager.
>>=20
>> Please see Documentation/devicetree/configfs-overlays.txt for more i=
nfo.
>>=20
>> Changes since v2:
>> - Removed ifdef CONFIG_OF_OVERLAY (since for now it's required)
>> - Created a documentation entry
>> - Slight rewording in Kconfig
>>=20
>> Changes since v1:
>> - of_resolve() -> of_resolve_phandles().
>>=20
>> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
>> ---
>> Documentation/devicetree/configfs-overlays.txt |  31 +++
>> drivers/of/Kconfig                             |   7 +
>> drivers/of/Makefile                            |   1 +
>> drivers/of/configfs.c                          | 332 +++++++++++++++=
++++++++++
>> 4 files changed, 371 insertions(+)
>> create mode 100644 Documentation/devicetree/configfs-overlays.txt
>> create mode 100644 drivers/of/configfs.c
>>=20
>> diff --git a/Documentation/devicetree/configfs-overlays.txt b/Docume=
ntation/devicetree/configfs-overlays.txt
>> new file mode 100644
>> index 0000000..5fa43e0
>> --- /dev/null
>> +++ b/Documentation/devicetree/configfs-overlays.txt
>> @@ -0,0 +1,31 @@
>> +Howto use the configfs overlay interface.
>> +
>> +A device-tree configfs entry is created in /config/device-tree/over=
lays
>> +and and it is manipulated using standard file system I/O.
>> +Note that this is a debug level interface, for use by developers an=
d
>> +not necessarily something accessed by normal users due to the
>> +security implications of having direct access to the kernel's devic=
e tree.
>> +
>> +* To create an overlay you mkdir the directory:
>> +
>> +	# mkdir /config/device-tree/overlays/foo
>> +
>> +* Either you echo the overlay firmware file to the path property fi=
le.
>> +
>> +	# echo foo.dtbo >/config/device-tree/overlays/foo/path
>> +
>> +* Or you cat the contents of the overlay to the dtbo file
>> +
>> +	# cat foo.dtbo >/config/device-tree/overlays/foo/dtbo
>> +
>> +The overlay file will be applied, and devices will be created/destr=
oyed
>> +as required.
>> +
>> +To remove it simply rmdir the directory.
>> +
>> +	# rmdir /config/device-tree/overlays/foo
>> +
>> +The rationalle of the dual interface (firmware & direct copy) is th=
at each is
>=20
> sp. rationale
>=20

OK,

>> +better suited to different use patterns. The firmware interface is =
what's
>> +intended to be used by hardware managers in the kernel, while the c=
opy interface
>> +make sense for developers (since it avoids problems with namespaces=
).
>=20
> The distinction between developer and production interfaces is
> unfortunately meaningless in the real world. The developer interface
> will get used in production if it is there, and having two interfaces
> means we have to support two interfaces that do /exactly the same
> thing/.
>=20
> One interface only please.
>=20

I wish it was so simple :/


> What are the problems with namespaces that you see with the firmware
> interface?
>=20

When passing a path to a driver, which namespace are you going to use
to perform the lookup?

=46or instance, if the user issued a load request for a path in a conta=
iner
which is the namespace under which the firmware file is located? Is it =
the
non-container filesystem, or is it under the container filesystem that
issued the request. The firmware layer does not have an API to discern.


>> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
>> index 18b2e25..5d36306 100644
>> --- a/drivers/of/Kconfig
>> +++ b/drivers/of/Kconfig
>> @@ -91,4 +91,11 @@ config OF_OVERLAY
>> 	select OF_DEVICE
>> 	select OF_RESOLVE
>>=20
>> +config OF_CONFIGFS
>> +	bool "Device Tree Overlay ConfigFS interface"
>> +	select CONFIGFS_FS
>> +	select OF_OVERLAY
>> +	help
>> +	  Enable a simple user-space driven DT overlay interface.
>> +
>> endmenu # OF
>> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
>> index 7563f36..6f7f4f8 100644
>> --- a/drivers/of/Makefile
>> +++ b/drivers/of/Makefile
>> @@ -1,4 +1,5 @@
>> obj-y =3D base.o device.o platform.o
>> +obj-$(CONFIG_OF_CONFIGFS) +=3D configfs.o
>> obj-$(CONFIG_OF_DYNAMIC) +=3D dynamic.o
>> obj-$(CONFIG_OF_FLATTREE) +=3D fdt.o
>> obj-$(CONFIG_OF_EARLY_FLATTREE) +=3D fdt_address.o
>> diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
>> new file mode 100644
>> index 0000000..1434ade
>> --- /dev/null
>> +++ b/drivers/of/configfs.c
>> @@ -0,0 +1,332 @@
>> +/*
>> + * Configfs entries for device-tree
>> + *
>> + * Copyright (C) 2013 - Pantelis Antoniou <panto@antoniou-consultin=
g.com>
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version
>> + * 2 of the License, or (at your option) any later version.
>> + */
>> +#include <linux/ctype.h>
>> +#include <linux/cpu.h>
>> +#include <linux/module.h>
>> +#include <linux/of.h>
>> +#include <linux/of_fdt.h>
>> +#include <linux/spinlock.h>
>> +#include <linux/slab.h>
>> +#include <linux/proc_fs.h>
>> +#include <linux/configfs.h>
>> +#include <linux/types.h>
>> +#include <linux/stat.h>
>> +#include <linux/limits.h>
>> +#include <linux/file.h>
>> +#include <linux/vmalloc.h>
>> +#include <linux/firmware.h>
>> +
>> +#include "of_private.h"
>> +
>> +struct cfs_overlay_item {
>> +	struct config_item	item;
>> +
>> +	char			path[PATH_MAX];
>=20
> Hard coded maximum path length?
>=20
>> +
>> +	const struct firmware	*fw;
>> +	struct device_node	*overlay;
>> +	int			ov_id;
>> +
>> +	void			*dtbo;
>> +	int			dtbo_size;
>> +};
>> +
>> +static int create_overlay(struct cfs_overlay_item *overlay, void *b=
lob)
>> +{
>> +	int err;
>> +
>> +	/* unflatten the tree */
>> +	of_fdt_unflatten_tree(blob, &overlay->overlay);
>> +	if (overlay->overlay =3D=3D NULL) {
>> +		pr_err("%s: failed to unflatten tree\n", __func__);
>> +		err =3D -EINVAL;
>> +		goto out_err;
>> +	}
>> +	pr_debug("%s: unflattened OK\n", __func__);
>> +
>> +	/* mark it as detached */
>> +	of_node_set_flag(overlay->overlay, OF_DETACHED);
>> +
>> +	/* perform resolution */
>> +	err =3D of_resolve_phandles(overlay->overlay);
>> +	if (err !=3D 0) {
>> +		pr_err("%s: Failed to resolve tree\n", __func__);
>> +		goto out_err;
>> +	}
>> +	pr_debug("%s: resolved OK\n", __func__);
>> +
>> +	err =3D of_overlay_create(overlay->overlay);
>> +	if (err < 0) {
>> +		pr_err("%s: Failed to create overlay (err=3D%d)\n",
>> +				__func__, err);
>> +		goto out_err;
>> +	}
>> +	overlay->ov_id =3D err;
>> +
>> +out_err:
>> +	return err;
>> +}
>> +
>> +static inline struct cfs_overlay_item *to_cfs_overlay_item(
>> +		struct config_item *item)
>> +{
>> +	return item ? container_of(item, struct cfs_overlay_item, item) : =
NULL;
>> +}
>> +
>> +CONFIGFS_ATTR_STRUCT(cfs_overlay_item);
>> +#define CFS_OVERLAY_ITEM_ATTR(_name, _mode, _show, _store)	\
>> +struct cfs_overlay_item_attribute cfs_overlay_item_attr_##_name =3D=
 \
>> +	__CONFIGFS_ATTR(_name, _mode, _show, _store)
>> +#define CFS_OVERLAY_ITEM_ATTR_RO(_name, _show)	\
>> +struct cfs_overlay_item_attribute cfs_overlay_item_attr_##_name =3D=
 \
>> +	__CONFIGFS_ATTR_RO(_name, _show)
>> +
>> +CONFIGFS_BIN_ATTR_STRUCT(cfs_overlay_item);
>> +#define CFS_OVERLAY_ITEM_BIN_ATTR(_name, _mode, _read, _write, _pri=
v, _max) \
>> +struct cfs_overlay_item_bin_attribute cfs_overlay_item_bin_attr_##_=
name =3D \
>> +	__CONFIGFS_BIN_ATTR(_name, _mode, _read, _write, _priv, _max)
>> +#define CFS_OVERLAY_ITEM_BIN_ATTR_RO(_name, _read, _priv, _max)	\
>> +struct cfs_overlay_item_bin_attribute cfs_overlay_item_bin_attr_##_=
name =3D \
>> +	__CONFIGFS_BIN_ATTR_RO(_name, _read, _priv, _max)
>> +
>> +static ssize_t cfs_overlay_item_path_show(struct cfs_overlay_item *=
overlay,
>> +		char *page)
>> +{
>> +	return sprintf(page, "%s\n", overlay->path);
>> +}
>> +
>> +static ssize_t cfs_overlay_item_path_store(struct cfs_overlay_item =
*overlay,
>> +		const char *page, size_t count)
>> +{
>> +	const char *p =3D page;
>> +	char *s;
>> +	int err;
>> +
>> +	/* if it's set do not allow changes */
>> +	if (overlay->path[0] !=3D '\0' || overlay->dtbo_size > 0)
>> +		return -EPERM;
>> +
>> +	/* copy to path buffer (and make sure it's always zero terminated =
*/
>> +	count =3D snprintf(overlay->path, sizeof(overlay->path) - 1, "%s",=
 p);
>> +	overlay->path[sizeof(overlay->path) - 1] =3D '\0';
>=20
> kmemdup perhaps to get rid of the hard coded path length?
>=20

Yeah, I guess, it=E2=80=99s no biggie.

>> +
>> +	/* strip trailing newlines */
>> +	s =3D overlay->path + strlen(overlay->path);
>> +	while (s > overlay->path && *--s =3D=3D '\n')
>> +		*s =3D '\0';
>=20
> strchr() will find trailing \n's for you.
>=20

Perhaps it shouldn=E2=80=99t be stripping at all, and require echo -n
=20
>> +
>> +	pr_debug("%s: path is '%s'\n", __func__, overlay->path);
>> +
>> +	err =3D request_firmware(&overlay->fw, overlay->path, NULL);
>> +	if (err !=3D 0)
>> +		goto out_err;
>> +
>> +	err =3D create_overlay(overlay, (void *)overlay->fw->data);
>> +	if (err !=3D 0)
>> +		goto out_err;
>> +
>> +	return count;
>> +
>> +out_err:
>> +
>> +	release_firmware(overlay->fw);
>> +	overlay->fw =3D NULL;
>> +
>> +	overlay->path[0] =3D '\0';
>> +	return err;
>> +}
>> +
>> +static ssize_t cfs_overlay_item_status_show(struct cfs_overlay_item=
 *overlay,
>> +		char *page)
>> +{
>> +	return sprintf(page, "%s\n",
>> +			overlay->ov_id >=3D 0 ? "applied" : "unapplied");
>> +}
>> +
>> +CFS_OVERLAY_ITEM_ATTR(path, S_IRUGO | S_IWUSR,
>> +		cfs_overlay_item_path_show, cfs_overlay_item_path_store);
>> +CFS_OVERLAY_ITEM_ATTR_RO(status, cfs_overlay_item_status_show);
>> +
>> +static struct configfs_attribute *cfs_overlay_attrs[] =3D {
>> +	&cfs_overlay_item_attr_path.attr,
>> +	&cfs_overlay_item_attr_status.attr,
>> +	NULL,
>> +};
>> +
>> +ssize_t cfs_overlay_item_dtbo_read(struct cfs_overlay_item *overlay=
,
>> +		void *buf, size_t max_count)
>> +{
>> +	pr_debug("%s: buf=3D%p max_count=3D%u\n", __func__,
>> +			buf, max_count);
>> +
>> +	if (overlay->dtbo =3D=3D NULL)
>> +		return 0;
>> +
>> +	/* copy if buffer provided */
>> +	if (buf !=3D NULL) {
>> +		/* the buffer must be large enough */
>> +		if (overlay->dtbo_size > max_count)
>> +			return -ENOSPC;
>=20
> I've not dug into configfs code. Is it not possible to do a partial
> read?
>=20

The whole point of configfs is that the data are delivered in one-go.
It makes the users of configfs considerably simpler.

Otherwise there=E2=80=99s no point in it and you can just use sysfs.

>> +
>> +		memcpy(buf, overlay->dtbo, overlay->dtbo_size);
>> +	}
>> +
>> +	return overlay->dtbo_size;
>> +}
>> +
>> +ssize_t cfs_overlay_item_dtbo_write(struct cfs_overlay_item *overla=
y,
>> +		const void *buf, size_t count)
>> +{
>> +	int err;
>> +
>> +	/* if it's set do not allow changes */
>> +	if (overlay->path[0] !=3D '\0' || overlay->dtbo_size > 0)
>> +		return -EPERM;
>> +
>> +	/* copy the contents */
>> +	overlay->dtbo =3D kmemdup(buf, count, GFP_KERNEL);
>> +	if (overlay->dtbo =3D=3D NULL)
>> +		return -ENOMEM;
>> +
>> +	overlay->dtbo_size =3D count;
>> +
>> +	err =3D create_overlay(overlay, overlay->dtbo);
>> +	if (err !=3D 0)
>> +		goto out_err;
>> +
>> +	return count;
>> +
>> +out_err:
>> +	kfree(overlay->dtbo);
>> +	overlay->dtbo =3D NULL;
>> +	overlay->dtbo_size =3D 0;
>> +
>> +	return err;
>> +}
>> +
>> +CFS_OVERLAY_ITEM_BIN_ATTR(dtbo, S_IRUGO | S_IWUSR,
>> +		cfs_overlay_item_dtbo_read, cfs_overlay_item_dtbo_write,
>> +		NULL, SZ_1M);
>> +
>> +static struct configfs_bin_attribute *cfs_overlay_bin_attrs[] =3D {
>> +	&cfs_overlay_item_bin_attr_dtbo.bin_attr,
>> +	NULL,
>> +};
>> +
>> +static void cfs_overlay_release(struct config_item *item)
>> +{
>> +	struct cfs_overlay_item *overlay =3D to_cfs_overlay_item(item);
>> +
>> +	if (overlay->ov_id >=3D 0)
>> +		of_overlay_destroy(overlay->ov_id);
>> +	if (overlay->fw)
>> +		release_firmware(overlay->fw);
>> +	/* kfree with NULL is safe */
>> +	kfree(overlay->dtbo);
>> +	kfree(overlay);
>> +}
>> +
>> +CONFIGFS_ATTR_OPS(cfs_overlay_item);
>> +CONFIGFS_BIN_ATTR_OPS(cfs_overlay_item);
>> +static struct configfs_item_operations cfs_overlay_item_ops =3D {
>> +	.release		=3D cfs_overlay_release,
>> +	.show_attribute		=3D cfs_overlay_item_attr_show,
>> +	.store_attribute	=3D cfs_overlay_item_attr_store,
>> +	.read_bin_attribute	=3D cfs_overlay_item_bin_attr_read,
>> +	.write_bin_attribute	=3D cfs_overlay_item_bin_attr_write,
>> +};
>> +
>> +static struct config_item_type cfs_overlay_type =3D {
>> +	.ct_item_ops	=3D &cfs_overlay_item_ops,
>> +	.ct_attrs	=3D cfs_overlay_attrs,
>> +	.ct_bin_attrs	=3D cfs_overlay_bin_attrs,
>> +	.ct_owner	=3D THIS_MODULE,
>> +};
>> +
>> +static struct config_item *cfs_overlay_group_make_item(
>> +		struct config_group *group, const char *name)
>> +{
>> +	struct cfs_overlay_item *overlay;
>> +
>> +	overlay =3D kzalloc(sizeof(*overlay), GFP_KERNEL);
>> +	if (!overlay)
>> +		return ERR_PTR(-ENOMEM);
>> +	overlay->ov_id =3D -1;
>> +
>> +	config_item_init_type_name(&overlay->item, name, &cfs_overlay_type=
);
>> +	return &overlay->item;
>> +}
>> +
>> +static void cfs_overlay_group_drop_item(struct config_group *group,
>> +		struct config_item *item)
>> +{
>> +	struct cfs_overlay_item *overlay =3D to_cfs_overlay_item(item);
>> +
>> +	config_item_put(&overlay->item);
>> +}
>> +
>> +static struct configfs_group_operations overlays_ops =3D {
>> +	.make_item	=3D cfs_overlay_group_make_item,
>> +	.drop_item	=3D cfs_overlay_group_drop_item,
>> +};
>> +
>> +static struct config_item_type overlays_type =3D {
>> +	.ct_group_ops   =3D &overlays_ops,
>> +	.ct_owner       =3D THIS_MODULE,
>> +};
>> +
>> +static struct configfs_group_operations of_cfs_ops =3D {
>> +	/* empty - we don't allow anything to be created */
>> +};
>> +
>> +static struct config_item_type of_cfs_type =3D {
>> +	.ct_group_ops   =3D &of_cfs_ops,
>> +	.ct_owner       =3D THIS_MODULE,
>> +};
>> +
>> +struct config_group of_cfs_overlay_group;
>> +
>> +struct config_group *of_cfs_def_groups[] =3D {
>> +	&of_cfs_overlay_group,
>> +	NULL
>> +};
>> +
>> +static struct configfs_subsystem of_cfs_subsys =3D {
>> +	.su_group =3D {
>> +		.cg_item =3D {
>> +			.ci_namebuf =3D "device-tree",
>> +			.ci_type =3D &of_cfs_type,
>> +		},
>> +		.default_groups =3D of_cfs_def_groups,
>> +	},
>> +	.su_mutex =3D __MUTEX_INITIALIZER(of_cfs_subsys.su_mutex),
>> +};
>> +
>> +static int __init of_cfs_init(void)
>> +{
>> +	int ret;
>> +
>> +	pr_info("%s\n", __func__);
>> +
>> +	config_group_init(&of_cfs_subsys.su_group);
>> +	config_group_init_type_name(&of_cfs_overlay_group, "overlays",
>> +			&overlays_type);
>> +
>> +	ret =3D configfs_register_subsystem(&of_cfs_subsys);
>> +	if (ret !=3D 0) {
>> +		pr_err("%s: failed to register subsys\n", __func__);
>> +		goto out;
>> +	}
>> +	pr_info("%s: OK\n", __func__);
>> +out:
>> +	return ret;
>> +}
>> +late_initcall(of_cfs_init);
>> --=20
>> 1.7.12

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
