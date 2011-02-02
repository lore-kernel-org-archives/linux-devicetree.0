From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: FW: [PATCH v2 4/6] arm/dt: probe for platforms via the device
 tree
Date: Tue, 1 Feb 2011 23:21:11 -0700
Message-ID: <20110202062111.GC16543@angua.secretlab.ca>
References: <fba2dfb3-3d84-4db0-a765-ad252bdab3ea@VA3EHSMHS021.ehs.local>
 <AANLkTim=+Oa=JjrvzR+XYgNm_YSjGVtwP76W_TNODJ5M@mail.gmail.com>
 <7f92c231-05d4-4b3c-a8e2-8cf241d0c17b@VA3EHSMHS028.ehs.local>
 <AANLkTi=O6zOO+nx3gdVoDB2Q6rD+gRMyrvO04XdgxXtW@mail.gmail.com>
 <c55eb92d-bca0-4047-bbf9-7d532e37154d@VA3EHSMHS029.ehs.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Description: evicetree-discuss@lists.ozlabs.org,evicetree-discuss@lists.ozlabs.org,
Content-Disposition: inline
In-Reply-To: <c55eb92d-bca0-4047-bbf9-7d532e37154d@VA3EHSMHS029.ehs.local>
Sender: linux-kernel-owner@vger.kernel.org
To: John Linn <John.Linn@xilinx.com>
Cc: nicolas.pitre@linaro.org, Russell King <linux@arm.linux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, buytenh@wantstofly.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
List-Id: devicetree@vger.kernel.org

[restored cc: list]

On Tue, Feb 01, 2011 at 08:11:15AM -0700, John Linn wrote:
> OK, I see your changes don't really help the problem with device
> trees up higher.
>=20
> The problem is that in setup_machine_fdt the kernel can't get to the
> memory where the device tree is located if it's up higher.

No, there is another patch to solve that problem from Rob Herring.
I've not yet picked it up into my tree, but I will be doing so soon.
=46or now the dtb needs to be located inside the first 16k of ram.

However, it can no longer be based at 0 either.  I discovered that if
the dt is based at zero, then the kernel is unable to tell the
different between no atags/dtb passed and a dtb passed at physical
address 0.  At the very least it needs to be offset about 16 bytes.
Since it is common to put atags at address 0x100, it is also
reasonable to use 0x100 as the dtb base address too.

This problem doesn't exist for machines with ram based at physical
address !=3D 0.

Sorry I wasn't clear when I posted this.  There is still a bit of flux
to get the interface correct and I accidentally glossed over this
detail.

> The new stuff you added doesn't run early enough to take care of this=
 problem.

The problem I was trying to solve is that I was seeing device tree
corruption later in the boot process, but it now seems that I might
have misdiagnosed it.  I'm still investigation, but I may end up
reverting the memblock_reserve() change.

>=20
> I probably should have reviewed the patches instead of testing as I
> would have realized that.
>=20
> I'm looking to see if I can understand how to help the problem.
>=20
> Should I really just respond to the mailing list instead of this
> back channel?  I don't know good behavior from bad sometimes.

Yes, please feel totally free to respond on the mailing list (I went
ahead and restored the cc list on this reply).  Just remember to
bottom post when replying on-list.

g.

>=20
> > -----Original Message-----
> > From: John Linn
> > Sent: Monday, January 31, 2011 5:53 PM
> > To: John Linn; 'Grant Likely'
> > Subject: RE: FW: [PATCH v2 4/6] arm/dt: probe for platforms via the=
 device tree
