From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [PATCH 3/8] of/fdt: Add unflatten_partial_device_tree
Date: Tue, 10 Aug 2010 11:53:23 -0600
Message-ID: <AANLkTimE=YjDsr5em8ttAJkRzjZ6XMF_Hts0w0EpPzqx@mail.gmail.com>
References: <1279304021-22216-1-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-2-git-send-email-stephen.neuendorffer@xilinx.com>
	<1279304021-22216-3-git-send-email-stephen.neuendorffer@xilinx.com>
	<91a7e060-e748-47d5-aa7d-4fc45343d212@SG2EHSMHS005.ehs.local>
	<AANLkTikbhjZshaetoTX6kXHwt_SobYUG69cuDZd0gArF@mail.gmail.com>
	<58c8fb4d-50d9-45bb-9a09-9cd04033a912@SG2EHSMHS008.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <58c8fb4d-50d9-45bb-9a09-9cd04033a912-RaUQJvECHiusiP+nND6G/7jjLBE8jN/0@public.gmane.org>
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

On Fri, Jul 23, 2010 at 4:10 PM, Stephen Neuendorffer
<stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>
>
>> -----Original Message-----
>> From: glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org [mailto:glikely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org] On Behalf Of Gr=
ant Likely
>> Sent: Friday, July 16, 2010 12:25 PM
>> To: Stephen Neuendorffer
>> Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
>> Subject: Re: [PATCH 3/8] of/fdt: Add unflatten_partial_device_tree
>>
>> On Fri, Jul 16, 2010 at 12:13 PM, Stephen Neuendorffer
>> <stephen.neuendorffer-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org> wrote:
>> > @@ -391,6 +401,8 @@ unsigned long __init unflatten_dt_node(unsigned lo=
ng mem,
>> > =A0 =A0 =A0 =A0return mem;
>> > =A0}
>> >
>> > +#if defined(CONFIG_MICROBLAZE) || defined(CONFIG_POWERPC) || defined(=
CONFIG_SPARC)
>> > +
>>
>> Rather hacky.. There's got to be a better way. =A0Might be better to add
>> a new Kconfig symbol.
>>
>> Also, the test is wrong. =A0ARM is going to want this. =A0OLPC x86 might
>> want it. =A0SPARC doesn't use it.
>
> I think the right thing is to factor the __init/early related things into=
 a separate file.
> Sound reasonable? =A0Then whoever wants it can select it.

Heh, I forgot about this converation we had earlier.  I wouldn't
bother with a separate file (but I don't know, give it a try and see
what it looks like), but a separate 'def_bool n' config symbol sounds
best.

>
>> > =A0#ifdef CONFIG_BLK_DEV_INITRD
>> > =A0/**
>> > =A0* early_init_dt_check_for_initrd - Decode initrd location from flat=
 tree
>> > @@ -403,12 +415,14 @@ void __init early_init_dt_check_for_initrd(unsig=
ned long node)
>> >
>> > =A0 =A0 =A0 =A0pr_debug("Looking for initrd properties... ");
>> >
>> > - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start",=
 &len);
>> > + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-start",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&=
len, initial_boot_params);
>> > =A0 =A0 =A0 =A0if (!prop)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>> > =A0 =A0 =A0 =A0start =3D of_read_ulong(prop, len/4);
>> >
>> > - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end", &=
len);
>> > + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "linux,initrd-end",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&=
len, initial_boot_params);
>> > =A0 =A0 =A0 =A0if (!prop)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>> > =A0 =A0 =A0 =A0end =3D of_read_ulong(prop, len/4);
>> > @@ -436,12 +450,14 @@ int __init early_init_dt_scan_root(unsigned long=
 node, const char *uname,
>> > =A0 =A0 =A0 =A0dt_root_size_cells =3D OF_ROOT_NODE_SIZE_CELLS_DEFAULT;
>> > =A0 =A0 =A0 =A0dt_root_addr_cells =3D OF_ROOT_NODE_ADDR_CELLS_DEFAULT;
>> >
>> > - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells", NULL);
>> > + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#size-cells",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0N=
ULL, initial_boot_params);
>> > =A0 =A0 =A0 =A0if (prop)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_size_cells =3D be32_to_cpup(pro=
p);
>> > =A0 =A0 =A0 =A0pr_debug("dt_root_size_cells =3D %x\n", dt_root_size_ce=
lls);
>> >
>> > - =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells", NUL=
L);
>> > + =A0 =A0 =A0 prop =3D of_get_flat_dt_prop(node, "#address-cells",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0N=
ULL, initial_boot_params);
>> > =A0 =A0 =A0 =A0if (prop)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dt_root_addr_cells =3D be32_to_cpup(pro=
p);
>> > =A0 =A0 =A0 =A0pr_debug("dt_root_addr_cells =3D %x\n", dt_root_addr_ce=
lls);
>>
>> This is the update to the static globals I was mentioning that must not =
be done.
>>
>> > @@ -450,7 +466,7 @@ int __init early_init_dt_scan_root(unsigned long n=
ode, const char *uname,
>> > =A0 =A0 =A0 =A0return 1;
>> > =A0}
>> >
>> > -u64 __init dt_mem_next_cell(int s, __be32 **cellp)
>> > +u64 =A0dt_mem_next_cell(int s, __be32 **cellp)
>> > =A0{
>> > =A0 =A0 =A0 =A0__be32 *p =3D *cellp;
>> >
>> > @@ -464,7 +480,8 @@ u64 __init dt_mem_next_cell(int s, __be32 **cellp)
>> > =A0int __init early_init_dt_scan_memory(unsigned long node, const char=
 *uname,
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 int depth, void *data)
>> > =A0{
>> > - =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type", =
NULL);
>> > + =A0 =A0 =A0 char *type =3D of_get_flat_dt_prop(node, "device_type",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0NULL, initial_boot_params);
>> > =A0 =A0 =A0 =A0__be32 *reg, *endp;
>> > =A0 =A0 =A0 =A0unsigned long l;
>> >
>> > @@ -479,9 +496,10 @@ int __init early_init_dt_scan_memory(unsigned lon=
g node, const char *uname,
>> > =A0 =A0 =A0 =A0} else if (strcmp(type, "memory") !=3D 0)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> >
>> > - =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory",=
 &l);
>> > + =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "linux,usable-memory",
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 &l, =
initial_boot_params);
>> > =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
>> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg",=
 &l);
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D of_get_flat_dt_prop(node, "reg",=
 &l, initial_boot_params);
>> > =A0 =A0 =A0 =A0if (reg =3D=3D NULL)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
>> >
>> > @@ -521,12 +539,12 @@ int __init early_init_dt_scan_chosen(unsigned lo=
ng node, const char *uname,
>> >
>> > =A0 =A0 =A0 =A0early_init_dt_check_for_initrd(node);
>> >
>> > +#ifdef CONFIG_CMDLINE
>> > =A0 =A0 =A0 =A0/* Retreive command line */
>> > - =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l);
>> > + =A0 =A0 =A0 p =3D of_get_flat_dt_prop(node, "bootargs", &l, initial_=
boot_params);
>> > =A0 =A0 =A0 =A0if (p !=3D NULL && l > 0)
>> > =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0strlcpy(cmd_line, p, min((int)l, COMMAN=
D_LINE_SIZE));
>> >
>> > -#ifdef CONFIG_CMDLINE
>>
>> Why is this being changed?
>
> Because it requires a cmd_line global, which all architectures (especiall=
y x86) don't seem to have)
> Probably if the early stuff get's factored out, then this problem goes aw=
ay.

