From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 2/9] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 10 Aug 2010 11:46:39 -0600
Message-ID: <AANLkTimPsDWcW_3z46mMFCxkui+3v6q64F2EMLBr6mNK@mail.gmail.com>
References: <1279918663-29960-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279918663-29960-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<39f3d9ca-1943-43b8-a1f6-eba8fb2aeeec@SG2EHSMHS004.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <39f3d9ca-1943-43b8-a1f6-eba8fb2aeeec-RaUQJvECHiuXHCJdrdq+zrjjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 23, 2010 at 2:57 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
> This code allows a user to parse a partial device tree blob, which is
> structurally independent of any toplevel blob.
> Previously, this code assumed that the blob comes from initial_boot_param=
s.
> Now, unflatten_partial_device_tree can take a blob from an arbitrary posi=
tion,
> and the location of the blob gets passed around to the various support fu=
nctions.

For ease of review, please split this patch into two pieces; one to
pass around the boot_param_header pointer, and one to add the partial
parsing function.

>
> Signed-off-by: Stephen Neuendorffer <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
> ---
> =A0drivers/of/fdt.c =A0 =A0 =A0 | =A0169 ++++++++++++++++++++++++++++++++=
+--------------
> =A0include/linux/of_fdt.h | =A0 11 ++-
> =A02 files changed, 126 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index d61fda8..89fb1f3 100644
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
> @@ -22,15 +24,19 @@
>
> =A0#include <asm/page.h>
>
> -int __initdata dt_root_addr_cells;
> -int __initdata dt_root_size_cells;
> +int dt_root_addr_cells;
> +int dt_root_size_cells;

With this new use case, these globals really need to be removed and
handled safely.  You wouldn't want two partial trees getting parsed
expecting different values in these properties!  The solution is
possibly by putting them into a context structure that is passed
around the fdt parsing functions.  Another solution might be to hold a
mutex for the entirety of parsing the flat tree.

However, maybe this doesn't matter, and they can remain as __initdata.
 The only user of these values seems to be early_init_dt_scan_memory()
which I don't think you need for your PCI add in device use-case.  Am
I correct?

> =A0struct boot_param_header *initial_boot_params;
>
> -char *find_flat_dt_string(u32 offset)
> +void __unflatten_device_tree(unsigned long *blob, struct device_node **m=
ynodes,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long (*=
dt_alloc)(u64 size, u64 align));

If you order you functions correctly, this forward declaration can be remov=
ed.

