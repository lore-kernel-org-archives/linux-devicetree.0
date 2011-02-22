From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 09/11] x86/ioapic: Add OF bindings for IO-APIC
Date: Tue, 22 Feb 2011 14:14:08 -0700
Message-ID: <AANLkTi=ft_zmt3vfifdTwWq+vOs2Z88ztHOyM43DCsj6@mail.gmail.com>
References: <1298405266-1624-1-git-send-email-bigeasy@linutronix.de> <1298405266-1624-10-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1298405266-1624-10-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, sodaville@linutronix.de, devicetree-discuss@lists.ozlabs.org, x86@kernel.org, Dirk Brandewie <dirk.brandewie@gmail.com>
List-Id: devicetree@vger.kernel.org

On Tue, Feb 22, 2011 at 1:07 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:
> ioapic_xlate provides a translation from the information in device tr=
ee
> to ioapic related informations. This includes
> - obtaining hw irq which is the vector number "=3D> pin number + gsi"
> - obtaining type (level/edge/..)
> - programming this information into ioapic
>
> ioapic_add_ofnode adds an irq_domain based on informations from the d=
evice
> tree. This information (irq_domain) is required in order to map a dev=
ice to
> its proper interrupt controller.
>
> Cc: devicetree-discuss@lists.ozlabs.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dirk Brandewie <dirk.brandewie@gmail.com>
> ---
> =A0arch/x86/include/asm/io_apic.h | =A0 =A07 +++
> =A0arch/x86/include/asm/prom.h =A0 =A0| =A0 =A02 +
> =A0arch/x86/kernel/apic/io_apic.c | =A0 99 ++++++++++++++++++++++++++=
++++++++++++++
> =A0arch/x86/kernel/devicetree.c =A0 | =A0 13 +++++
> =A0arch/x86/kernel/irqinit.c =A0 =A0 =A0| =A0 =A06 ++
> =A05 files changed, 127 insertions(+), 0 deletions(-)
>
> diff --git a/arch/x86/include/asm/io_apic.h b/arch/x86/include/asm/io=
_apic.h
> index f327d38..fe88a73 100644
> --- a/arch/x86/include/asm/io_apic.h
> +++ b/arch/x86/include/asm/io_apic.h
> @@ -177,6 +177,13 @@ struct mp_ioapic_gsi{
> =A0 =A0 =A0 =A0u32 gsi_base;
> =A0 =A0 =A0 =A0u32 gsi_end;
> =A0};
> +#ifdef CONFIG_OF
> +struct mp_of_ioapic {
> + =A0 =A0 =A0 struct device_node *node;
> +};
> +extern struct mp_of_ioapic mp_of_ioapic[MAX_IO_APICS];
> +void __init ioapic_add_ofnode(struct device_node *np);
> +#endif
> =A0extern struct mp_ioapic_gsi =A0mp_gsi_routing[];
> =A0extern u32 gsi_top;
> =A0int mp_find_ioapic(u32 gsi);
> diff --git a/arch/x86/include/asm/prom.h b/arch/x86/include/asm/prom.=
h
> index 3e441b3..98b9a73 100644
> --- a/arch/x86/include/asm/prom.h
> +++ b/arch/x86/include/asm/prom.h
> @@ -26,6 +26,7 @@
> =A0extern int of_ioapic;
> =A0extern u64 initial_dtb;
> =A0extern void add_dtb(u64 data);
> +extern void x86_add_irq_domains(void);
> =A0void x86_dtb_find_config(void);
> =A0void x86_dtb_get_config(unsigned int unused);
> =A0void add_interrupt_host(struct irq_domain *ih);
> @@ -43,6 +44,7 @@ static inline struct device_node *pci_bus_to_OF_nod=
e(struct pci_bus *bus)
>
> =A0#else
> =A0static inline void add_dtb(u64 data) { }
> +static inline void x86_add_irq_domains(void) { }
> =A0static inline void x86_of_pci_init(void) { }
> =A0#define x86_dtb_find_config x86_init_noop
> =A0#define x86_dtb_get_config x86_init_uint_noop
> diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io=
_apic.c
> index ca9e2a3..c172452 100644
> --- a/arch/x86/kernel/apic/io_apic.c
> +++ b/arch/x86/kernel/apic/io_apic.c
> @@ -43,6 +43,7 @@
> =A0#include <linux/bootmem.h>
> =A0#include <linux/dmar.h>
> =A0#include <linux/hpet.h>
> +#include <linux/of_address.h>
>
> =A0#include <asm/idle.h>
> =A0#include <asm/io.h>
> @@ -60,6 +61,7 @@
> =A0#include <asm/irq_remapping.h>
> =A0#include <asm/hpet.h>
> =A0#include <asm/hw_irq.h>
> +#include <asm/irq_controller.h>
>
> =A0#include <asm/apic.h>
>
> @@ -88,6 +90,10 @@ int nr_ioapics;
> =A0/* IO APIC gsi routing info */
> =A0struct mp_ioapic_gsi =A0mp_gsi_routing[MAX_IO_APICS];
>
> +#ifdef CONFIG_OF
> +/* OF -> IO APIC lookup */
> +struct mp_of_ioapic mp_of_ioapic[MAX_IO_APICS];
> +#endif
> =A0/* The one past the highest gsi number used */
> =A0u32 gsi_top;
>
> @@ -4083,6 +4089,99 @@ void __init mp_register_ioapic(int id, u32 add=
ress, u32 gsi_base)
> =A0 =A0 =A0 =A0nr_ioapics++;
> =A0}
>
> +#ifdef CONFIG_OF
> +static int ioapic_xlate(struct irq_domain *id, const u32 *intspec, u=
32 intsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 u32 *out_hwirq, u32 *out_type)
> +{
> + =A0 =A0 =A0 u32 line;
> + =A0 =A0 =A0 u32 idx;
> + =A0 =A0 =A0 u32 type;
> + =A0 =A0 =A0 u32 trigger;
> + =A0 =A0 =A0 u32 polarity;
> + =A0 =A0 =A0 struct irq_cfg *cfg;
> + =A0 =A0 =A0 struct irq_desc *desc;
> +
> + =A0 =A0 =A0 if (intsize < 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> +
> + =A0 =A0 =A0 line =3D *intspec;
> + =A0 =A0 =A0 idx =3D (u32) id->priv;
> + =A0 =A0 =A0 *out_hwirq =3D line + mp_gsi_routing[idx].gsi_base;
> + =A0 =A0 =A0 if (intsize > 1) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 intspec++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 type =3D *intspec;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 switch (type) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 0:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_=
EDGE_RISING;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_EDGE=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 1:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_=
LEVEL_LOW;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_LEVE=
L;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 2:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_=
LEVEL_HIGH;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_LEVE=
L;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 3:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_=
EDGE_FALLING;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_EDGE=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;

This seems to beg for a lookup table.  :-)

But that can be changed later if you agree.

> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_=
NONE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_AUTO=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 };
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *out_type =3D IRQ_TYPE_NONE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 trigger =3D IOAPIC_AUTO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 polarity =3D 0;
> + =A0 =A0 =A0 }