> >=20
> > Weird, got it to work with dtb at 0x1000, but not anywhere else. Ha=
ve tried 0x1000000 and 0x600000
> > without success.
> >=20
> > Seems to be stopped in exceptions when I look at PC, haven't tried =
to debug yet, but looks like the
> > same problem to me.
> >=20
> > Did you have luck with your testing, maybe I'm doing something wron=
g.
> >=20
> > > -----Original Message-----
> > > From: John Linn
> > > Sent: Monday, January 31, 2011 5:28 PM
> > > To: John Linn; 'Grant Likely'
> > > Subject: RE: FW: [PATCH v2 4/6] arm/dt: probe for platforms via t=
he device tree
> > >
> > > You forgot to tell me that I can no longer have a device tree at =
address 0 which was previously
> > > working.
> > >
> > > That new check for a value of 0 for the address make it's not wor=
k anymore.
> > >
> > > Is there a reason for that?  Seems overkill since there's a magic=
 value already. Maybe someone made
> > > you add that.
> > >
> > > Anyway, now it's starting to work again after I hacked out that c=
heck. I'll put it back in and test
> > at
> > > non-zero locations.
> > >
> > >
> > > > -----Original Message-----
> > > > From: John Linn
> > > > Sent: Monday, January 31, 2011 4:50 PM
> > > > To: 'Grant Likely'
> > > > Subject: RE: FW: [PATCH v2 4/6] arm/dt: probe for platforms via=
 the device tree
> > > >
> > > > Very odd, it's not finding the device tree at all when it boots=
=2E
> > > >
> > > > Have you seen anything like that?
> > > >
> > > > Still debugging it.
> > > >
> > > > > -----Original Message-----
> > > > > From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] On B=
ehalf Of Grant Likely
> > > > > Sent: Monday, January 31, 2011 2:58 PM
> > > > > To: John Linn
> > > > > Subject: Re: FW: [PATCH v2 4/6] arm/dt: probe for platforms v=
ia the device tree
> > > > >
> > > > > On Mon, Jan 31, 2011 at 2:42 PM, John Linn <John.Linn@xilinx.=
com> wrote:
> > > > > >> -----Original Message-----
> > > > > >> From: glikely@secretlab.ca [mailto:glikely@secretlab.ca] O=
n Behalf Of Grant Likely
> > > > > >> Sent: Monday, January 31, 2011 2:11 PM
> > > > > >> To: John Linn
> > > > > >> Subject: Re: FW: [PATCH v2 4/6] arm/dt: probe for platform=
s via the device tree
> > > > > >>
> > > > > >> On Mon, Jan 31, 2011 at 2:08 PM, John Linn <John.Linn@xili=
nx.com> wrote:
> > > > > >> > I'm trying to think what's the easiest way for me to ret=
est.
> > > > > >> >
> > > > > >> > I have a branch with 2.6.38-rc1 then your tree merged, t=
hen a couple commits of my own on
> > > top.
> > > > > >> >
> > > > > >> > Are these all in your tree?
> > > > > >>
> > > > > >> If you're based on devicetree/arm, then you should be able=
 to just
> > > > > >> merge it again to get the changes. =A0I haven't rebased th=
at branch. =A0In
> > > > > >> fact, the top commit on devicetree/arm will show you the e=
xact diff
> > > > > >> between this series and the previous version.
> > > > > >
> > > > > > Unfortunately moving to 2.6.38-rc2 breaks some stuff. I was=
 surprised but there's still quite
> > a
> > > > bit
> > > > > > of change from rc1 to rc2.
> > > > > >
> > > > > > Still trying to see what all is broken. They moved serial d=
rivers under tty for one thing.
> > > > >
> > > > > You could also directly apply the patches on top of 2.6.38-rc=
1.  That
> > > > > should work too.
> > > > >
> > > > > g.
> > > > >
> > > > > >
> > > > > > -- John
> > > > > >
> > > > > >>
> > > > > >> > Should I retest the whole set of v2 patches or just the =
one the one that was problem?
> > > > > >>
> > > > > >> The whole tree.
> > > > > >>
> > > > > >> Thanks,
> > > > > >> g.
> > > > > >>
> > > > > >> >
> > > > > >> >> -----Original Message-----
> > > > > >> >> From: Grant Likely [mailto:glikely@secretlab.ca] On Beh=
alf Of Grant Likely
> > > > > >> >> Sent: Monday, January 31, 2011 2:04 PM
> > > > > >> >> To: nicolas.pitre@linaro.org; Russell King; Catalin Mar=
inas; devicetree-
> > > > > discuss@lists.ozlabs.org;
> > > > > >> >> linux-kernel@vger.kernel.org; buytenh@wantstofly.org; O=
lof Johansson; John Linn; linux-
> > arm-
> > > > > >> >> kernel@lists.infradead.org
> > > > > >> >> Subject: [PATCH v2 4/6] arm/dt: probe for platforms via=
 the device tree