> +
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
> @@ -118,8 +124,9 @@ unsigned long __init of_get_flat_dt_root(void)
> =A0* This function can be used within scan_flattened_dt callback to get
> =A0* access to properties
> =A0*/
> -void *__init of_get_flat_dt_prop(unsigned long node, const char *name,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size)
> +void * __init of_get_flat_dt_prop(unsigned long node, const char *name,

Unrelated whitespace change.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned=
 long *size,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct b=
oot_param_header *blob)
> =A0{
> =A0 =A0 =A0 =A0unsigned long p =3D node;
>
> @@ -140,7 +147,7 @@ void *__init of_get_flat_dt_prop(unsigned long node, =
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
> @@ -160,12 +167,13 @@ void *__init of_get_flat_dt_prop(unsigned long node=
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
> @@ -179,7 +187,7 @@ int __init of_flat_dt_is_compatible(unsigned long nod=
e, const char *compat)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -static void *__init unflatten_dt_alloc(unsigned long *mem, unsigned long=
 size,
> +static void *unflatten_dt_alloc(unsigned long *mem, unsigned long size,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 unsigned long align)
> =A0{
> =A0 =A0 =A0 =A0void *res;
> @@ -198,11 +206,12 @@ static void *__init unflatten_dt_alloc(unsigned lon=
g *mem, unsigned long size,
> =A0* @allnextpp: pointer to ->allnext from last allocated device_node
> =A0* @fpsize: Size of the node path up at the current depth.
> =A0*/
> -unsigned long __init unflatten_dt_node(unsigned long mem,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned long *p,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct device_node *dad,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 struct device_node ***allnextpp,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 unsigned long fpsize)
> +unsigned long unflatten_dt_node(unsigned long mem,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned lo=
ng *p,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct devi=
ce_node *dad,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct devi=
ce_node ***allnextpp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned lo=
ng fpsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct boot=
_param_header *blob)
> =A0{
> =A0 =A0 =A0 =A0struct device_node *np;
> =A0 =A0 =A0 =A0struct property *pp, **prev_pp =3D NULL;
> @@ -298,10 +307,10 @@ unsigned long __init unflatten_dt_node(unsigned lon=
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
> @@ -380,7 +389,8 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (tag =3D=3D OF_DT_NOP)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*p +=3D 4;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem =3D unflatten_dt_node(m=
em, p, np, allnextpp, fpsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mem =3D unflatten_dt_node(m=
em, p, np, allnextpp,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 fpsize, blob);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0tag =3D be32_to_cpup((__be32 *)(*p));
> =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0if (tag !=3D OF_DT_END_NODE) {
> @@ -391,6 +401,8 @@ unsigned long __init unflatten_dt_node(unsigned long =
mem,
> =A0 =A0 =A0 =A0return mem;
> =A0}
>
> +#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(CON=
FIG_SPARC)
> +

Nack.  arm, mips, and even some x86 platforms will use this code.  Not
sure what the best way to solve this is; need to think about it for a
bit.

> =A0#ifdef CONFIG_BLK_DEV_INITRD
> =A0/**
> =A0* early_init_dt_check_for_initrd - Decode initrd location from flat tr=
ee
> @@ -403,12 +415,14 @@ void __init early_init_dt_check_for_initrd(unsigned=
 long node)
>
> =A0 =A0 =A0 =A0pr_debug("Looking for initrd properties... ");
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start", &l=
en);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&len=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (!prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0start =3D of_read_ulong(prop, len/4);
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end", &len=
);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&len=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (!prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0end =3D of_read_ulong(prop, len/4);
> @@ -436,12 +450,14 @@ int __init early_init_dt_scan_root(unsigned long no=
de, const char *uname,
> =A0 =A0 =A0 =A0dt_root_size_cells =3D OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
> =A0 =A0 =A0 =A0dt_root_addr_cells =3D OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells", NULL);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_size_cells =3D be32_to_cpup(prop);
> =A0 =A0 =A0 =A0pr_debug("dt_root_size_cells =3D %x\n", dt_root_size_cells=
);
>
> - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells", NULL);
> + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0NULL=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (prop)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_addr_cells =3D be32_to_cpup(prop);
> =A0 =A0 =A0 =A0pr_debug("dt_root_addr_cells =3D %x\n", dt_root_addr_cells=
);
> @@ -450,7 +466,7 @@ int __init early_init_dt_scan_root(unsigned long node=
, const char *uname,
> =A0 =A0 =A0 =A0return 1;
> =A0}
>
> -u64 __init dt_mem_next_cell(int s, __be32 **cellp)
> +u64 =A0dt_mem_next_cell(int s, __be32 **cellp)

nit: single space between u64 and dt_mem_next_cell

> =A0{
> =A0 =A0 =A0 =A0__be32 *p =3D *cellp;
>
> @@ -464,7 +480,8 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
> =A0int __init early_init_dt_scan_memory(unsigned long node, const char *u=
name,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i=
nt depth, void *data)
> =A0{
> - =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type", NUL=
L);
> + =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0NULL, initial_boot_params);
> =A0 =A0 =A0 =A0__be32 *reg, *endp;
> =A0 =A0 =A0 =A0unsigned long l;
>
> @@ -479,9 +496,10 @@ int __init early_init_dt_scan_memory(unsigned long n=
ode, const char *uname,
> =A0 =A0 =A0 =A0} else if (strcmp(type, "memory") !=3D 0)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> - =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory", &l=
);
> + =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &l, ini=
tial_boot_params);
> =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg", &l=
);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg", &l=
, initial_boot_params);
> =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>
> @@ -521,12 +539,12 @@ int __init early_init_dt_scan_chosen(unsigned long =
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
> @@ -535,12 +553,21 @@ int __init early_init_dt_scan_chosen(unsigned long =
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
>
> +
> +static unsigned long early_device_tree_alloc(u64 size, u64 align)
> +{
> + =A0 =A0 =A0 unsigned long mem =3D early_init_dt_alloc_memory_arch(size,=
 align);
> + =A0 =A0 =A0 return (unsigned long) __va(mem);
> +}
> +
> =A0/**
> =A0* unflatten_device_tree - create tree of device_nodes from flat blob
> =A0*
> @@ -551,58 +578,98 @@ int __init early_init_dt_scan_chosen(unsigned long =
node, const char *uname,
> =A0*/
> =A0void __init unflatten_device_tree(void)
> =A0{
> + =A0 =A0 =A0 __unflatten_device_tree(initial_boot_params, &allnodes,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 early_devic=
e_tree_alloc);
> +
> + =A0 =A0 =A0 /* Get pointer to OF "/chosen" node for use everywhere */
> + =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/chosen");
> + =A0 =A0 =A0 if (of_chosen =3D=3D NULL)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/chosen=
@0");
> +}
> +
> +#endif

It is customary and helpful to put /* CONFIG_<blah> */ on an #endif line.

> +
> +static unsigned long kernel_tree_alloc(u64 size, u64 align)
> +{
> + =A0 =A0 =A0 return (unsigned long) kzalloc(size, GFP_KERNEL);
> +}
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
> +void unflatten_partial_device_tree(unsigned long *blob,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stru=
ct device_node **mynodes)
> +{
> + =A0 =A0 =A0 __unflatten_device_tree(blob, mynodes, &kernel_tree_alloc);
> +}
> +EXPORT_SYMBOL(unflatten_partial_device_tree);

Move the two unflatten functions below __unflatten_device_tree to
eliminate the forward declaration at the top of the file.

> +
> +/**
> + * __unflatten_device_tree - create tree of device_nodes from flat blob
> + *
> + * unflattens the device-tree passed by the firmware, creating the
> + * tree of struct device_node. It also fills the "name" and "type"
> + * pointers of the nodes so the normal device-tree walking functions
> + * can be used. =A0Memory is allocated using the given function.
> + */
> +void __unflatten_device_tree(unsigned long *blob, struct device_node **m=
ynodes,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned long (*=
dt_alloc)(u64 size, u64 align))
> +{
> + =A0 =A0 =A0 struct boot_param_header *device_tree =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 (struct boot_param_header *)blob;
> =A0 =A0 =A0 =A0unsigned long start, mem, size;
> - =A0 =A0 =A0 struct device_node **allnextp =3D &allnodes;
> + =A0 =A0 =A0 struct device_node **allnextp =3D mynodes;
>
> =A0 =A0 =A0 =A0pr_debug(" -> unflatten_device_tree()\n");
>
> - =A0 =A0 =A0 if (!initial_boot_params) {
> + =A0 =A0 =A0 if (!device_tree) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("No device tree pointer\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0pr_debug("Unflattening device tree:\n");
> - =A0 =A0 =A0 pr_debug("magic: %08x\n", be32_to_cpu(initial_boot_params->=
magic));
> - =A0 =A0 =A0 pr_debug("size: %08x\n", be32_to_cpu(initial_boot_params->t=
otalsize));
> - =A0 =A0 =A0 pr_debug("version: %08x\n", be32_to_cpu(initial_boot_params=
->version));
> + =A0 =A0 =A0 pr_debug("magic: %08x\n", be32_to_cpu(device_tree->magic));
> + =A0 =A0 =A0 pr_debug("size: %08x\n", be32_to_cpu(device_tree->totalsize=
));
> + =A0 =A0 =A0 pr_debug("version: %08x\n", be32_to_cpu(device_tree->versio=
n));
>
> - =A0 =A0 =A0 if (be32_to_cpu(initial_boot_params->magic) !=3D OF_DT_HEAD=
ER) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Invalid device tree blob header\n");
> + =A0 =A0 =A0 if (be32_to_cpu(device_tree->magic) !=3D OF_DT_HEADER) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_err("Invalid device tree blob header %x\=
n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpu(device_tree->mag=
ic));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* First pass, scan for size */
> - =A0 =A0 =A0 start =3D ((unsigned long)initial_boot_params) +
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(initial_boot_params->off_dt_str=
uct);
> - =A0 =A0 =A0 size =3D unflatten_dt_node(0, &start, NULL, NULL, 0);
> + =A0 =A0 =A0 start =3D ((unsigned long)device_tree) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(device_tree->off_dt_struct);
> + =A0 =A0 =A0 size =3D unflatten_dt_node(0, &start, NULL, NULL, 0, device=
_tree);
> =A0 =A0 =A0 =A0size =3D (size | 3) + 1;
>
> =A0 =A0 =A0 =A0pr_debug(" =A0size is %lx, allocating...\n", size);
>
> =A0 =A0 =A0 =A0/* Allocate memory for the expanded device tree */
> - =A0 =A0 =A0 mem =3D early_init_dt_alloc_memory_arch(size + 4,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __alignof__(struct device_n=
ode));
> - =A0 =A0 =A0 mem =3D (unsigned long) __va(mem);
> + =A0 =A0 =A0 mem =3D (unsigned long) dt_alloc(size + 4,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __alignof__(struct device_node)=
);
>
> =A0 =A0 =A0 =A0((__be32 *)mem)[size / 4] =3D cpu_to_be32(0xdeadbeef);
>
> =A0 =A0 =A0 =A0pr_debug(" =A0unflattening %lx...\n", mem);
>
> =A0 =A0 =A0 =A0/* Second pass, do actual unflattening */
> - =A0 =A0 =A0 start =3D ((unsigned long)initial_boot_params) +
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(initial_boot_params->off_dt_str=
uct);
> - =A0 =A0 =A0 unflatten_dt_node(mem, &start, NULL, &allnextp, 0);
> + =A0 =A0 =A0 start =3D ((unsigned long)device_tree) +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(device_tree->off_dt_struct);
> + =A0 =A0 =A0 unflatten_dt_node(mem, &start, NULL, &allnextp, 0, device_t=
ree);
> =A0 =A0 =A0 =A0if (be32_to_cpup((__be32 *)start) !=3D OF_DT_END)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("Weird tag at end of tree: %08x\=
n", *((u32 *)start));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("Weird tag at end of tree: %08x\=
n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*((u32 *)start));
> =A0 =A0 =A0 =A0if (be32_to_cpu(((__be32 *)mem)[size / 4]) !=3D 0xdeadbeef)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_warning("End of tree marker overwritten=
: %08x\n",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 be32_to_cpu(((__be32 =
*)mem)[size / 4]));
> =A0 =A0 =A0 =A0*allnextp =3D NULL;
>
> - =A0 =A0 =A0 /* Get pointer to OF "/chosen" node for use everywhere */
> - =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/chosen");
> - =A0 =A0 =A0 if (of_chosen =3D=3D NULL)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/chosen=
@0");
> -
> =A0 =A0 =A0 =A0pr_debug(" <- unflatten_device_tree()\n");
> =A0}
> diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> index 71e1a91..2bc0754 100644
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
> @@ -98,6 +101,8 @@ extern int early_init_dt_scan_root(unsigned long node,=
 const char *uname,
>
> =A0/* Other Prototypes */
> =A0extern void unflatten_device_tree(void);
> +extern void unflatten_partial_device_tree(unsigned long *blob,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 struct device_node **mynodes);
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