Actually, if the irq specifier is invalid (both for the default case,
and the case where the size is too small), then this function should
flat out refuse to xlate the irq and complain loudly.  Force users to
provide good data.  Again, this can be fixed up with a followon patch.

> + =A0 =A0 =A0 /* And now tell the IO APIC to make the line ready */
> + =A0 =A0 =A0 desc =3D irq_to_desc_alloc_node(*out_hwirq, 0);
> + =A0 =A0 =A0 cfg =3D irq_cfg(*out_hwirq);
> + =A0 =A0 =A0 add_pin_to_irq_node(cfg, 0, idx, line);
> + =A0 =A0 =A0 /* make it edge by default, settype will update it */
> + =A0 =A0 =A0 setup_ioapic_irq(idx, line, *out_hwirq, cfg, trigger, p=
olarity);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +void __init ioapic_add_ofnode(struct device_node *np)
> +{
> + =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int ret;
> + =A0 =A0 =A0 struct resource r;
> +
> + =A0 =A0 =A0 ret =3D of_address_to_resource(np, 0, &r);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "Failed to obtain addre=
ss for %s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 np->ful=
l_name);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 for (i =3D 0; i < nr_ioapics; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (r.start =3D=3D mp_ioapics[i].apicad=
dr) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct irq_domain *id;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mp_of_ioapic[i].node =3D=
 np;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id =3D kzalloc(sizeof(*=
id), GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 BUG_ON(!id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id->controller =3D np;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id->xlate =3D ioapic_xl=
ate;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 id->priv =3D (void *)i;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 add_interrupt_host(id);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 printk(KERN_ERR "IOxAPIC at %s is not registered.\n", n=
p->full_name);
> +}
> +#endif
> +
> =A0/* Enable IOAPIC early just for system timer */
> =A0void __init pre_init_apic_IRQ0(void)
> =A0{
> diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetre=
e.c
> index 179833f..62d0072 100644
> --- a/arch/x86/kernel/devicetree.c
> +++ b/arch/x86/kernel/devicetree.c
> @@ -322,3 +322,16 @@ void __init x86_dtb_get_config(unsigned int unus=
ed)
> =A0 =A0 =A0 =A0dtb_setup_hpet();
> =A0 =A0 =A0 =A0dtb_apic_setup();
> =A0}
> +
> +void __init x86_add_irq_domains(void)
> +{
> + =A0 =A0 =A0 struct device_node *dp;
> +
> + =A0 =A0 =A0 if (!initial_boot_params)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 for_each_node_with_property(dp, "interrupt-controller")=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (of_device_is_compatible(dp, "intel,=
ce4100-ioapic"))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ioapic_add_ofnode(dp);
> + =A0 =A0 =A0 }
> +}
> diff --git a/arch/x86/kernel/irqinit.c b/arch/x86/kernel/irqinit.c
> index 4cadf86..9f76f89 100644
> --- a/arch/x86/kernel/irqinit.c
> +++ b/arch/x86/kernel/irqinit.c
> @@ -119,6 +119,12 @@ void __init init_IRQ(void)
> =A0 =A0 =A0 =A0int i;
>
> =A0 =A0 =A0 =A0/*
> + =A0 =A0 =A0 =A0* We probably need a better place for this, but it w=
orks for
> + =A0 =A0 =A0 =A0* now ...
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 x86_add_irq_domains();
> +
> + =A0 =A0 =A0 /*
> =A0 =A0 =A0 =A0 * On cpu 0, Assign IRQ0_VECTOR..IRQ15_VECTOR's to IRQ=
 0..15.
> =A0 =A0 =A0 =A0 * If these IRQ's are handled by legacy interrupt-cont=
rollers like PIC,
> =A0 =A0 =A0 =A0 * then this configuration will likely be static after=
 the boot. If
> --
> 1.7.4
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kerne=
l" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at =A0http://www.tux.org/lkml/
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