> > > > > >> >>
> > > > > >> >> If a dtb is passed to the kernel then the kernel needs =
to iterate
> > > > > >> >> through compiled-in mdescs looking for one that matches=
 and move the
> > > > > >> >> dtb data to a safe location before it gets accidentally=
 overwritten by
> > > > > >> >> the kernel.
> > > > > >> >>
> > > > > >> >> This patch creates a new function, setup_machine_fdt() =
which is
> > > > > >> >> analogous to the setup_machine_atags() created in the p=
revious patch.
> > > > > >> >> It does all the early setup needed to use a device tree=
 machine
> > > > > >> >> description. =A0It also creates arm_unflatten_device_tr=
ee() which copies
> > > > > >> >> the dtb into an allocated buffer and unflattens it into=
 the live-tree
> > > > > >> >> representation.
> > > > > >> >>
> > > > > >> >> v2: Changed to save the dtb by copying into an allocate=
d buffer.
> > > > > >> >> =A0 =A0 - Since the dtb will very likely be passed in t=
he first 16k of ram
> > > > > >> >> =A0 =A0 =A0 where the interrupt vectors live, memblock_=
reserve() is
> > > > > >> >> =A0 =A0 =A0 insufficient to protect the dtb data.
> > > > > >> >> [based on work originally written by Jeremy Kerr <jerem=
y.kerr@canonical.com>]
> > > > > >> >> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
> > > > > >> >> ---
> > > > > >> >> =A0arch/arm/include/asm/mach/arch.h | =A0 =A02 +
> > > > > >> >> =A0arch/arm/include/asm/prom.h =A0 =A0 =A0| =A0 11 ++++=
+
> > > > > >> >> =A0arch/arm/include/asm/setup.h =A0 =A0 | =A0 =A01
> > > > > >> >> =A0arch/arm/kernel/devtree.c =A0 =A0 =A0 =A0| =A0 87 ++=
++++++++++++++++++++++++++++++++++++
> > > > > >> >> =A0arch/arm/kernel/setup.c =A0 =A0 =A0 =A0 =A0| =A0 10 =
+++-
> > > > > >> >> =A0arch/arm/mm/init.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A08 +++
> > > > > >> >> =A06 files changed, 117 insertions(+), 2 deletions(-)
> > > > > >> >>
> > > > > >> >> diff --git a/arch/arm/include/asm/mach/arch.h b/arch/ar=
m/include/asm/mach/arch.h
> > > > > >> >> index 3a0893a..2ed24e7 100644
> > > > > >> >> --- a/arch/arm/include/asm/mach/arch.h
> > > > > >> >> +++ b/arch/arm/include/asm/mach/arch.h
> > > > > >> >> @@ -22,6 +22,8 @@ struct machine_desc {
> > > > > >> >> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0nr; =A0=
 =A0 =A0 =A0 =A0 =A0 /* architecture number =A0*/
> > > > > >> >> =A0 =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0*name=
; =A0 =A0 =A0 =A0 =A0/* architecture name =A0 =A0*/
> > > > > >> >> =A0 =A0 =A0 unsigned long =A0 =A0 =A0 =A0 =A0 boot_para=
ms; =A0 =A0/* tagged list =A0 =A0 =A0 =A0 =A0*/
> > > > > >> >> + =A0 =A0 const char =A0 =A0 =A0 =A0 =A0 =A0 =A0**dt_co=
mpat; =A0 =A0/* array of device tree
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* 'compatible' strings */
> > > > > >> >>
> > > > > >> >> =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0nr_irqs=
; =A0 =A0 =A0 =A0/* number of IRQs */
> > > > > >> >>
> > > > > >> >> diff --git a/arch/arm/include/asm/prom.h b/arch/arm/inc=
lude/asm/prom.h
> > > > > >> >> index 8f1037f..6ba62a8 100644
> > > > > >> >> --- a/arch/arm/include/asm/prom.h
> > > > > >> >> +++ b/arch/arm/include/asm/prom.h
> > > > > >> >> @@ -21,5 +21,16 @@ static inline void irq_dispose_mappi=
ng(unsigned int virq)
> > > > > >> >> =A0 =A0 =A0 return;
> > > > > >> >> =A0}
> > > > > >> >>
> > > > > >> >> +extern void arm_unflatten_device_tree(void);
> > > > > >> >> +extern struct machine_desc *setup_machine_fdt(unsigned=
 int dt_phys);
