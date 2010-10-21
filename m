From: Andres Salomon <dilinger@queued.net>
Subject: Re: [PATCH 5/5] x86: OLPC: add OLPC device-tree support
Date: Thu, 21 Oct 2010 14:17:52 -0700
Message-ID: <20101021141752.7f3f7bf2@queued.net>
References: <20101010020626.102437f5@debxo>
	<20101011041312.GF23588@angua.secretlab.ca>
	<AANLkTikg-HOM3EVQiPvuDahLuUWvhg_VeBBXLtJu6Tzo@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <sparclinux-owner@vger.kernel.org>
In-Reply-To: <AANLkTikg-HOM3EVQiPvuDahLuUWvhg_VeBBXLtJu6Tzo@mail.gmail.com>
Sender: sparclinux-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: devicetree-discuss@lists.ozlabs.org, David Miller <davem@davemloft.net>, sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>
List-Id: devicetree@vger.kernel.org

On Wed, 20 Oct 2010 12:56:21 -0600
Grant Likely <grant.likely@secretlab.ca> wrote:

> On Sun, Oct 10, 2010 at 10:13 PM, Grant Likely
> <grant.likely@secretlab.ca> wrote:
> > On Sun, Oct 10, 2010 at 02:06:26AM -0700, Andres Salomon wrote:
> >>
> >> Make use of PROC_DEVICETREE to export the tree, and sparc's
> >> PROMTREE code to call into OLPC's Open Firmware to build the tree.
> >>
> >> Signed-off-by: Andres Salomon <dilinger@queued.net>
> >
> > Holding off on this one until I hear from the x86 maintainers
> > [cc'd].
>=20
> Oops, and it appears that patch breaks the build on other
> architectures when CONFIG_OF is enabled and CONFIG_PROMTREE is not du=
e
> to how of_pdt_init_devicetree is defined.
>=20
> g.
>=20

D'oh.  Do you have any preferences for what we should be using here?
Generic OF hook?  PDT-specific hook?  Forget the hook and just call
a PDT function?  I'm leaning towards that last option.


> >
> > g.
> >
> >> ---
> >> =C2=A0arch/x86/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| =C2=A0 =C2=A02 +
> >> =C2=A0arch/x86/include/asm/olpc_ofw.h | =C2=A0 =C2=A04 +
> >> =C2=A0arch/x86/include/asm/prom.h =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> >> =C2=A0arch/x86/kernel/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0=
 =C2=A01 +
> >> =C2=A0arch/x86/kernel/olpc_ofw.c =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0=
8 ++
> >> =C2=A0arch/x86/kernel/olpc_prom.c =C2=A0 =C2=A0 | =C2=A0152
> >> +++++++++++++++++++++++++++++++++++++++ drivers/of/pdt.c
> >> =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 + fs/proc/proc_devtree.c =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A04 +
> >> =C2=A0include/linux/of_pdt.h =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=
=A0 =C2=A01 +
> >> =C2=A09 files changed, 175 insertions(+), 0 deletions(-)
> >> =C2=A0create mode 100644 arch/x86/include/asm/prom.h
> >> =C2=A0create mode 100644 arch/x86/kernel/olpc_prom.c
> >>
> >> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> >> index cea0cd9..7d4ef72 100644
> >> --- a/arch/x86/Kconfig
> >> +++ b/arch/x86/Kconfig
> >> @@ -2069,6 +2069,8 @@ config OLPC_OPENFIRMWARE
> >> =C2=A0 =C2=A0 =C2=A0 bool "Support for OLPC's Open Firmware"
> >> =C2=A0 =C2=A0 =C2=A0 depends on !X86_64 && !X86_PAE
> >> =C2=A0 =C2=A0 =C2=A0 default y if OLPC
> >> + =C2=A0 =C2=A0 select OF
> >> + =C2=A0 =C2=A0 select OF_PROMTREE
> >> =C2=A0 =C2=A0 =C2=A0 help
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 This option adds support for the imple=
mentation of Open
> >> Firmware that is used on the OLPC XO-1 Children's Machine.
> >> diff --git a/arch/x86/include/asm/olpc_ofw.h
> >> b/arch/x86/include/asm/olpc_ofw.h index 08fde47..13075df 100644
> >> --- a/arch/x86/include/asm/olpc_ofw.h
> >> +++ b/arch/x86/include/asm/olpc_ofw.h
> >> @@ -28,4 +28,8 @@ static inline void setup_olpc_ofw_pgd(void) { }
> >>
> >> =C2=A0#endif /* !CONFIG_OLPC_OPENFIRMWARE */
> >>
> >> +#ifdef CONFIG_PROC_DEVICETREE
> >> +extern void olpc_prom_build_devicetree(void);
> >> +#endif /* CONFIG_PROC_DEVICETREE */
> >> +
> >> =C2=A0#endif /* _ASM_X86_OLPC_OFW_H */
> >> diff --git a/arch/x86/include/asm/prom.h
> >> b/arch/x86/include/asm/prom.h new file mode 100644
> >> index 0000000..b4ec95f
> >> --- /dev/null
> >> +++ b/arch/x86/include/asm/prom.h
> >> @@ -0,0 +1 @@
> >> +/* dummy prom.h; here to make linux/of.h's #includes happy */
> >> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> >> index fedf32a..ced0c9a 100644
> >> --- a/arch/x86/kernel/Makefile
> >> +++ b/arch/x86/kernel/Makefile
> >> @@ -107,6 +107,7 @@ scx200-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0+=3D scx200_32.o
> >>
> >> =C2=A0obj-$(CONFIG_OLPC) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D o=
lpc.o
> >> =C2=A0obj-$(CONFIG_OLPC_OPENFIRMWARE) =C2=A0 =C2=A0 =C2=A0+=3D olp=
c_ofw.o
> >> +obj-$(CONFIG_PROC_DEVICETREE) =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D olp=
c_prom.o
> >> =C2=A0obj-$(CONFIG_X86_MRST) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 +=3D mrst.o
> >>
> >> =C2=A0microcode-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D microcode_core.o
> >> diff --git a/arch/x86/kernel/olpc_ofw.c
> >> b/arch/x86/kernel/olpc_ofw.c index 3218aa7..6c4d243 100644
> >> --- a/arch/x86/kernel/olpc_ofw.c
> >> +++ b/arch/x86/kernel/olpc_ofw.c
> >> @@ -1,5 +1,7 @@
> >> =C2=A0#include <linux/kernel.h>
> >> =C2=A0#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_pdt.h>
> >> =C2=A0#include <linux/init.h>
> >> =C2=A0#include <asm/page.h>
> >> =C2=A0#include <asm/setup.h>
> >> @@ -38,6 +40,12 @@ void __init setup_olpc_ofw_pgd(void)
> >> =C2=A0 =C2=A0 =C2=A0 /* implicit optimization barrier here due to =
uninline
> >> function return */
> >>
> >> =C2=A0 =C2=A0 =C2=A0 early_iounmap(base, sizeof(olpc_ofw_pgd) * PT=
RS_PER_PGD);
> >> +
> >> +#ifdef CONFIG_PROC_DEVICETREE
> >> + =C2=A0 =C2=A0 /* OFW set up succesfully; use it for the device t=
ree */
> >> + =C2=A0 =C2=A0 of_pdt_init_devicetree =3D olpc_prom_build_devicet=
ree;
> >> +#endif
> >> +
> >> =C2=A0}
> >>
> >> =C2=A0int __olpc_ofw(const char *name, int nr_args, const void **a=
rgs,
> >> int nr_res, diff --git a/arch/x86/kernel/olpc_prom.c
> >> b/arch/x86/kernel/olpc_prom.c new file mode 100644
> >> index 0000000..e2ecaf2
> >> --- /dev/null
> >> +++ b/arch/x86/kernel/olpc_prom.c
> >> @@ -0,0 +1,152 @@
> >> +/*
> >> + * olpc_prom.c: OLPC-specific OFW device tree support code.
> >> + *
> >> + * Paul Mackerras =C2=A0 =C2=A0August 1996.
> >> + * Copyright (C) 1996-2005 Paul Mackerras.
> >> + *
> >> + * =C2=A0Adapted for 64bit PowerPC by Dave Engebretsen and Peter
> >> Bergner.
> >> + * =C2=A0 =C2=A0{engebret|bergner}@us.ibm.com
> >> + *
> >> + * =C2=A0Adapted for sparc by David S. Miller davem@davemloft.net
> >> + * =C2=A0Adapted for x86/OLPC by Andres Salomon <dilinger@queued.=
net>
> >> + *
> >> + * =C2=A0 =C2=A0 =C2=A0This program is free software; you can red=
istribute it
> >> and/or
> >> + * =C2=A0 =C2=A0 =C2=A0modify it under the terms of the GNU Gener=
al Public
> >> License
> >> + * =C2=A0 =C2=A0 =C2=A0as published by the Free Software Foundati=
on; either
> >> version
> >> + * =C2=A0 =C2=A0 =C2=A02 of the License, or (at your option) any =
later version.
> >> + */
> >> +
> >> +#include <linux/kernel.h>
> >> +#include <linux/module.h>
> >> +#include <linux/errno.h>
> >> +#include <linux/slab.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_pdt.h>
> >> +#include <asm/olpc_ofw.h>
> >> +
> >> +static phandle __init olpc_prom_getsibling(phandle node)
> >> +{
> >> + =C2=A0 =C2=A0 const void *args[] =3D { (void *)node };
> >> + =C2=A0 =C2=A0 void *res[] =3D { &node };
> >> +
> >> + =C2=A0 =C2=A0 if (node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >> +
> >> + =C2=A0 =C2=A0 if (olpc_ofw("peer", args, res) || node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >> +
> >> + =C2=A0 =C2=A0 return node;
> >> +}
> >> +
> >> +static phandle __init olpc_prom_getchild(phandle node)
> >> +{
> >> + =C2=A0 =C2=A0 const void *args[] =3D { (void *)node };
> >> + =C2=A0 =C2=A0 void *res[] =3D { &node };
> >> +
> >> + =C2=A0 =C2=A0 if (node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >> +
> >> + =C2=A0 =C2=A0 if (olpc_ofw("child", args, res) || node =3D=3D -1=
) {
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("PROM: %s: fetc=
hing child failed!\n",
> >> __func__);
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;
> >> + =C2=A0 =C2=A0 }
> >> +
> >> + =C2=A0 =C2=A0 return node;
> >> +}
> >> +
> >> +static int __init olpc_prom_getproplen(phandle node, const char
> >> *prop) +{
> >> + =C2=A0 =C2=A0 const void *args[] =3D { (void *)node, prop };
> >> + =C2=A0 =C2=A0 int len;
> >> + =C2=A0 =C2=A0 void *res[] =3D { &len };
> >> +
> >> + =C2=A0 =C2=A0 if (node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> +
> >> + =C2=A0 =C2=A0 if (olpc_ofw("getproplen", args, res)) {
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("PROM: %s: getp=
roplen failed!\n", __func__);
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> + =C2=A0 =C2=A0 }
> >> +
> >> + =C2=A0 =C2=A0 return len;
> >> +}
> >> +
> >> +static int __init olpc_prom_getproperty(phandle node, const char
> >> *prop,
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 char *buf, int bufsize=
)
> >> +{
> >> + =C2=A0 =C2=A0 int plen;
> >> +
> >> + =C2=A0 =C2=A0 plen =3D olpc_prom_getproplen(node, prop);
> >> + =C2=A0 =C2=A0 if (plen > bufsize || plen < 1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> + =C2=A0 =C2=A0 else {
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const void *args[] =3D=
 { (void *)node, prop, buf,
> >> (void *)plen };
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 void *res[] =3D { &ple=
n };
> >> +
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (olpc_ofw("getprop"=
, args, res)) {
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 pr_err("PROM: %s: getprop failed!\n",
> >> __func__);
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -1;
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> >> + =C2=A0 =C2=A0 }
> >> +
> >> + =C2=A0 =C2=A0 return plen;
> >> +}
> >> +
> >> +static int __init olpc_prom_nextprop(phandle node, char *prev,
> >> char *buf) +{
> >> + =C2=A0 =C2=A0 const void *args[] =3D { (void *)node, prev, buf }=
;
> >> + =C2=A0 =C2=A0 int success;
> >> + =C2=A0 =C2=A0 void *res[] =3D { &success };
> >> +
> >> + =C2=A0 =C2=A0 buf[0] =3D '\0';
> >> +
> >> + =C2=A0 =C2=A0 if (node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> +
> >> + =C2=A0 =C2=A0 if (olpc_ofw("nextprop", args, res) || success !=3D=
 1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> +
> >> + =C2=A0 =C2=A0 return 0;
> >> +}
> >> +
> >> +static int __init olpc_prom_pkg2path(phandle node, char *buf,
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const int buflen, int =
*len)
> >> +{
> >> + =C2=A0 =C2=A0 const void *args[] =3D { (void *)node, buf, (void =
*)buflen };
> >> + =C2=A0 =C2=A0 void *res[] =3D { len };
> >> +
> >> + =C2=A0 =C2=A0 if (node =3D=3D -1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> +
> >> + =C2=A0 =C2=A0 if (olpc_ofw("package-to-path", args, res) || *len=
 < 1)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -1;
> >> +
> >> + =C2=A0 =C2=A0 return 0;
> >> +}
> >> +
> >> +void * __init prom_early_alloc(unsigned long size)
> >> +{
> >> + =C2=A0 =C2=A0 /* this is called late enough that we can alloc no=
rmally */
> >> + =C2=A0 =C2=A0 return kzalloc(size, GFP_KERNEL);
> >> +}
> >> +
> >> +static struct of_pdt_ops prom_olpc_ops __initdata =3D {
> >> + =C2=A0 =C2=A0 .nextprop =3D olpc_prom_nextprop,
> >> + =C2=A0 =C2=A0 .getproplen =3D olpc_prom_getproplen,
> >> + =C2=A0 =C2=A0 .getproperty =3D olpc_prom_getproperty,
> >> + =C2=A0 =C2=A0 .getchild =3D olpc_prom_getchild,
> >> + =C2=A0 =C2=A0 .getsibling =3D olpc_prom_getsibling,
> >> + =C2=A0 =C2=A0 .pkg2path =3D olpc_prom_pkg2path,
> >> +};
> >> +
> >> +void __init olpc_prom_build_devicetree(void)
> >> +{
> >> + =C2=A0 =C2=A0 phandle root;
> >> +
> >> + =C2=A0 =C2=A0 root =3D olpc_prom_getsibling(0);
> >> + =C2=A0 =C2=A0 if (root < 0) {
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("PROM: unable t=
o get root node from OFW!\n");
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> >> + =C2=A0 =C2=A0 }
> >> + =C2=A0 =C2=A0 of_pdt_build_devicetree(root, &prom_olpc_ops);
> >> +}
> >> diff --git a/drivers/of/pdt.c b/drivers/of/pdt.c
> >> index 28295d0..07e3daa 100644
> >> --- a/drivers/of/pdt.c
> >> +++ b/drivers/of/pdt.c
> >> @@ -29,6 +29,8 @@ static struct of_pdt_ops *of_pdt_prom_ops
> >> __initdata; void __initdata (*of_pdt_build_more)(struct
> >> device_node *dp, struct device_node ***nextp);
> >>
> >> +void __initdata (*of_pdt_init_devicetree)(void);
> >> +
> >> =C2=A0#if defined(CONFIG_SPARC)
> >> =C2=A0unsigned int of_pdt_unique_id __initdata;
> >>
> >> diff --git a/fs/proc/proc_devtree.c b/fs/proc/proc_devtree.c
> >> index d9396a4..9779039 100644
> >> --- a/fs/proc/proc_devtree.c
> >> +++ b/fs/proc/proc_devtree.c
> >> @@ -11,6 +11,7 @@
> >> =C2=A0#include <linux/stat.h>
> >> =C2=A0#include <linux/string.h>
> >> =C2=A0#include <linux/of.h>
> >> +#include <linux/of_pdt.h>
> >> =C2=A0#include <linux/module.h>
> >> =C2=A0#include <linux/slab.h>
> >> =C2=A0#include <asm/prom.h>
> >> @@ -228,6 +229,9 @@ void __init proc_device_tree_init(void)
> >> =C2=A0{
> >> =C2=A0 =C2=A0 =C2=A0 struct device_node *root;
> >>
> >> + =C2=A0 =C2=A0 if (of_pdt_init_devicetree)
> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 of_pdt_init_devicetree=
();
> >> +
> >> =C2=A0 =C2=A0 =C2=A0 proc_device_tree =3D proc_mkdir("device-tree"=
, NULL);
> >> =C2=A0 =C2=A0 =C2=A0 if (proc_device_tree =3D=3D NULL)
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> >> diff --git a/include/linux/of_pdt.h b/include/linux/of_pdt.h
> >> index c65a18a..5b29aef 100644
> >> --- a/include/linux/of_pdt.h
> >> +++ b/include/linux/of_pdt.h
> >> @@ -38,6 +38,7 @@ extern void *prom_early_alloc(unsigned long
> >> size);
> >>
> >> =C2=A0/* for building the device tree */
> >> =C2=A0extern void of_pdt_build_devicetree(phandle root_node, struc=
t
> >> of_pdt_ops *ops); +extern void (*of_pdt_init_devicetree)(void);
> >>
> >> =C2=A0extern void (*of_pdt_build_more)(struct device_node *dp,
> >> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_nod=
e ***nextp);
> >> --
> >> 1.5.6.5
> >>
> >
>=20
>=20
>=20
--
To unsubscribe from this list: send the line "unsubscribe sparclinux" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
