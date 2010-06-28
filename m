From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH] of/fdt: Add unflatten_partial_device_tree
Date: Mon, 28 Jun 2010 16:18:27 -0700
Message-ID: <AANLkTilXgArDaFjv0RiTMeQBdU3bma4sTtLLbwN8lI4O@mail.gmail.com>
References: <1277747279-9236-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1277747279-9236-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<aa5152a0-4931-479a-bc89-78ac4922c7f1@SG2EHSMHS006.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <aa5152a0-4931-479a-bc89-78ac4922c7f1-RaUQJvECHiv5op9OF0Koj7jjLBE8jN/0@public.gmane.org>
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
> This code allows a user to parse a partial device tree blob, which is
> structurally independent of any toplevel blob.
> Previously, this code assumed that the blob comes from initial_boot_param=
s.
> Now, unflatten_partial_device_tree can take a blob from an arbitrary posi=
tion,
> and the location of the blob gets passed around to the various support fu=
nctions.
> Some of the functions are still tied to the initial_boot_params blob, alt=
hough
> perhaps they should get abstracted as well?

At the very least, all the references in drivers/of should probably be
abstracted.  I'm not to worried about the stuff in arch/* unless the
functions there are also needed for partial tree parsing.

The code in unflatten_partial_device_tree is also (as you know) a
blatant copy and paste from unflatten_device_tree.  The two functions
should be consolidated.

Another question is what to do with the unflattened tree once it is
unflattened.  Some of the existing code expects the node to be part of
the global tree.  Those could either be refactored, or the new partial
tree could be grafted into the global tree.  Grafting will have the
least impact, but it probably isn't a good idea in the long term.
Grafting together unrelated trees seems messy to me.

Cheers,
g.