> > > > > >> >> +
> > > > > >> >> +#else /* CONFIG_OF */
> > > > > >> >> +
> > > > > >> >> +static void arm_unflatten_device_tree(void) { }
> > > > > >> >> +static inline struct machine_desc *setup_machine_fdt(u=
nsigned int dt_phys)
> > > > > >> >> +{
> > > > > >> >> + =A0 =A0 return NULL;
> > > > > >> >> +}
> > > > > >> >> +
> > > > > >> >> =A0#endif /* CONFIG_OF */
> > > > > >> >> =A0#endif /* ASMARM_PROM_H */
> > > > > >> >> diff --git a/arch/arm/include/asm/setup.h b/arch/arm/in=
clude/asm/setup.h
> > > > > >> >> index 06c4d0e..1cec82a 100644
> > > > > >> >> --- a/arch/arm/include/asm/setup.h
> > > > > >> >> +++ b/arch/arm/include/asm/setup.h
> > > > > >> >> @@ -222,6 +222,7 @@ extern struct meminfo meminfo;
> > > > > >> >> =A0#define bank_phys_size(bank) (bank)->size
> > > > > >> >>
> > > > > >> >> =A0extern int arm_add_memory(unsigned long start, unsig=
ned long size);
> > > > > >> >> +extern char cmd_line[COMMAND_LINE_SIZE];
> > > > > >> >>
> > > > > >> >> =A0#endif =A0/* =A0__KERNEL__ =A0*/
> > > > > >> >>
> > > > > >> >> diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kerne=
l/devtree.c
> > > > > >> >> index ac48da2..07b75bb 100644
> > > > > >> >> --- a/arch/arm/kernel/devtree.c
> > > > > >> >> +++ b/arch/arm/kernel/devtree.c
> > > > > >> >> @@ -21,6 +21,7 @@
> > > > > >> >>
> > > > > >> >> =A0#include <asm/setup.h>
> > > > > >> >> =A0#include <asm/page.h>
> > > > > >> >> +#include <asm/mach/arch.h>
> > > > > >> >>
> > > > > >> >> =A0void __init early_init_dt_add_memory_arch(u64 base, =
u64 size)
> > > > > >> >> =A0{
> > > > > >> >> @@ -45,3 +46,89 @@ unsigned int irq_create_of_mapping(s=
truct device_node *controller,
> > > > > >> >> =A0 =A0 =A0 return intspec[0];
> > > > > >> >> =A0}
> > > > > >> >> =A0EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> > > > > >> >> +
> > > > > >> >> +extern struct machine_desc __arch_info_begin, __arch_i=
nfo_end;
> > > > > >> >> +
> > > > > >> >> +/**
> > > > > >> >> + * arm_unflatten_device_tree - Copy dtb into a safe ar=
ea and unflatten it.
> > > > > >> >> + *
> > > > > >> >> + * Copies the dtb out of initial memory and into an al=
located block so that
> > > > > >> >> + * it doesn't get overwritten by the kernel and then u=
nflatten it into the
> > > > > >> >> + * live tree representation.
> > > > > >> >> + */
> > > > > >> >> +void __init arm_unflatten_device_tree(void)
> > > > > >> >> +{
> > > > > >> >> + =A0 =A0 struct boot_param_header *devtree;
> > > > > >> >> + =A0 =A0 u32 dtb_size;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 if (!initial_boot_params)
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 return;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 /* Save the dtb to an allocated buffer */
> > > > > >> >> + =A0 =A0 dtb_size =3D be32_to_cpu(initial_boot_params-=
>totalsize);
> > > > > >> >> + =A0 =A0 devtree =3D early_init_dt_alloc_memory_arch(d=
tb_size, SZ_4K);
> > > > > >> >> + =A0 =A0 if (!devtree) {
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk("Unable to allocate me=
mory for device tree\n");
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 while(1);
> > > > > >> >> + =A0 =A0 }
> > > > > >> >> + =A0 =A0 pr_info("relocating device tree from 0x%p to =
0x%p, length 0x%x\n",
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 initial_boot_params, devtree,=
 dtb_size);
> > > > > >> >> + =A0 =A0 memmove(devtree, initial_boot_params, dtb_siz=
e);
> > > > > >> >> + =A0 =A0 initial_boot_params =3D devtree;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 unflatten_device_tree();
> > > > > >> >> +}
> > > > > >> >> +
> > > > > >> >> +/**
> > > > > >> >> + * setup_machine_fdt - Machine setup when an dtb was p=
assed to the kernel
> > > > > >> >> + * @dt_phys: physical address of dt blob
> > > > > >> >> + *
> > > > > >> >> + * If a dtb was passed to the kernel in r2, then use i=
t to choose the
> > > > > >> >> + * correct machine_desc and to setup the system.
> > > > > >> >> + */
> > > > > >> >> +struct machine_desc * __init setup_machine_fdt(unsigne=
d int dt_phys)
> > > > > >> >> +{
> > > > > >> >> + =A0 =A0 struct boot_param_header *devtree =3D phys_to=
_virt(dt_phys);
> > > > > >> >> + =A0 =A0 struct machine_desc *mdesc, *mdesc_best =3D N=
ULL;
> > > > > >> >> + =A0 =A0 unsigned int score, mdesc_score =3D ~1;
> > > > > >> >> + =A0 =A0 unsigned long dt_root;
> > > > > >> >> + =A0 =A0 const char *model;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 /* check device tree validity */
> > > > > >> >> + =A0 =A0 if (!dt_phys || be32_to_cpu(devtree->magic) !=
=3D OF_DT_HEADER)
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 return NULL;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 /* Search the mdescs for the 'best' compatibl=
e value match */
> > > > > >> >> + =A0 =A0 initial_boot_params =3D devtree;
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 dt_root =3D of_get_flat_dt_root();
> > > > > >> >> + =A0 =A0 for (mdesc =3D &__arch_info_begin; mdesc < &_=
_arch_info_end; mdesc++) {
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 score =3D of_flat_dt_match(dt=
_root, mdesc->dt_compat);
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 if (score > 0 && score < mdes=
c_score) {
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdesc_best =3D=
 mdesc;
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mdesc_score =3D=
 score;
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 }
> > > > > >> >> + =A0 =A0 }
> > > > > >> >> + =A0 =A0 if (!mdesc_best) {
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 printk("Machine not supported=
, unable to continue.\n");
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 while (1);
> > > > > >> >> + =A0 =A0 }
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 model =3D of_get_flat_dt_prop(dt_root, "model=
", NULL);
> > > > > >> >> + =A0 =A0 if (!model)
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 model =3D of_get_flat_dt_prop=
(dt_root, "compatible", NULL);
> > > > > >> >> + =A0 =A0 if (!model)
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 model =3D "<unknown>";
> > > > > >> >> + =A0 =A0 pr_info("Machine: %s, model: %s\n", mdesc_bes=
t->name, model);
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 /* Retrieve various information from the /cho=
sen node */
> > > > > >> >> + =A0 =A0 of_scan_flat_dt(early_init_dt_scan_chosen, NU=
LL);
> > > > > >> >> + =A0 =A0 /* Initialize {size,address}-cells info */
> > > > > >> >> + =A0 =A0 of_scan_flat_dt(early_init_dt_scan_root, NULL=
);
> > > > > >> >> + =A0 =A0 /* Setup memory, calling early_init_dt_add_me=
mory_arch */
> > > > > >> >> + =A0 =A0 of_scan_flat_dt(early_init_dt_scan_memory, NU=
LL);
> > > > > >> >> + =A0 =A0 /* Save command line for /proc/cmdline =A0*/
> > > > > >> >> + =A0 =A0 strlcpy(boot_command_line, cmd_line, COMMAND_=
LINE_SIZE);
> > > > > >> >> +
> > > > > >> >> + =A0 =A0 return mdesc_best;
> > > > > >> >> +}
> > > > > >> >> diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/=
setup.c
> > > > > >> >> index cbc1836..68e0204 100644
> > > > > >> >> --- a/arch/arm/kernel/setup.c
> > > > > >> >> +++ b/arch/arm/kernel/setup.c
> > > > > >> >> @@ -20,6 +20,7 @@
> > > > > >> >> =A0#include <linux/screen_info.h>
> > > > > >> >> =A0#include <linux/init.h>
> > > > > >> >> =A0#include <linux/kexec.h>
> > > > > >> >> +#include <linux/of_fdt.h>
> > > > > >> >> =A0#include <linux/crash_dump.h>
> > > > > >> >> =A0#include <linux/root_dev.h>
> > > > > >> >> =A0#include <linux/cpu.h>
> > > > > >> >> @@ -42,6 +43,7 @@
> > > > > >> >> =A0#include <asm/cachetype.h>
> > > > > >> >> =A0#include <asm/tlbflush.h>
> > > > > >> >>
> > > > > >> >> +#include <asm/prom.h>
> > > > > >> >> =A0#include <asm/mach/arch.h>
> > > > > >> >> =A0#include <asm/mach/irq.h>
> > > > > >> >> =A0#include <asm/mach/time.h>
> > > > > >> >> @@ -125,7 +127,7 @@ EXPORT_SYMBOL(elf_platform);
> > > > > >> >>
> > > > > >> >> =A0static const char *cpu_name;
> > > > > >> >> =A0static const char *machine_name;
> > > > > >> >> -static char __initdata cmd_line[COMMAND_LINE_SIZE];
> > > > > >> >> +char cmd_line[COMMAND_LINE_SIZE];
> > > > > >> >> =A0struct machine_desc *machine_desc __initdata;
> > > > > >> >>
> > > > > >> >> =A0static char default_command_line[COMMAND_LINE_SIZE] =
__initdata =3D CONFIG_CMDLINE;
> > > > > >> >> @@ -838,7 +840,9 @@ void __init setup_arch(char **cmdli=
ne_p)
> > > > > >> >> =A0 =A0 =A0 unwind_init();
> > > > > >> >>
> > > > > >> >> =A0 =A0 =A0 setup_processor();
> > > > > >> >> - =A0 =A0 mdesc =3D setup_machine_tags(machine_arch_typ=
e);
> > > > > >> >> + =A0 =A0 mdesc =3D setup_machine_fdt(__atags_pointer);
> > > > > >> >> + =A0 =A0 if (!mdesc)
> > > > > >> >> + =A0 =A0 =A0 =A0 =A0 =A0 mdesc =3D setup_machine_tags(=
machine_arch_type);
> > > > > >> >> =A0 =A0 =A0 machine_desc =3D mdesc;
> > > > > >> >> =A0 =A0 =A0 machine_name =3D mdesc->name;
> > > > > >> >>
> > > > > >> >> @@ -859,6 +863,8 @@ void __init setup_arch(char **cmdli=
ne_p)
> > > > > >> >> =A0 =A0 =A0 paging_init(mdesc);
> > > > > >> >> =A0 =A0 =A0 request_standard_resources(mdesc);
> > > > > >> >>
> > > > > >> >> + =A0 =A0 arm_unflatten_device_tree();
> > > > > >> >> +
> > > > > >> >> =A0#ifdef CONFIG_SMP
> > > > > >> >> =A0 =A0 =A0 if (is_smp())
> > > > > >> >> =A0 =A0 =A0 =A0 =A0 =A0 =A0 smp_init_cpus();
> > > > > >> >> diff --git a/arch/arm/mm/init.c b/arch/arm/mm/init.c
> > > > > >> >> index 5164069..62ff2e8 100644
> > > > > >> >> --- a/arch/arm/mm/init.c
> > > > > >> >> +++ b/arch/arm/mm/init.c
> > > > > >> >> @@ -71,6 +71,14 @@ static int __init parse_tag_initrd2(=
const struct tag *tag)
> > > > > >> >>
> > > > > >> >> =A0__tagtable(ATAG_INITRD2, parse_tag_initrd2);
> > > > > >> >>
> > > > > >> >> +#ifdef CONFIG_OF_FLATTREE
> > > > > >> >> +void __init early_init_dt_setup_initrd_arch(unsigned l=
ong start, unsigned long end)
> > > > > >> >> +{
> > > > > >> >> + =A0 =A0 phys_initrd_start =3D start;
> > > > > >> >> + =A0 =A0 phys_initrd_size =3D end - start + 1;
> > > > > >> >> +}
> > > > > >> >> +#endif /* CONFIG_OF_FLATTREE */
> > > > > >> >> +
> > > > > >> >> =A0/*
> > > > > >> >> =A0 * This keeps memory configuration data used by a co=
uple memory
> > > > > >> >> =A0 * initialization functions, as well as show_mem() f=
or the skipping
> > > > > >> >>
> > > > > >> >
> > > > > >> >
> > > > > >> > This email and any attachments are intended for the sole=
 use of the named recipient(s) and
> > > > > >> contain(s) confidential information that may be proprietar=
y, privileged or copyrighted under
> > > > > >> applicable law. If you are not the intended recipient, do =
not read, copy, or forward this
> > email
> > > > > >> message or any attachments. Delete this email message and =
any attachments immediately.
> > > > > >> >
> > > > > >>
> > > > > >>
> > > > > >>
> > > > > >> --
> > > > > >> Grant Likely, B.Sc., P.Eng.
> > > > > >> Secret Lab Technologies Ltd.
> > > > > >
> > > > > >
> > > > > > This email and any attachments are intended for the sole us=
e of the named recipient(s) and
> > > > > contain(s) confidential information that may be proprietary, =
privileged or copyrighted under
> > > > > applicable law. If you are not the intended recipient, do not=
 read, copy, or forward this email
> > > > > message or any attachments. Delete this email message and any=
 attachments immediately.
> > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > > >
> > > > > --
> > > > > Grant Likely, B.Sc., P.Eng.
> > > > > Secret Lab Technologies Ltd.
>=20
>=20
> This email and any attachments are intended for the sole use of the n=
amed recipient(s) and contain(s) confidential information that may be p=
roprietary, privileged or copyrighted under applicable law. If you are =
not the intended recipient, do not read, copy, or forward this email me=
ssage or any attachments. Delete this email message and any attachments=
 immediately.
>=20
>=20