I'm considering changing this so that cmd_line is set with an
arch-specific callback.

>
>> > =A0#ifndef CONFIG_CMDLINE_FORCE
>> > =A0 =A0 =A0 =A0if (p =3D=3D NULL || l =3D=3D 0 || (l =3D=3D 1 && (*p) =
=3D=3D 0))
>> > =A0#endif
>> > @@ -535,12 +553,21 @@ int __init early_init_dt_scan_chosen(unsigned lo=
ng node, const char *uname,
>> >
>> > =A0 =A0 =A0 =A0early_init_dt_scan_chosen_arch(node);
>> >
>> > +#ifdef CONFIG_CMDLINE
>> > =A0 =A0 =A0 =A0pr_debug("Command line is: %s\n", cmd_line);
>> > +#endif /* CONFIG_CMDLINE */
>> >
>> > =A0 =A0 =A0 =A0/* break now */
>> > =A0 =A0 =A0 =A0return 1;
>> > =A0}
>> >
>> > +
>> > +static unsigned long early_device_tree_alloc(u64 size, u64 align)
>> > +{
>> > + =A0 =A0 =A0 unsigned long mem =3D early_init_dt_alloc_memory_arch(si=
ze, align);
>> > + =A0 =A0 =A0 return (unsigned long) __va(mem);
>> > +}
>> > +
>> > =A0/**
>> > =A0* unflatten_device_tree - create tree of device_nodes from flat blob
>> > =A0*
>> > @@ -551,58 +578,98 @@ int __init early_init_dt_scan_chosen(unsigned lo=
ng node, const char *uname,
>> > =A0*/
>> > =A0void __init unflatten_device_tree(void)
>> > =A0{
>> > + =A0 =A0 =A0 __unflatten_device_tree(initial_boot_params, &allnodes,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 early_de=
vice_tree_alloc);
>> > +
>> > + =A0 =A0 =A0 /* Get pointer to OF "/chosen" node for use everywhere */
>> > + =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/chosen");
>> > + =A0 =A0 =A0 if (of_chosen =3D=3D NULL)
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 of_chosen =3D of_find_node_by_path("/cho=
sen@0");
>> > +}
>> > +
>> > +#endif
>> > +
>> > +static unsigned long kernel_tree_alloc(u64 size, u64 align)
>> > +{
>> > + =A0 =A0 =A0 return (unsigned long) kzalloc(size, GFP_KERNEL);
>> > +}
>> > +
>> > +/**
>> > + * unflatten_partial_device_tree - create tree of device_nodes from f=
lat blob
>> > + *
>> > + * unflattens the device-tree passed by the firmware, creating the
>> > + * tree of struct device_node. It also fills the "name" and "type"
>> > + * pointers of the nodes so the normal device-tree walking functions
>> > + * can be used.
>> > + */
>> > +void unflatten_partial_device_tree(unsigned long *blob,
>> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s=
truct device_node **mynodes)
>> > +{
>> > + =A0 =A0 =A0 __unflatten_device_tree(blob, mynodes, &kernel_tree_allo=
c);
>> > +}
>> > +EXPORT_SYMBOL(unflatten_partial_device_tree);
>>
>> unflatten_partial_device_tree and unflatten_device_tree should be
>> defined *below* __unflatten_device_tree().
>
> Well, I wanted to avoid that, because it made the ordering requirements i=
n the file more nasty
> and it makes the #ifdefs more complex.

Shouldn't be.  The #ifdefs are trivial (once you add the new CONFIG
symbol), and there are only two references to
__unflatten_device_tree().

Cheers,
g.
