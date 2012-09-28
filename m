From: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] proc support add/remove dtb dynamically
Date: Fri, 28 Sep 2012 18:52:59 +0000
Message-ID: <b5078510-da82-4317-803b-50f823691f72@VA3EHSMHS028.ehs.local>
References: <1348856718-25854-1-git-send-email-atull@altera.com>
 <1348856718-25854-2-git-send-email-atull@altera.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1348856718-25854-2-git-send-email-atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
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
To: "atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org" <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Alan,

In general, I think your approach below could work.  However, I have a number of concerns:

1) My understanding is that the OF_DYNAMIC APIs are somewhat known to be incomplete, in the sense that
they don't generally handle the memory allocation and synchronization issues well between the traversal
of the device tree and the addition or removal of nodes.  Is this still the case, or are people comfortable
that OF_DYNAMIC is stable and robust?   Part of the reason why I approached the problem the way I did
in my previous patch was to isolate the static/root device tree from children device trees which can change.
The addition and removal of devices is handled by the regular device addition and removal functions,
which generally seem to be robust to these issues.

2) For FPGAs in particular, I think there are another set of synchronization issues that arise between
the handling of the device tree and the reconfiguration process itself.  In particular, when reconfiguring
an FPGA, we need a way to make sure that the devices associated with the FPGA cores are unloaded prior to
reconfiguring.  Otherwise there will likely be bus errors (or worse!) as the driver continues to attempt
to access the FPGA cores while reconfiguration is happening.  Part of the reason why I approached the
problem as I did was to try to manage this.

3) Another issue is one of ownership.  It seems that by providing this mechanism to userspace (even only as
root) there must be a userspace process for managing ownership of the FPGA fabric among multiple users.
Have you thought about this?  I think one reasonable way to represent 'ownership' of an FPGA is by having a
file open for writing (such as the file representing the configuration interface).  Do you have any
thoughts about how this could be combined with the management of device trees?

Basically, I think that the above issues are significant.  They are not necessarily issues with your code
at the detail level, but (at least for FPGA devices) I think there are bigger questions that we should
think about first to ensure that this is a stepping stone in the right direction.

Steve

