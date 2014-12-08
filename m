From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] OF: DT-Overlay configfs interface (v3)
Date: Mon, 08 Dec 2014 17:34:48 +0000
Message-ID: <20141208173448.CD975C40D73@trevor.secretlab.ca>
References: <1417605808-23327-1-git-send-email-pantelis.antoniou@konsulko.com>
	<20141204103104.7D8E0C40992@trevor.secretlab.ca>
	<CAGXu5jKZYrGpSwdpG8Pk=0N87Z1yT3S=utzCnQgvZ+4YeA2hKg@mail.gmail.com>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAGXu5jKZYrGpSwdpG8Pk=0N87Z1yT3S=utzCnQgvZ+4YeA2hKg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Guenter Roeck <linux-0h96xk9xTtrk1uMJSBkQmQ@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, 5 Dec 2014 11:53:04 -0800
, Kees Cook <keescook-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
 wrote:
> On Thu, Dec 4, 2014 at 2:31 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> wrote:
> > Kees,
> >
> > I'm copying you on this email. This is a new interface being proposed
> > for making live changes to the device tree at runtime, which gives
> > pretty close to direct control to userspace of the Linux device model.
> > Userspace can supply a blob that causes devices to get added or removed
> > from /sys/devices, and can change how a device is accessed. This is
> > definitely a security concern and I would love to get your opinion on
> > the interface.
> >
> > Naturally, the interface has been made root-only, but I don't think that
> > is enough. I think we need a method which parts of the devicetree can be
> > modified by a devicetree overlay. I've been thinking in terms of adding
> > allow/deny properties that control whether or not changes can be made
> > below a particular node, with the default for the whole tree to be
> > 'deny'. That way the devicetree for the platform can restrict dynamic
> > change to only the node that need to be modifed.
> >
> > What do you think?
> 
> I'm less familiar with device tree, but given the things that I'm
> imagining can be twiddled via this interface, it looks extremely
> powerful. Could devices be changed out from under drivers, or physical
> RAM remapped, etc?

Here's where we're at right now:
- Platform, spi and i2c devices can be added and removed dynamically by
  adding/removing/enabling/disabling nodes. The platform devices can be
  crafted to bind to any platform_driver and be associated with any
  region of memory
- The /data/ about physical RAM can be altered, but the kernel won't
  register the change. It is conceivable that this interface would be
  used to hotplug RAM, but there is no support at present to do so

> Coming from the perspective of drawing a bright line between kernel
> and the root user (which tends to start with disabling kernel module
> loading), I would say that there at least needs to be a high-level
> one-way "off" switch for the interface so that systems that have this
> interface can choose to turn it off during initial boot, etc.

Agreed.

> If the tree node ACL you're considering could be used like this, that
> seems like a good approach, as long as the non-deny nodes don't allow
> attaching devices that could access memory in some way, since then
> they could be used to flip the deny bits on other nodes and the
> slippery slope starts... :)

This is a potential problem. We do have a way to restrict the RAM that a
device node is able to reference ('ranges' property needs to specify
windows, not a blanket unity mapping), but it requires the creator of the
device tree to actually craft the ranges property correctly.

> Hopefully that's useful?

Yes, very useful. Thanks.