> ---
> =A0drivers/of/fdt.c =A0 =A0 =A0 | =A0147 ++++++++++++++++++++++++++++++++=
++++------------
> =A0include/linux/of_fdt.h | =A0 10 ++-
> =A02 files changed, 118 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index 66401bc..628ba4f 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -11,10 +11,12 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/initrd.h>
> +#include <linux/module.h>
> =A0#include <linux/of.h>
> =A0#include <linux/of_fdt.h>
> =A0#include <linux/string.h>
> =A0#include <linux/errno.h>
> +#include <linux/slab.h>
>
> =A0#ifdef CONFIG_PPC
> =A0#include <asm/machdep.h>
> @@ -22,15 +24,16 @@
>
> =A0#include <asm/page.h>
>
> -int __initdata dt_root_addr_cells;
> -int __initdata dt_root_size_cells;
> +int dt_root_addr_cells;
> +int dt_root_size_cells;
>
> =A0struct boot_param_header *initial_boot_params;
>
> -char *find_flat_dt_string(u32 offset)
> +char *find_flat_dt_string(u32 offset,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot_param_heade=
r *blob)
> =A0{
> - =A0 =A0 =A0 return ((char *)initial_boot_params) +
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(initial_boot_params->off_dt_str=
ings) + offset;
> + =A0 =A0 =A0 return ((char *)blob) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(blob->off_dt_strings) + offset;
> =A0}
>
> =A0/**
> @@ -42,7 +45,7 @@ char *find_flat_dt_string(u32 offset)
> =A0* used to extract the memory information at boot before we can
> =A0* unflatten the tree
> =A0*/
> -int __init of_scan_flat_dt(int (*it)(unsigned long node,
> +int =A0of_scan_flat_dt(int (*it)(unsigned long node,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 c=
onst char *uname, int depth,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 v=
oid *data),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *data)
> @@ -102,7 +105,7 @@ int __init of_scan_flat_dt(int (*it)(unsigned long no=
de,
> =A0/**
> =A0* of_get_flat_dt_root - find the root node in the flat blob
> =A0*/
> -unsigned long __init of_get_flat_dt_root(void)
> +unsigned long =A0of_get_flat_dt_root(void)
> =A0{
> =A0 =A0 =A0 =A0unsigned long p =3D ((unsigned long)initial_boot_params) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpu(initial_boot_params->off_dt_st=
ruct);
> @@ -120,8 +123,9 @@ unsigned long __init of_get_flat_dt_root(void)
> =A0* This function can be used within scan_flattened_dt callback to get
> =A0* access to properties
> =A0*/
> -void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size)
> +void * of_get_flat_dt_prop(unsigned long node, const char *name,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct b=
oot_param_header *blob)
> =A0{
> =A0 =A0 =A0 =A0unsigned long p =3D node;
>
> @@ -142,7 +146,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, =
const char *name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (be32_to_cpu(initial_boot_params->versi=
on) < 0x10)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0p =3D ALIGN(p, sz >=3D 8 ?=
 8 : 4);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 nstr =3D find_flat_dt_string(noff);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 nstr =3D find_flat_dt_string(noff, blob);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (nstr =3D=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("Can't find pro=
perty index name !\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return NULL;
> @@ -162,12 +166,13 @@ void *__init of_get_flat_dt_prop(unsigned long node=
, const char *name,
> =A0* @node: node to test
> =A0* @compat: compatible string to compare with compatible list.
> =A0*/
> -int __init of_flat_dt_is_compatible(unsigned long node, const char *comp=
at)
> +int =A0of_flat_dt_is_compatible(unsigned long node, const char *compat,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct b=
oot_param_header *blob)
> =A0{
> =A0 =A0 =A0 =A0const char *cp;
> =A0 =A0 =A0 =A0unsigned long cplen, l;
>
> - =A0 =A0 =A0 cp =3D of_get_flat_dt_prop(node, "compatible", &cplen);
> + =A0 =A0 =A0 cp =3D of_get_flat_dt_prop(node, "compatible", &cplen, blob=
);
> =A0 =A0 =A0 =A0if (cp =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
> =A0 =A0 =A0 =A0while (cplen > 0) {
> @@ -181,7 +186,7 @@ int __init of_flat_dt_is_compatible(unsigned long nod=
e, const char *compat)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long=
 size,
> +static void * unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 unsigned long align)
> =A0{
> =A0 =A0 =A0 =A0void *res;
> @@ -200,11 +205,12 @@ static void *__init unflatten_dt_alloc(unsigned lon=
g *mem, unsigned long size,
> =A0* @allnextpp: pointer to ->allnext from last allocated device_node
> =A0* @fpsize: Size of the node path up at the current depth.
> =A0*/
> -unsigned long __init unflatten_dt_node(unsigned long mem,
> +unsigned long =A0unflatten_dt_node(unsigned long mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0unsigned long *p,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct device_node *dad,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0struct device_node ***allnextpp,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned long fpsize)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned long fpsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct b=
oot_param_header *blob)
> =A0{
> =A0 =A0 =A0 =A0struct device_node *np;
> =A0 =A0 =A0 =A0struct property *pp, **prev_pp =3D NULL;
> @@ -300,10 +306,10 @@ unsigned long __init unflatten_dt_node(unsigned lon=
g mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sz =3D be32_to_cpup((__be32 *)(*p));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0noff =3D be32_to_cpup((__be32 *)((*p) + 4)=
);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*p +=3D 8;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(initial_boot_params->versio=
n) < 0x10)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (be32_to_cpu(blob->version) < 0x10)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*p =3D ALIGN(*p, sz >=3D 8=
 ? 8 : 4);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pname =3D find_flat_dt_string(noff);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pname =3D find_flat_dt_string(noff, blob);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (pname =3D=3D NULL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_info("Can't find proper=
ty name in list !\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> @@ -382,7 +388,7 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (tag =3D=3D OF_DT_NOP)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*p +=3D 4;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem =3D unflatten_dt_node(m=
em, p, np, allnextpp, fpsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem =3D unflatten_dt_node(m=
em, p, np, allnextpp, fpsize, blob);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tag =3D be32_to_cpup((__be32 *)(*p));
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (tag !=3D OF_DT_END_NODE) {
> @@ -393,24 +399,26 @@ unsigned long __init unflatten_dt_node(unsigned lon=
g mem,
> =A0 =A0 =A0 =A0return mem;
> =A0}
>
> +#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(CON=
FIG_SPARC)
> +
> =A0#ifdef CONFIG_BLK_DEV_INITRD
> =A0/**
> =A0* early_init_dt_check_for_initrd - Decode initrd location from flat tr=
ee
> =A0* @node: reference to node containing initrd location ('chosen')
> =A0*/
> -void __init early_init_dt_check_for_initrd(unsigned long node)
> +void =A0early_init_dt_check_for_initrd(unsigned long node)
> =A0{
> =A0 =A0 =A0 =A0unsigned long start, end, len;
> =A0 =A0 =A0 =A0__be32 *prop;
>
> =A0 =A0 =A0 =A0pr_debug("Looking for initrd properties... ");
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start", &l=
en);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start", &l=
en, initial_boot_params);
> =A0 =A0 =A0 =A0if (!prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0start =3D of_read_ulong(prop, len/4);
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end", &len=
);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end", &len=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (!prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0end =3D of_read_ulong(prop, len/4);
> @@ -427,7 +435,7 @@ inline void early_init_dt_check_for_initrd(unsigned l=
ong node)
> =A0/**
> =A0* early_init_dt_scan_root - fetch the top level address and size cells
> =A0*/
> -int __init early_init_dt_scan_root(unsigned long node, const char *uname,
> +int =A0early_init_dt_scan_root(unsigned long node, const char *uname,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int d=
epth, void *data)
> =A0{
> =A0 =A0 =A0 =A0__be32 *prop;
> @@ -438,12 +446,12 @@ int __init early_init_dt_scan_root(unsigned long no=
de, const char *uname,
> =A0 =A0 =A0 =A0dt_root_size_cells =3D OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
> =A0 =A0 =A0 =A0dt_root_addr_cells =3D OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells", NULL);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells", NULL, ini=
tial_boot_params);
> =A0 =A0 =A0 =A0if (prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_size_cells =3D be32_to_cpup(prop);
> =A0 =A0 =A0 =A0pr_debug("dt_root_size_cells =3D %x\n", dt_root_size_cells=
);
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells", NULL);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells", NULL, =
initial_boot_params);
> =A0 =A0 =A0 =A0if (prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_addr_cells =3D be32_to_cpup(prop);
> =A0 =A0 =A0 =A0pr_debug("dt_root_addr_cells =3D %x\n", dt_root_addr_cells=
);
> @@ -452,7 +460,7 @@ int __init early_init_dt_scan_root(unsigned long node=
, const char *uname,
> =A0 =A0 =A0 =A0return 1;
> =A0}
>
> -u64 __init dt_mem_next_cell(int s, __be32 **cellp)
> +u64 =A0dt_mem_next_cell(int s, __be32 **cellp)
> =A0{
> =A0 =A0 =A0 =A0__be32 *p =3D *cellp;
>
> @@ -463,10 +471,10 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
> =A0/**
> =A0* early_init_dt_scan_memory - Look for an parse memory nodes
> =A0*/
> -int __init early_init_dt_scan_memory(unsigned long node, const char *una=
me,
> +int =A0early_init_dt_scan_memory(unsigned long node, const char *uname,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt depth, void *data)
> =A0{
> - =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type", NUL=
L);
> + =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type", NUL=
L, initial_boot_params);
> =A0 =A0 =A0 =A0__be32 *reg, *endp;
> =A0 =A0 =A0 =A0unsigned long l;
>
> @@ -481,9 +489,9 @@ int __init early_init_dt_scan_memory(unsigned long no=
de, const char *uname,
> =A0 =A0 =A0 =A0} else if (strcmp(type, "memory") !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> - =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l=
);
> + =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg", &l=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg", &l=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> @@ -509,7 +517,7 @@ int __init early_init_dt_scan_memory(unsigned long no=
de, const char *uname,
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -int __init early_init_dt_scan_chosen(unsigned long node, const char *una=
me,
> +int =A0early_init_dt_scan_chosen(unsigned long node, const char *uname,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt depth, void *data)
> =A0{
> =A0 =A0 =A0 =A0unsigned long l;
> @@ -523,12 +531,12 @@ int __init early_init_dt_scan_chosen(unsigned long =
node, const char *uname,
>
> =A0 =A0 =A0 =A0early_init_dt_check_for_initrd(node);
>
> +#ifdef CONFIG_CMDLINE
> =A0 =A0 =A0 =A0/* Retreive command line */
> - =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l);
> + =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l, initial_boo=
t_params);
> =A0 =A0 =A0 =A0if (p !=3D NULL && l > 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strlcpy(cmd_line, p, min((int)l, COMMAND_L=
INE_SIZE));
>
> -#ifdef CONFIG_CMDLINE
> =A0#ifndef CONFIG_CMDLINE_FORCE
> =A0 =A0 =A0 =A0if (p =3D=3D NULL || l =3D=3D 0 || (l =3D=3D 1 && (*p) =3D=
=3D 0))
> =A0#endif
> @@ -537,12 +545,14 @@ int __init early_init_dt_scan_chosen(unsigned long =
node, const char *uname,
>
> =A0 =A0 =A0 =A0early_init_dt_scan_chosen_arch(node);
>
> +#ifdef CONFIG_CMDLINE
> =A0 =A0 =A0 =A0pr_debug("Command line is: %s\n", cmd_line);
> +#endif /* CONFIG_CMDLINE */
>
> =A0 =A0 =A0 =A0/* break now */
> =A0 =A0 =A0 =A0return 1;
> =A0}
> -
> +
> =A0/**
> =A0* unflatten_device_tree - create tree of device_nodes from flat blob
> =A0*
> @@ -551,7 +561,7 @@ int __init early_init_dt_scan_chosen(unsigned long no=
de, const char *uname,
> =A0* pointers of the nodes so the normal device-tree walking functions
> =A0* can be used.
> =A0*/
> -void __init unflatten_device_tree(void)
> +void unflatten_device_tree(void)
> =A0{
> =A0 =A0 =A0 =A0unsigned long start, mem, size;
> =A0 =A0 =A0 =A0struct device_node **allnextp =3D &allnodes;
> @@ -576,7 +586,7 @@ void __init unflatten_device_tree(void)
> =A0 =A0 =A0 =A0/* First pass, scan for size */
> =A0 =A0 =A0 =A0start =3D ((unsigned long)initial_boot_params) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpu(initial_boot_params->off_dt_st=
ruct);
> - =A0 =A0 =A0 size =3D unflatten_dt_node(0, &start, NULL, NULL, 0);
> + =A0 =A0 =A0 size =3D unflatten_dt_node(0, &start, NULL, NULL, 0, initia=
l_boot_params);
> =A0 =A0 =A0 =A0size =3D (size | 3) + 1;
>
> =A0 =A0 =A0 =A0pr_debug(" =A0size is %lx, allocating...\n", size);
> @@ -593,7 +603,7 @@ void __init unflatten_device_tree(void)
> =A0 =A0 =A0 =A0/* Second pass, do actual unflattening */
> =A0 =A0 =A0 =A0start =3D ((unsigned long)initial_boot_params) +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpu(initial_boot_params->off_dt_st=
ruct);
> - =A0 =A0 =A0 unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
> + =A0 =A0 =A0 unflatten_dt_node(mem, &start, NULL, &allnextp, 0, initial_=
boot_params);
> =A0 =A0 =A0 =A0if (be32_to_cpup((__be32 *)start) !=3D OF_DT_END)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("Weird tag at end of tree: %08x=
\n", *((u32 *)start));
> =A0 =A0 =A0 =A0if (be32_to_cpu(((__be32 *)mem)[size / 4]) !=3D 0xdeadbeef)
> @@ -608,3 +618,68 @@ void __init unflatten_device_tree(void)
>
> =A0 =A0 =A0 =A0pr_debug(" <- unflatten_device_tree()\n");
> =A0}
> +
> +#endif
> +
> +/**
> + * unflatten_partial_device_tree - create tree of device_nodes from flat=
 blob
> + *
> + * unflattens the device-tree passed by the firmware, creating the
> + * tree of struct device_node. It also fills the "name" and "type"
> + * pointers of the nodes so the normal device-tree walking functions
> + * can be used.
> + */
> +void unflatten_partial_device_tree(unsigned long *blob, struct device_no=
de **mynodes)
> +{
> + =A0struct boot_param_header *device_tree =3D (struct boot_param_header =
*)blob;
> + =A0 =A0 =A0 =A0unsigned long start, mem, size;
> + =A0 =A0 =A0 struct device_node **allnextp =3D mynodes;
> +
> + =A0 =A0 =A0 pr_debug(" -> unflatten_partial_device_tree()\n");
> +
> + =A0 =A0 =A0 if (!device_tree) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_debug("No device tree pointer\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 pr_debug("Unflattening device tree:\n");
> + =A0 =A0 =A0 pr_debug("magic: %08x\n", be32_to_cpu(device_tree->magic));
> + =A0 =A0 =A0 pr_debug("size: %08x\n", be32_to_cpu(device_tree->totalsize=
));
> + =A0 =A0 =A0 pr_debug("version: %08x\n", be32_to_cpu(device_tree->versio=
n));
> +
> + =A0 =A0 =A0 if (be32_to_cpu(device_tree->magic) !=3D OF_DT_HEADER) {
> + =A0 =A0 =A0 =A0 pr_err("Invalid device tree blob header %x \n", be32_to=
_cpu(device_tree->magic));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* First pass, scan for size */
> + =A0 =A0 =A0 start =3D ((unsigned long)device_tree) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(device_tree->off_dt_struct);
> + =A0 =A0 =A0 size =3D unflatten_dt_node(0, &start, NULL, NULL, 0, device=
_tree);
> + =A0 =A0 =A0 size =3D (size | 3) + 1;
> +
> + =A0 =A0 =A0 pr_debug(" =A0size is %lx, allocating...\n", size);
> +
> + =A0 =A0 =A0 /* Allocate memory for the expanded device tree */
> + =A0 =A0 =A0 mem =3D (unsigned long) kzalloc(size + 4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __alignof__(struct device_node)=
);
> +
> + =A0 =A0 =A0 ((__be32 *)mem)[size / 4] =3D cpu_to_be32(0xdeadbeef);
> +
> + =A0 =A0 =A0 pr_debug(" =A0unflattening %lx...\n", mem);
> +
> + =A0 =A0 =A0 /* Second pass, do actual unflattening */
> + =A0 =A0 =A0 start =3D ((unsigned long)device_tree) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(device_tree->off_dt_struct);
> + =A0 =A0 =A0 unflatten_dt_node(mem, &start, NULL, &allnextp, 0, device_t=
ree);
> + =A0 =A0 =A0 if (be32_to_cpup((__be32 *)start) !=3D OF_DT_END)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("Weird tag at end of tree: %08x\=
n", *((u32 *)start));
> + =A0 =A0 =A0 if (be32_to_cpu(((__be32 *)mem)[size / 4]) !=3D 0xdeadbeef)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("End of tree marker overwritten:=
 %08x\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpu(((__be32=
 *)mem)[size / 4]));
> + =A0 =A0 =A0 *allnextp =3D NULL;
> +
> + =A0 =A0 =A0 pr_debug(" <- unflatten_partial_device_tree()\n");
> +}
> +
> +EXPORT_SYMBOL(unflatten_partial_device_tree);
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 71e1a91..008f520 100644
> --- a/include/linux/of_fdt.h
> +++ b/include/linux/of_fdt.h
> @@ -64,13 +64,16 @@ extern int __initdata dt_root_size_cells;
> =A0extern struct boot_param_header *initial_boot_params;
>
> =A0/* For scanning the flat device-tree at boot time */
> -extern char *find_flat_dt_string(u32 offset);
> +extern char *find_flat_dt_string(u32 offset,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot_param_heade=
r *blob);
> =A0extern int of_scan_flat_dt(int (*it)(unsigned long node, const char *u=
name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt depth, void *data),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *data);
> =A0extern void *of_get_flat_dt_prop(unsigned long node, const char *name,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size);
> -extern int of_flat_dt_is_compatible(unsigned long node, const char *name=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot_param_heade=
r *blob);
> +extern int of_flat_dt_is_compatible(unsigned long node, const char *name,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot_param_heade=
r *blob);
> =A0extern unsigned long of_get_flat_dt_root(void);
> =A0extern void early_init_dt_scan_chosen_arch(unsigned long node);
> =A0extern int early_init_dt_scan_chosen(unsigned long node, const char *u=
name,
> @@ -98,6 +101,7 @@ extern int early_init_dt_scan_root(unsigned long node,=
 const char *uname,
>
> =A0/* Other Prototypes */
> =A0extern void unflatten_device_tree(void);
> +extern void unflatten_partial_device_tree(unsigned long *blob, struct de=
vice_node **mynodes);
> =A0extern void early_init_devtree(void *);
> =A0#else /* CONFIG_OF_FLATTREE */
> =A0static inline void unflatten_device_tree(void) {}
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