> -----Original Message-----
> From: atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org [mailto:atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org]
> Sent: Friday, September 28, 2012 11:25 AM
> To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org; Rob Herring; yvanderv-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org;
> dinguyen-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org; monstr-pSz03upnqPeHXe+LvDLADg@public.gmane.org; Benjamin Herrenschmidt; Stephen
> Neuendorffer; Alan Tull
> Subject: [PATCH 1/1] proc support add/remove dtb dynamically
>
> From: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
>
> Command format:
>  1. First specify 'add:' or 'remove:' + the path of the parent node
>  2. Then cat the dtb.
>
> You must be root to do this.
>
> To add a my_periph.dtb under parent node /soc/apb_periphs:
>  $ echo "add:/soc/apb_periphs" > /proc/ofdt
>  $ cat my_periph.dtb > /proc/ofdt
>
> To remove the blob:
>  $ echo "remove:/soc/apb_periphs" > /proc/ofdt
>  $ cat my_periph.dtb > /proc/ofdt
>
> The .dts used to generate the .dtb blob only has only the nodes to
> be added, something like this:
> /dts-v1/;
> / {
>       i2c0: i2c@ffc04000 {
>             compatible = "snps,designware-i2c";
>             reg = <0xffc04000 0x1000>;
>             interrupts = <0 158 4>;
>             emptyfifo_hold_master = <1>;
>       };
>
>       i2c1: i2c@ffc05000 {
>             compatible = "snps,designware-i2c";
>             reg = <0xffc05000 0x1000>;
>             interrupts = <0 159 4>;
>             emptyfifo_hold_master = <1>;
>       };
> };
>
> Signed-off-by: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/of/Makefile  |    1 +
>  drivers/of/dynamic.c |  362
> ++++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 363 insertions(+)
>  create mode 100644 drivers/of/dynamic.c
>
> diff --git a/drivers/of/Makefile b/drivers/of/Makefile
> index e027f44..5c08045 100644
> --- a/drivers/of/Makefile
> +++ b/drivers/of/Makefile
> @@ -4,6 +4,7 @@ obj-$(CONFIG_OF_PROMTREE) += pdt.o
>  obj-$(CONFIG_OF_ADDRESS)  += address.o
>  obj-$(CONFIG_OF_IRQ)    += irq.o
>  obj-$(CONFIG_OF_DEVICE) += device.o platform.o
> +obj-$(CONFIG_OF_DYNAMIC) += dynamic.o
>  obj-$(CONFIG_OF_I2C) += of_i2c.o
>  obj-$(CONFIG_OF_NET) += of_net.o
>  obj-$(CONFIG_OF_SELFTEST) += selftest.o
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> new file mode 100644
> index 0000000..9a884ae
> --- /dev/null
> +++ b/drivers/of/dynamic.c
> @@ -0,0 +1,362 @@
> +/*
> + * Dynamic Device Tree support
> + *
> + * Copyright (C) 2012 Altera Corporation
> + * Author: Alan Tull <atull-EIB2kfCEclfQT0dZR+AlfA@public.gmane.org>
> + *
> + * Some code taken from arch/powerpc/platforms/pseries/reconfig.c
> + * Copyright (C) 2005 Nathan Lynch
> + * Copyright (C) 2005 IBM Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> along
> + * with this program; if not, write to the Free Software Foundation,
> Inc.,
> + * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
> +*/
> +
> +#include <linux/device.h>
> +#include <linux/cdev.h>
> +#include <linux/module.h>
> +#include <linux/kernel.h>
> +#include <linux/proc_fs.h>
> +#include <linux/of.h>
> +#include <linux/of_fdt.h>
> +#include <linux/uaccess.h>
> +#include <linux/mutex.h>
> +
> +static int proc_cmd;
> +static char *parent_path;
> +#define OF_DYNAMIC_UNDEFINED 0
> +#define OF_DYNAMIC_ADD_NODE  1
> +#define OF_DYNAMIC_REMOVE_NODE       2
> +
> +#define OF_DYNAMIC_ADD_NODE_STR              "add:"
> +#define OF_DYNAMIC_REMOVE_NODE_STR   "remove:"
> +
> +/*
> + * Routines for "runtime" addition and removal of device tree nodes.
> + * From arch/powerpc/platforms/pseries/reconfig.c
> + */
> +#ifdef CONFIG_PROC_DEVICETREE
> +/*
> + * Add a node to /proc/device-tree.
> + */
> +static void add_node_proc_entries(struct device_node *np)
> +{
> +     struct proc_dir_entry *ent;
> +
> +     ent = proc_mkdir(strrchr(np->full_name, '/') + 1, np->parent->pde);
> +     if (ent)
> +             proc_device_tree_add_node(np, ent);
> +}
> +
> +static void remove_node_proc_entries(struct device_node *np)
> +{
> +     struct property *pp = np->properties;
> +     struct device_node *parent = np->parent;
> +
> +     while (pp) {
> +             BUG_ON(!np->pde);
> +             BUG_ON(!pp->name);
> +             if (strlen(pp->name) == 0)
> +                     return;
> +             remove_proc_entry(pp->name, np->pde);
> +             pp = pp->next;
> +     }
> +     if (np->pde) {
> +             if (strlen(np->pde->name) == 0)
> +                     return;
> +             remove_proc_entry(np->pde->name, parent->pde);
> +     }
> +}
> +#else /* !CONFIG_PROC_DEVICETREE */
> +static void add_node_proc_entries(struct device_node *np)
> +{
> +     return;
> +}
> +
> +static void remove_node_proc_entries(struct device_node *np)
> +{
> +     return;
> +}
> +#endif /* CONFIG_PROC_DEVICETREE */
> +
> +/*
> + * Creates a node's full name by concatenating the parent path with the
> blob
> + * node name.
> + * Returns pointer to a char buffer or NULL.
> + */
> +static char *create_full_name(struct device_node *np, char
> *parent_full_name)
> +{
> +     int full_name_size;
> +     char *full_name;
> +
> +     full_name_size = strlen(parent_full_name) + strlen(np->full_name) +
> 1;
> +     full_name = kmalloc(full_name_size, GFP_KERNEL);
> +     if (!full_name)
> +             return NULL;
> +
> +     strcpy(full_name, parent_full_name);
> +     strcat(full_name, np->full_name);
> +
> +     return full_name;
> +}
> +
> +static int add_node(struct device_node *np, struct device_node
> *tree_parent)
> +{
> +     struct device_node *tree_np;
> +     char *full_name;
> +
> +     /* Add parent path to blob node's name */
> +     full_name = create_full_name(np, tree_parent->full_name);
> +     if (!full_name)
> +             return -ENOMEM;
> +     kfree(np->full_name);
> +     np->full_name = full_name;
> +
> +     /* Make sure node does not already exist in tree */
> +     tree_np = of_find_node_by_path(full_name);
> +     if (tree_np) {
> +             pr_err("Node already exists in device tree: %s\n",
> full_name);
> +             of_node_put(tree_np);
> +             return -EEXIST;
> +     }
> +
> +     pr_info("Adding device tree node: %s\n", full_name);
> +     np->parent = tree_parent;
> +     of_attach_node(np);
> +     add_node_proc_entries(np);
> +
> +     return 0;
> +}
> +
> +/* Add node and its siblings to existing tree */
> +static int add_nodes_to_tree(struct device_node *blob_nodes)
> +{
> +     struct device_node *real_blob_node, *tree_parent, *sibling, *np;
> +     int ret = 0;
> +
> +     /* First node is blank.  Start with its children. */
> +     real_blob_node = blob_nodes->child;
> +     if (!real_blob_node) {
> +             pr_err("First node not found in blob.\n");
> +             return -EINVAL;
> +     }
> +
> +     /* Find parent in existing tree */
> +     tree_parent = of_find_node_by_path(parent_path);
> +     if (!tree_parent) {
> +             pr_err("Tree parent not found at %s\n", parent_path);
> +             return -EINVAL;
> +     }
> +
> +     /* Add node and its siblings to existing tree */
> +     for (np = real_blob_node ; np && !ret ; np = sibling) {
> +             /* save sibling before it gets changed by of_attach_node */
> +             sibling = np->sibling;
> +             ret = add_node(np, tree_parent);
> +     }
> +
> +     /* of_find_node_by_path did of_node_get */
> +     of_node_put(tree_parent);
> +
> +     return ret;
> +}
> +
> +static int remove_node(struct device_node *blob_np)
> +{
> +     struct device_node *parent, *child, *tree_np;
> +     char *full_name;
> +
> +     full_name = create_full_name(blob_np, parent_path);
> +     if (!full_name)
> +             return -ENOMEM;
> +
> +     tree_np = of_find_node_by_path(full_name);
> +     if (!tree_np) {
> +             pr_err("Node does not exist in device tree: %s\n",
> full_name);
> +             kfree(full_name);
> +             return -EINVAL;
> +     }
> +     kfree(full_name);
> +
> +     parent = of_get_parent(tree_np);
> +     if (!parent)
> +             return -EINVAL;
> +
> +     /* TODO delete nodes recursively */
> +     /* don't delete node if it has children */
> +     child = of_get_next_child(tree_np, NULL);
> +     if (child) {
> +             of_node_put(child);
> +             of_node_put(parent);
> +             return -EBUSY;
> +     }
> +
> +     pr_info("Removing device tree node: %s\n", full_name);
> +     remove_node_proc_entries(tree_np);
> +     of_detach_node(tree_np);
> +
> +     of_node_put(parent);
> +
> +     return 0;
> +}
> +
> +static int remove_nodes_from_tree(struct device_node *blob_nodes)
> +{
> +     struct device_node *real_blob_node, *np;
> +
> +     /* First node is blank.  Start with its children. */
> +     real_blob_node = blob_nodes->child;
> +     if (!real_blob_node)
> +             return -EINVAL;
> +
> +     /* Remove node and its siblings from tree. If remove_node()
> +        has errors, continue and ignore errors from remove_node. */
> +     for (np = real_blob_node ; np ; np = np->sibling)
> +             remove_node(np);
> +
> +     return 0;
> +}
> +
> +static int check_device_tree_magic(struct boot_param_header *blob)
> +{
> +     BUG_ON(!blob);
> +
> +     if (be32_to_cpu(blob->magic) != OF_DT_HEADER)
> +             return -EFAULT;
> +
> +     return 0;
> +}
> +
> +static int set_parent_path(char *path)
> +{
> +     int path_len;
> +
> +     kfree(parent_path);
> +
> +     path_len = strlen(path);
> +     if (path[path_len - 1] == '\n')
> +             path_len--;
> +
> +     parent_path = kmalloc(path_len + 1, GFP_KERNEL);
> +     if (!parent_path)
> +             return -ENOMEM;
> +
> +     strncpy(parent_path, path, path_len);
> +     parent_path[path_len] = '\0';
> +
> +     return 0;
> +}
> +
> +/*
> + * Proc entry command interface
> + *
> + *  Specify 'add:' or 'remove:' + path of the parent node. Then cat the
> dtb.
> + *  You must be root to do this.
> + *  To add a blob:
> + *   $ echo "add:/soc/apb_periphs" > /proc/ofdt
> + *   $ cat my_periph.dtb > /proc/ofdt
> + *
> + *  To remove a blob:
> + *   $ echo "remove:/soc/apb_periphs" > /proc/ofdt
> + *   $ cat my_periph.dtb > /proc/ofdt
> + */
> +static ssize_t dynamic_write(struct file *file, const char __user *buf,
> +                          size_t count, loff_t *off)
> +{
> +     void *kbuf;
> +     char *path;
> +     struct device_node *np;
> +     int ret = 0;
> +
> +     kbuf = kmalloc(count + 1, GFP_KERNEL);
> +     if (!kbuf) {
> +             ret = -ENOMEM;
> +             goto out;
> +     }
> +     if (copy_from_user(kbuf, buf, count)) {
> +             ret = -EFAULT;
> +             goto out;
> +     }
> +     path = kbuf;
> +     path[count] = '\0';
> +
> +     /* See if this is a dtb */
> +     if (!check_device_tree_magic(kbuf)) {
> +             of_fdt_unflatten_tree(kbuf, &np);
> +
> +             switch (proc_cmd) {
> +             case OF_DYNAMIC_ADD_NODE:
> +                     ret = add_nodes_to_tree(np);
> +                     break;
> +
> +             case OF_DYNAMIC_REMOVE_NODE:
> +                     ret = remove_nodes_from_tree(np);
> +                     break;
> +
> +             default:
> +                     pr_err("need to specify
> [add|remove]:/path/to/parent/node\n");
> +                     break;
> +             }
> +     } else if ((count > sizeof(OF_DYNAMIC_ADD_NODE_STR)) &&
> +                (count < PATH_MAX) &&
> +                !strncmp(kbuf, OF_DYNAMIC_ADD_NODE_STR,
> +                     sizeof(OF_DYNAMIC_ADD_NODE_STR) - 1)) {
> +             proc_cmd = OF_DYNAMIC_ADD_NODE;
> +             path += sizeof(OF_DYNAMIC_ADD_NODE_STR) - 1;
> +             ret = set_parent_path(path);
> +             if (ret)
> +                     goto out;
> +             pr_info("cmd: OF_DYNAMIC_ADD_NODE. parent=%s\n",
> +                     parent_path);
> +
> +     } else if ((count > sizeof(OF_DYNAMIC_REMOVE_NODE_STR))
> +                && (count < PATH_MAX) &&
> +                !strncmp(kbuf, OF_DYNAMIC_REMOVE_NODE_STR,
> +                     sizeof(OF_DYNAMIC_REMOVE_NODE_STR) - 1)) {
> +             proc_cmd = OF_DYNAMIC_REMOVE_NODE;
> +             path += sizeof(OF_DYNAMIC_REMOVE_NODE_STR) - 1;
> +             ret = set_parent_path(path);
> +             if (ret)
> +                     goto out;
> +             pr_info("cmd: OF_DYNAMIC_REMOVE_NODE. parent=%s\n",
> +                     parent_path);
> +
> +     } else
> +             pr_err("Invalid device tree blob header or command\n");
> +
> +out:
> +     kfree(kbuf);
> +     return ret ? ret : count;
> +}
> +
> +static const struct file_operations dynamic_fops = {
> +     .write = dynamic_write,
> +     .llseek = noop_llseek,
> +};
> +
> +/* create /proc/ofdt write-only by root */
> +static int proc_dynamic_create_ofdt(void)
> +{
> +     struct proc_dir_entry *ent;
> +
> +     proc_cmd = OF_DYNAMIC_UNDEFINED;
> +     parent_path = NULL;
> +
> +     ent = proc_create("ofdt", S_IWUSR, NULL, &dynamic_fops);
> +     if (ent)
> +             ent->size = 0;
> +
> +     return 0;
> +}
> +device_initcall(proc_dynamic_create_ofdt);
> --
> 1.7.9.5
>



This email and any attachments are intended for the sole use of the named recipient(s) and contain(s) confidential information that may be proprietary, privileged or copyrighted under applicable law. If you are not the intended recipient, do not read, copy, or forward this email message or any attachments. Delete this email message and any attachments immediately.