> 
> -Kees
> 
> >
> > Pantelis, I've made comments below on the patch...
> >
> > On Wed,  3 Dec 2014 13:23:28 +0200
> > , Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >  wrote:
> >> Add a runtime interface to using configfs for generic device tree overlay
> >> usage. With it its possible to use device tree overlays without having
> >> to use a per-platform overlay manager.
> >>
> >> Please see Documentation/devicetree/configfs-overlays.txt for more info.
> >>
> >> Changes since v2:
> >> - Removed ifdef CONFIG_OF_OVERLAY (since for now it's required)
> >> - Created a documentation entry
> >> - Slight rewording in Kconfig
> >>
> >> Changes since v1:
> >> - of_resolve() -> of_resolve_phandles().
> >>
> >> Signed-off-by: Pantelis Antoniou <pantelis.antoniou-OWPKS81ov/FWk0Htik3J/w@public.gmane.org>
> >> ---
> >>  Documentation/devicetree/configfs-overlays.txt |  31 +++
> >>  drivers/of/Kconfig                             |   7 +
> >>  drivers/of/Makefile                            |   1 +
> >>  drivers/of/configfs.c                          | 332 +++++++++++++++++++++++++
> >>  4 files changed, 371 insertions(+)
> >>  create mode 100644 Documentation/devicetree/configfs-overlays.txt
> >>  create mode 100644 drivers/of/configfs.c
> >>
> >> diff --git a/Documentation/devicetree/configfs-overlays.txt b/Documentation/devicetree/configfs-overlays.txt
> >> new file mode 100644
> >> index 0000000..5fa43e0
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/configfs-overlays.txt
> >> @@ -0,0 +1,31 @@
> >> +Howto use the configfs overlay interface.
> >> +
> >> +A device-tree configfs entry is created in /config/device-tree/overlays
> >> +and and it is manipulated using standard file system I/O.
> >> +Note that this is a debug level interface, for use by developers and
> >> +not necessarily something accessed by normal users due to the
> >> +security implications of having direct access to the kernel's device tree.
> >> +
> >> +* To create an overlay you mkdir the directory:
> >> +
> >> +     # mkdir /config/device-tree/overlays/foo
> >> +
> >> +* Either you echo the overlay firmware file to the path property file.
> >> +
> >> +     # echo foo.dtbo >/config/device-tree/overlays/foo/path
> >> +
> >> +* Or you cat the contents of the overlay to the dtbo file
> >> +
> >> +     # cat foo.dtbo >/config/device-tree/overlays/foo/dtbo
> >> +
> >> +The overlay file will be applied, and devices will be created/destroyed
> >> +as required.
> >> +
> >> +To remove it simply rmdir the directory.
> >> +
> >> +     # rmdir /config/device-tree/overlays/foo
> >> +
> >> +The rationalle of the dual interface (firmware & direct copy) is that each is
> >
> > sp. rationale
> >
> >> +better suited to different use patterns. The firmware interface is what's
> >> +intended to be used by hardware managers in the kernel, while the copy interface
> >> +make sense for developers (since it avoids problems with namespaces).
> >
> > The distinction between developer and production interfaces is
> > unfortunately meaningless in the real world. The developer interface
> > will get used in production if it is there, and having two interfaces
> > means we have to support two interfaces that do /exactly the same
> > thing/.
> >
> > One interface only please.
> >
> > What are the problems with namespaces that you see with the firmware
> > interface?
> >
> >> diff --git a/drivers/of/Kconfig b/drivers/of/Kconfig
> >> index 18b2e25..5d36306 100644
> >> --- a/drivers/of/Kconfig
> >> +++ b/drivers/of/Kconfig
> >> @@ -91,4 +91,11 @@ config OF_OVERLAY
> >>       select OF_DEVICE
> >>       select OF_RESOLVE
> >>
> >> +config OF_CONFIGFS
> >> +     bool "Device Tree Overlay ConfigFS interface"
> >> +     select CONFIGFS_FS
> >> +     select OF_OVERLAY
> >> +     help
> >> +       Enable a simple user-space driven DT overlay interface.
> >> +
> >>  endmenu # OF
> >> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> >> index 7563f36..6f7f4f8 100644
> >> --- a/drivers/of/Makefile
> >> +++ b/drivers/of/Makefile
> >> @@ -1,4 +1,5 @@
> >>  obj-y = base.o device.o platform.o
> >> +obj-$(CONFIG_OF_CONFIGFS) += configfs.o
> >>  obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
> >>  obj-$(CONFIG_OF_FLATTREE) += fdt.o
> >>  obj-$(CONFIG_OF_EARLY_FLATTREE) += fdt_address.o
> >> diff --git a/drivers/of/configfs.c b/drivers/of/configfs.c
> >> new file mode 100644
> >> index 0000000..1434ade
> >> --- /dev/null
> >> +++ b/drivers/of/configfs.c
> >> @@ -0,0 +1,332 @@
> >> +/*
> >> + * Configfs entries for device-tree
> >> + *
> >> + * Copyright (C) 2013 - Pantelis Antoniou <panto-wVdstyuyKrO8r51toPun2/C9HSW9iNxf@public.gmane.org>
> >> + *
> >> + * This program is free software; you can redistribute it and/or
> >> + * modify it under the terms of the GNU General Public License
> >> + * as published by the Free Software Foundation; either version
> >> + * 2 of the License, or (at your option) any later version.
> >> + */
> >> +#include <linux/ctype.h>
> >> +#include <linux/cpu.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_fdt.h>
> >> +#include <linux/spinlock.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/proc_fs.h>
> >> +#include <linux/configfs.h>
> >> +#include <linux/types.h>
> >> +#include <linux/stat.h>
> >> +#include <linux/limits.h>
> >> +#include <linux/file.h>
> >> +#include <linux/vmalloc.h>
> >> +#include <linux/firmware.h>
> >> +
> >> +#include "of_private.h"
> >> +
> >> +struct cfs_overlay_item {
> >> +     struct config_item      item;
> >> +
> >> +     char                    path[PATH_MAX];
> >
> > Hard coded maximum path length?
> >
> >> +
> >> +     const struct firmware   *fw;
> >> +     struct device_node      *overlay;
> >> +     int                     ov_id;
> >> +
> >> +     void                    *dtbo;
> >> +     int                     dtbo_size;
> >> +};
> >> +
> >> +static int create_overlay(struct cfs_overlay_item *overlay, void *blob)
> >> +{
> >> +     int err;
> >> +
> >> +     /* unflatten the tree */
> >> +     of_fdt_unflatten_tree(blob, &overlay->overlay);
> >> +     if (overlay->overlay == NULL) {
> >> +             pr_err("%s: failed to unflatten tree\n", __func__);
> >> +             err = -EINVAL;
> >> +             goto out_err;
> >> +     }
> >> +     pr_debug("%s: unflattened OK\n", __func__);
> >> +
> >> +     /* mark it as detached */
> >> +     of_node_set_flag(overlay->overlay, OF_DETACHED);
> >> +
> >> +     /* perform resolution */
> >> +     err = of_resolve_phandles(overlay->overlay);
> >> +     if (err != 0) {
> >> +             pr_err("%s: Failed to resolve tree\n", __func__);
> >> +             goto out_err;
> >> +     }
> >> +     pr_debug("%s: resolved OK\n", __func__);
> >> +
> >> +     err = of_overlay_create(overlay->overlay);
> >> +     if (err < 0) {
> >> +             pr_err("%s: Failed to create overlay (err=%d)\n",
> >> +                             __func__, err);
> >> +             goto out_err;
> >> +     }
> >> +     overlay->ov_id = err;
> >> +
> >> +out_err:
> >> +     return err;
> >> +}
> >> +
> >> +static inline struct cfs_overlay_item *to_cfs_overlay_item(
> >> +             struct config_item *item)
> >> +{
> >> +     return item ? container_of(item, struct cfs_overlay_item, item) : NULL;
> >> +}
> >> +
> >> +CONFIGFS_ATTR_STRUCT(cfs_overlay_item);
> >> +#define CFS_OVERLAY_ITEM_ATTR(_name, _mode, _show, _store)   \
> >> +struct cfs_overlay_item_attribute cfs_overlay_item_attr_##_name = \
> >> +     __CONFIGFS_ATTR(_name, _mode, _show, _store)
> >> +#define CFS_OVERLAY_ITEM_ATTR_RO(_name, _show)       \
> >> +struct cfs_overlay_item_attribute cfs_overlay_item_attr_##_name = \
> >> +     __CONFIGFS_ATTR_RO(_name, _show)
> >> +
> >> +CONFIGFS_BIN_ATTR_STRUCT(cfs_overlay_item);
> >> +#define CFS_OVERLAY_ITEM_BIN_ATTR(_name, _mode, _read, _write, _priv, _max) \
> >> +struct cfs_overlay_item_bin_attribute cfs_overlay_item_bin_attr_##_name = \
> >> +     __CONFIGFS_BIN_ATTR(_name, _mode, _read, _write, _priv, _max)
> >> +#define CFS_OVERLAY_ITEM_BIN_ATTR_RO(_name, _read, _priv, _max)      \
> >> +struct cfs_overlay_item_bin_attribute cfs_overlay_item_bin_attr_##_name = \
> >> +     __CONFIGFS_BIN_ATTR_RO(_name, _read, _priv, _max)
> >> +
> >> +static ssize_t cfs_overlay_item_path_show(struct cfs_overlay_item *overlay,
> >> +             char *page)
> >> +{
> >> +     return sprintf(page, "%s\n", overlay->path);
> >> +}
> >> +
> >> +static ssize_t cfs_overlay_item_path_store(struct cfs_overlay_item *overlay,
> >> +             const char *page, size_t count)
> >> +{
> >> +     const char *p = page;
> >> +     char *s;
> >> +     int err;
> >> +
> >> +     /* if it's set do not allow changes */
> >> +     if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
> >> +             return -EPERM;
> >> +
> >> +     /* copy to path buffer (and make sure it's always zero terminated */
> >> +     count = snprintf(overlay->path, sizeof(overlay->path) - 1, "%s", p);
> >> +     overlay->path[sizeof(overlay->path) - 1] = '\0';
> >
> > kmemdup perhaps to get rid of the hard coded path length?
> >
> >> +
> >> +     /* strip trailing newlines */
> >> +     s = overlay->path + strlen(overlay->path);
> >> +     while (s > overlay->path && *--s == '\n')
> >> +             *s = '\0';
> >
> > strchr() will find trailing \n's for you.
> >
> >> +
> >> +     pr_debug("%s: path is '%s'\n", __func__, overlay->path);
> >> +
> >> +     err = request_firmware(&overlay->fw, overlay->path, NULL);
> >> +     if (err != 0)
> >> +             goto out_err;
> >> +
> >> +     err = create_overlay(overlay, (void *)overlay->fw->data);
> >> +     if (err != 0)
> >> +             goto out_err;
> >> +
> >> +     return count;
> >> +
> >> +out_err:
> >> +
> >> +     release_firmware(overlay->fw);
> >> +     overlay->fw = NULL;
> >> +
> >> +     overlay->path[0] = '\0';
> >> +     return err;
> >> +}
> >> +
> >> +static ssize_t cfs_overlay_item_status_show(struct cfs_overlay_item *overlay,
> >> +             char *page)
> >> +{
> >> +     return sprintf(page, "%s\n",
> >> +                     overlay->ov_id >= 0 ? "applied" : "unapplied");
> >> +}
> >> +
> >> +CFS_OVERLAY_ITEM_ATTR(path, S_IRUGO | S_IWUSR,
> >> +             cfs_overlay_item_path_show, cfs_overlay_item_path_store);
> >> +CFS_OVERLAY_ITEM_ATTR_RO(status, cfs_overlay_item_status_show);
> >> +
> >> +static struct configfs_attribute *cfs_overlay_attrs[] = {
> >> +     &cfs_overlay_item_attr_path.attr,
> >> +     &cfs_overlay_item_attr_status.attr,
> >> +     NULL,
> >> +};
> >> +
> >> +ssize_t cfs_overlay_item_dtbo_read(struct cfs_overlay_item *overlay,
> >> +             void *buf, size_t max_count)
> >> +{
> >> +     pr_debug("%s: buf=%p max_count=%u\n", __func__,
> >> +                     buf, max_count);
> >> +
> >> +     if (overlay->dtbo == NULL)
> >> +             return 0;
> >> +
> >> +     /* copy if buffer provided */
> >> +     if (buf != NULL) {
> >> +             /* the buffer must be large enough */
> >> +             if (overlay->dtbo_size > max_count)
> >> +                     return -ENOSPC;
> >
> > I've not dug into configfs code. Is it not possible to do a partial
> > read?
> >
> >> +
> >> +             memcpy(buf, overlay->dtbo, overlay->dtbo_size);
> >> +     }
> >> +
> >> +     return overlay->dtbo_size;
> >> +}
> >> +
> >> +ssize_t cfs_overlay_item_dtbo_write(struct cfs_overlay_item *overlay,
> >> +             const void *buf, size_t count)
> >> +{
> >> +     int err;
> >> +
> >> +     /* if it's set do not allow changes */
> >> +     if (overlay->path[0] != '\0' || overlay->dtbo_size > 0)
> >> +             return -EPERM;
> >> +
> >> +     /* copy the contents */
> >> +     overlay->dtbo = kmemdup(buf, count, GFP_KERNEL);
> >> +     if (overlay->dtbo == NULL)
> >> +             return -ENOMEM;
> >> +
> >> +     overlay->dtbo_size = count;
> >> +
> >> +     err = create_overlay(overlay, overlay->dtbo);
> >> +     if (err != 0)
> >> +             goto out_err;
> >> +
> >> +     return count;
> >> +
> >> +out_err:
> >> +     kfree(overlay->dtbo);
> >> +     overlay->dtbo = NULL;
> >> +     overlay->dtbo_size = 0;
> >> +
> >> +     return err;
> >> +}
> >> +
> >> +CFS_OVERLAY_ITEM_BIN_ATTR(dtbo, S_IRUGO | S_IWUSR,
> >> +             cfs_overlay_item_dtbo_read, cfs_overlay_item_dtbo_write,
> >> +             NULL, SZ_1M);
> >> +
> >> +static struct configfs_bin_attribute *cfs_overlay_bin_attrs[] = {
> >> +     &cfs_overlay_item_bin_attr_dtbo.bin_attr,
> >> +     NULL,
> >> +};
> >> +
> >> +static void cfs_overlay_release(struct config_item *item)
> >> +{
> >> +     struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
> >> +
> >> +     if (overlay->ov_id >= 0)
> >> +             of_overlay_destroy(overlay->ov_id);
> >> +     if (overlay->fw)
> >> +             release_firmware(overlay->fw);
> >> +     /* kfree with NULL is safe */
> >> +     kfree(overlay->dtbo);
> >> +     kfree(overlay);
> >> +}
> >> +
> >> +CONFIGFS_ATTR_OPS(cfs_overlay_item);
> >> +CONFIGFS_BIN_ATTR_OPS(cfs_overlay_item);
> >> +static struct configfs_item_operations cfs_overlay_item_ops = {
> >> +     .release                = cfs_overlay_release,
> >> +     .show_attribute         = cfs_overlay_item_attr_show,
> >> +     .store_attribute        = cfs_overlay_item_attr_store,
> >> +     .read_bin_attribute     = cfs_overlay_item_bin_attr_read,
> >> +     .write_bin_attribute    = cfs_overlay_item_bin_attr_write,
> >> +};
> >> +
> >> +static struct config_item_type cfs_overlay_type = {
> >> +     .ct_item_ops    = &cfs_overlay_item_ops,
> >> +     .ct_attrs       = cfs_overlay_attrs,
> >> +     .ct_bin_attrs   = cfs_overlay_bin_attrs,
> >> +     .ct_owner       = THIS_MODULE,
> >> +};
> >> +
> >> +static struct config_item *cfs_overlay_group_make_item(
> >> +             struct config_group *group, const char *name)
> >> +{
> >> +     struct cfs_overlay_item *overlay;
> >> +
> >> +     overlay = kzalloc(sizeof(*overlay), GFP_KERNEL);
> >> +     if (!overlay)
> >> +             return ERR_PTR(-ENOMEM);
> >> +     overlay->ov_id = -1;
> >> +
> >> +     config_item_init_type_name(&overlay->item, name, &cfs_overlay_type);
> >> +     return &overlay->item;
> >> +}
> >> +
> >> +static void cfs_overlay_group_drop_item(struct config_group *group,
> >> +             struct config_item *item)
> >> +{
> >> +     struct cfs_overlay_item *overlay = to_cfs_overlay_item(item);
> >> +
> >> +     config_item_put(&overlay->item);
> >> +}
> >> +
> >> +static struct configfs_group_operations overlays_ops = {
> >> +     .make_item      = cfs_overlay_group_make_item,
> >> +     .drop_item      = cfs_overlay_group_drop_item,
> >> +};
> >> +
> >> +static struct config_item_type overlays_type = {
> >> +     .ct_group_ops   = &overlays_ops,
> >> +     .ct_owner       = THIS_MODULE,
> >> +};
> >> +
> >> +static struct configfs_group_operations of_cfs_ops = {
> >> +     /* empty - we don't allow anything to be created */
> >> +};
> >> +
> >> +static struct config_item_type of_cfs_type = {
> >> +     .ct_group_ops   = &of_cfs_ops,
> >> +     .ct_owner       = THIS_MODULE,
> >> +};
> >> +
> >> +struct config_group of_cfs_overlay_group;
> >> +
> >> +struct config_group *of_cfs_def_groups[] = {
> >> +     &of_cfs_overlay_group,
> >> +     NULL
> >> +};
> >> +
> >> +static struct configfs_subsystem of_cfs_subsys = {
> >> +     .su_group = {
> >> +             .cg_item = {
> >> +                     .ci_namebuf = "device-tree",
> >> +                     .ci_type = &of_cfs_type,
> >> +             },
> >> +             .default_groups = of_cfs_def_groups,
> >> +     },
> >> +     .su_mutex = __MUTEX_INITIALIZER(of_cfs_subsys.su_mutex),
> >> +};
> >> +
> >> +static int __init of_cfs_init(void)
> >> +{
> >> +     int ret;
> >> +
> >> +     pr_info("%s\n", __func__);
> >> +
> >> +     config_group_init(&of_cfs_subsys.su_group);
> >> +     config_group_init_type_name(&of_cfs_overlay_group, "overlays",
> >> +                     &overlays_type);
> >> +
> >> +     ret = configfs_register_subsystem(&of_cfs_subsys);
> >> +     if (ret != 0) {
> >> +             pr_err("%s: failed to register subsys\n", __func__);
> >> +             goto out;
> >> +     }
> >> +     pr_info("%s: OK\n", __func__);
> >> +out:
> >> +     return ret;
> >> +}
> >> +late_initcall(of_cfs_init);
> >> --
> >> 1.7.12
> >>
> >
> 
> 
> 
> -- 
> Kees Cook
> Chrome OS Security

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
