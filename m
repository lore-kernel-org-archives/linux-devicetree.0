From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH v2 1/7] ARM: mmp: parse irq from DT
Date: Mon, 1 Aug 2011 10:47:06 +0800
Message-ID: <CAN1soZxX6EBRPvzV_00njioBn1NfiAbLBoD7EYc-wV-uQM_VoQ@mail.gmail.com>
References: <1311835293-18125-1-git-send-email-haojian.zhuang@marvell.com>
	<1311835293-18125-2-git-send-email-haojian.zhuang@marvell.com>
	<20110729163616.GJ11164@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20110729163616.GJ11164@ponder.secretlab.ca>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Grant Likely <grant.likely@secretlab.ca>
Cc: linux@arm.linux.org.uk, devicetree-discuss@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@marvell.com>, eric.y.miao@gmail.com, linux-arm-kernel@lists.infradead.org, alan@linux.intel.com
List-Id: devicetree@vger.kernel.org

On Sat, Jul 30, 2011 at 12:36 AM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> On Thu, Jul 28, 2011 at 02:41:27PM +0800, Haojian Zhuang wrote:
>> Parse irq sepcifier from DT and translate it to Linux irq number.
>> Remove the definition of NR_IRQS in irqs.h. Since sparse irq is
>> enabled, nr_irqs will be calculated automatically.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =A0.../devicetree/bindings/arm/marvell/intc.txt =A0 =A0 =A0 | =A0114 +++=
+++++++
>> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 | =A0 =A01 +
>> =A0arch/arm/mach-mmp/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A02 +
>> =A0arch/arm/mach-mmp/common.h =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0 =A01 +
>> =A0arch/arm/mach-mmp/include/mach/irqs.h =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
>> =A0arch/arm/mach-mmp/intc.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 | =A0224 ++++++++++++++++++++
>> =A06 files changed, 343 insertions(+), 1 deletions(-)
>> =A0create mode 100644 Documentation/devicetree/bindings/arm/marvell/intc=
.txt
>> =A0create mode 100644 arch/arm/mach-mmp/intc.c
>>
>> diff --git a/Documentation/devicetree/bindings/arm/marvell/intc.txt b/Do=
cumentation/devicetree/bindings/arm/marvell/intc.txt
>> new file mode 100644
>> index 0000000..80cef58
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/marvell/intc.txt
>> @@ -0,0 +1,114 @@
>> +* Interrupt Controller Binding for ARCH-MMP
>> +
>> +This binding specifies what properties must be available in device tree=
 representation of an ARCH-MMP compliant interrupt controller.
>> +
>> +Required properties:
>> +
>> + =A0 =A0 - compatible: Specifies the compatibility list of the interrupt
>> + =A0 =A0 =A0 controller. The type shall be <string> and the value shall=
 be
>> + =A0 =A0 =A0 "mrvl,pxa168-intc" or "mrvl,mmp2-mux-intc".
>> + =A0 =A0 =A0 "mrvl,pxa168-intc" is the base interrupt controller. It mu=
st be
>> + =A0 =A0 =A0 included. It's compatible for pxa910, mmp2. "mrvl,mmp2-mux=
-intc"
>> + =A0 =A0 =A0 is the expanded interrupt controller, and it's optional.
>> +
>> + =A0 =A0 - reg: Specified the base physical address(s) and size(s) of t=
he
>> + =A0 =A0 =A0 interrupt controller's addressable register space. The type
>> + =A0 =A0 =A0 should be <prop-encoded-array>.
>> +
>> + =A0 =A0 - interrupt-controller: The presence of this property identifi=
es
>> + =A0 =A0 =A0 the node as interrupt controller. No property value should=
 be
>> + =A0 =A0 =A0 defined.
>> +
>> + =A0 =A0 - #interrupt-cells: Specifies the number of cells needed to en=
code
>> + =A0 =A0 =A0 an interrupt source. The type should be <u32> and the valu=
e should
>> + =A0 =A0 =A0 be 1.
>> +
>> + =A0 =A0 - mrvl,intc-numbers: Specifies the number of interrupts is sup=
ported
>> + =A0 =A0 =A0 in this interrupt controller. The type should be <u32>.
>> +
>> +Optional properties:
>> +
>> + =A0 =A0 - mrvl,intc-priority: Specifies the which path the interrupt i=
s routed
>> + =A0 =A0 =A0 and the priority of this interrupt. The property is used in
>> + =A0 =A0 =A0 pxa168-intc. The value should be <u32>.
>> +
>> + =A0 =A0 - mrvl,status-offset: Specifies the offset of status register.=
 The
>> + =A0 =A0 =A0 property is used in mmp2-mux-intc. The type should be <u32=
>.
>> +
>> + =A0 =A0 - mrvl,mask-offset: Specifies the offset of mask register. The
>> + =A0 =A0 =A0 property is used in mmp2-mux-intc. The type should be <u32=
>.
>> +
>> + =A0 =A0 - mrvl,mfp-edge: Specifies the address of mfp edge detection r=
egister.
>> + =A0 =A0 =A0 The property is used while acking specified interrupt. The=
 type
>> + =A0 =A0 =A0 should be <prop-encoded-array>. The first cell indicates t=
he address
>> + =A0 =A0 =A0 of mfp edge detection register. The second cell indicates =
the
>> + =A0 =A0 =A0 index of interrupt in current interrupt controller that sh=
ould
>> + =A0 =A0 =A0 handle mfp edge detection.
>> +
>> +* Examples
>> +
>> +Example 1:
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* base INTC
>> + =A0 =A0 =A0*/
>> + =A0 =A0 mmp_intc: interrupt-controller@d4282000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Compatible with pxa168-intc. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,pxa168-intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Offset address of 0xd4282000 and size of 0x=
400. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* 64 interrupts are supported in this INTC. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <64>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* priority bits in configuration register */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-priority =3D <0x20>;
>> + =A0 =A0 };
>> +
>> +Example 2:
>> +
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* mux INTC that is internal wired to base INTC
>> + =A0 =A0 =A0*/
>> + =A0 =A0 mux_intc4: interrupt-controller@d4282150 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "mrvl,mmp2-mux-intc";
>> + =A0 =A0 =A0 =A0 =A0 =A0 #address-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 #size-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0xd4282000 0x400>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 #interrupt-cells =3D <1>;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-controller;
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mmp_intc>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* interrupt source '4' of parent INTC. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <4>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* 2 interrupts are supported in this INTC. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,intc-numbers =3D <2>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Status offset address of 0x150. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,status-offset =3D <0x150>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* Mask offset address of 0x168. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mask-offset =3D <0x168>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* mfp register of 0xd401e2c4 & interrupt inde=
x of 1 */
>> + =A0 =A0 =A0 =A0 =A0 =A0 mrvl,mfp-edge =3D <0xd401e2c4 1>;
>> + =A0 =A0 };
>> +
>> +Example 3:
>> + =A0 =A0 /*
>> + =A0 =A0 =A0* An interrupt generating device that is wired to an INTC.
>> + =A0 =A0 =A0*/
>> + =A0 =A0 uart0: uart@d4030000 {
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* parent's '#interrupt-cells' property. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <27>;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* The INTC that this device is wired to. */
>> + =A0 =A0 =A0 =A0 =A0 =A0 interrupt-parent =3D <&mmp_intc>;
>> + =A0 =A0 };
>> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
>> index 17507b8..f18eb14 100644
>> --- a/arch/arm/Kconfig
>> +++ b/arch/arm/Kconfig
>> @@ -542,6 +542,7 @@ config ARCH_MMP
>> =A0 =A0 =A0 select ARCH_REQUIRE_GPIOLIB
>> =A0 =A0 =A0 select CLKDEV_LOOKUP
>> =A0 =A0 =A0 select GENERIC_CLOCKEVENTS
>> + =A0 =A0 select GENERIC_IRQ_CHIP
>> =A0 =A0 =A0 select HAVE_SCHED_CLOCK
>> =A0 =A0 =A0 select TICK_ONESHOT
>> =A0 =A0 =A0 select PLAT_PXA
>> diff --git a/arch/arm/mach-mmp/Makefile b/arch/arm/mach-mmp/Makefile
>> index 5c68382..e7862ea 100644
>> --- a/arch/arm/mach-mmp/Makefile
>> +++ b/arch/arm/mach-mmp/Makefile
>> @@ -4,6 +4,8 @@
>>
>> =A0obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
+=3D common.o clock.o devices.o time.o
>>
>> +obj-$(CONFIG_OF_IRQ) =A0 =A0 =A0 =A0 +=3D intc.o
>> +
>
> I'm still really confused about why an entirely new interrupt
> controller file is being added. =A0Drivers already exist in mach-mmp
> for the mux and pxa168 interrupt controllers, but this adds a whole
> new driver. =A0I would expect the existing drivers should be refactored
> to use irq generic chip, and then extend them to add DT support.
>
Before applying this patch, two irq (irq-pxa168.c & irq-mmp2.c) exists.
The block issue of merging them together is different register.
Now DT can resolve different register. I'm planning to remove both of
irq-pxa168.c & irq-mmp2.c after these DT patches.

>> =A0# SoC support
>> =A0obj-$(CONFIG_CPU_PXA168) =A0 =A0 +=3D pxa168.o irq-pxa168.o
>> =A0obj-$(CONFIG_CPU_PXA910) =A0 =A0 +=3D pxa910.o irq-pxa168.o
>> diff --git a/arch/arm/mach-mmp/common.h b/arch/arm/mach-mmp/common.h
>> index ec8d65d..1c563c2 100644
>> --- a/arch/arm/mach-mmp/common.h
>> +++ b/arch/arm/mach-mmp/common.h
>> @@ -6,3 +6,4 @@ extern void timer_init(int irq);
>>
>> =A0extern void __init icu_init_irq(void);
>> =A0extern void __init mmp_map_io(void);
>> +extern void __init mmp_init_intc(void);
>> diff --git a/arch/arm/mach-mmp/include/mach/irqs.h b/arch/arm/mach-mmp/i=
nclude/mach/irqs.h
>> index a09d328..65ec176 100644
>> --- a/arch/arm/mach-mmp/include/mach/irqs.h
>> +++ b/arch/arm/mach-mmp/include/mach/irqs.h
>> @@ -224,6 +224,6 @@
>>
>> =A0#define IRQ_BOARD_START =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(I=
RQ_GPIO_START + IRQ_GPIO_NUM)
>>
>> -#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0(IRQ_BOARD_START)
>> +#define NR_IRQS =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A00
>
> Why is NR_IRQs getting changed? =A0I think this will break
> !CONFIG_SPARSE_IRQS, and it shouldn't be necessary for this
> conversion.
>
If CONFIG_SPARSE_IRQ is enabled, arch_probe_nr_irqs() returns NR_IRQS in ar=
m.
It results registering NR_IRQS in early_irq_init(). If NR_IRQS is 200,
200 irqs are
registered in early_irq_init(). It's not my requirement. What I need
is registering irq
from DT.

So I have to define NR_IRQS to 0. And CONFIG_SPARSE_IRQS is always enabled
in ARCH_MMP. So it's selected in Kconfig by default.

>>
>>
>> --
>> Regards,
>> Shawn
>>
>> =A0#endif /* __ASM_MACH_IRQS_H */
>> diff --git a/arch/arm/mach-mmp/intc.c b/arch/arm/mach-mmp/intc.c
>> new file mode 100644
>> index 0000000..2e44057
>> --- /dev/null
>> +++ b/arch/arm/mach-mmp/intc.c
>> @@ -0,0 +1,224 @@
>> +/*
>> + * =A0linux/arch/arm/mach-mmp/intc.c
>> + *
>> + * =A0Generic IRQ handling
>> + *
>> + * =A0Author: =A0Haojian Zhuang <haojian.zhuang@marvell.com>
>> + * =A0Copyright: =A0 =A0 =A0 Marvell International Ltd. 2011
>> + *
>> + * =A0This program is free software; you can redistribute it and/or mod=
ify
>> + * =A0it under the terms of the GNU General Public License version 2 as
>> + * =A0published by the Free Software Foundation.
>> + */
>> +
>> +#include <linux/errno.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/of_irq.h>
>> +#include <linux/slab.h>
>> +
>> +struct mmp_intc_info {
>> + =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0en_mask;
>> + =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*virt_base;
>> + =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*status;
>> + =A0 =A0 void __iomem =A0 =A0 =A0 =A0 =A0 =A0*mfp_edge;
>> + =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0mfp_edge_index; /* index i=
n irq domain */
>> +};
>> +
>> +static void mux_irq_ack(struct irq_data *d)
>> +{
>> + =A0 =A0 struct irq_chip_generic *gc =3D irq_data_get_irq_chip_data(d);
>> + =A0 =A0 struct irq_chip_type *ct;
>> + =A0 =A0 struct mmp_intc_info *info;
>> + =A0 =A0 unsigned int data, irq_offs;
>> +
>> + =A0 =A0 ct =3D gc->chip_types;
>> + =A0 =A0 info =3D (struct mmp_intc_info *)ct->regs.ack;
>> + =A0 =A0 irq_offs =3D d->irq - gc->irq_base;
>> + =A0 =A0 /* clear MFP edge-detect */
>> + =A0 =A0 if (info->mfp_edge && (info->mfp_edge_index =3D=3D irq_offs)) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 data =3D __raw_readl(info->mfp_edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(data | (1 << 6), info->mfp_edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(data, info->mfp_edge);
>> + =A0 =A0 }
>> +}
>> +
>> +static void mmp_irq_demux_handler(unsigned int irq, struct irq_desc *de=
sc)
>> +{
>> + =A0 =A0 struct irq_chip_generic *gc =3D irq_get_handler_data(irq);
>> + =A0 =A0 struct irq_chip_type *ct;
>> + =A0 =A0 struct mmp_intc_info *info;
>> + =A0 =A0 unsigned long status, n;
>> +
>> + =A0 =A0 ct =3D gc->chip_types;
>> + =A0 =A0 info =3D (struct mmp_intc_info *)ct->regs.ack;
>> + =A0 =A0 while (1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 status =3D __raw_readl(info->status) & ~gc->ma=
sk_cache;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (status =3D=3D 0)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
>> + =A0 =A0 =A0 =A0 =A0 =A0 n =3D find_first_bit(&status, BITS_PER_LONG);
>> + =A0 =A0 =A0 =A0 =A0 =A0 while (n < BITS_PER_LONG) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 generic_handle_irq(gc->irq_bas=
e + n);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 n =3D find_next_bit(&status, B=
ITS_PER_LONG, n + 1);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 }
>> +}
>> +
>> +static void mux_init_intc(struct mmp_intc_info *mmp_info)
>> +{
>> + =A0 =A0 struct device_node *np;
>> + =A0 =A0 struct mmp_intc_info *mux_info;
>> + =A0 =A0 struct irq_chip_generic *gc;
>> + =A0 =A0 struct irq_chip_type *ct;
>> + =A0 =A0 const __be32 *edge;
>> + =A0 =A0 unsigned int addr =3D 0, offs =3D 0;
>> + =A0 =A0 unsigned int status, mask, irq_base, nr, data;
>> + =A0 =A0 int cascade;
>> +
>> + =A0 =A0 for_each_compatible_node(np, NULL, "mrvl,mmp2-mux-intc") {
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (of_get_property(np, "interrupt-controller"=
, NULL) =3D=3D NULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np, "mrvl,intc-number=
s", &nr) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("intc-numbers property=
 is missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np, "mrvl,status-offs=
et", &status)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("intc-status property =
is missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (of_property_read_u32(np, "mrvl,mask-offset=
", &mask) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("intc-mask property is=
 missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_info =3D kzalloc(sizeof(*mux_info), GFP_KE=
RNEL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (mux_info =3D=3D NULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 =A0 =A0 =A0 =A0 status +=3D (unsigned int)mmp_info->virt_base;
>> + =A0 =A0 =A0 =A0 =A0 =A0 mux_info->status =3D (void __iomem *)status;
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 edge =3D of_get_property(np, "mrvl,mfp-edge", =
NULL);
>> + =A0 =A0 =A0 =A0 =A0 =A0 if (edge) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr =3D be32_to_cpu(*edge) & =
PAGE_MASK;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 offs =3D be32_to_cpu(*edge) - =
addr;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mux_info->mfp_edge =3D ioremap=
(addr, PAGE_SIZE) + offs;
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mux_info->mfp_edge_index =3D b=
e32_to_cpu(*++edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* clear mfp edge detection fo=
r initialization */
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 data =3D __raw_readl(mux_info-=
>mfp_edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(data | (1 << 6), =
mux_info->mfp_edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 __raw_writel(data, mux_info->m=
fp_edge);
>> + =A0 =A0 =A0 =A0 =A0 =A0 }
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 /* allocate new irq */
>> + =A0 =A0 =A0 =A0 =A0 =A0 cascade =3D irq_of_parse_and_map(np, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_base =3D irq_alloc_descs(-1, 0, nr, 0);
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_domain_add_simple(np, irq_base);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 gc =3D irq_alloc_generic_chip("mux-intc", 1, i=
rq_base,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 mmp_info->virt_base, handle_level_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct =3D gc->chip_types;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct->regs.ack =3D (unsigned int)mux_info;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct->regs.mask =3D mask;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct->chip.irq_ack =3D mux_irq_ack;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct->chip.irq_mask =3D irq_gc_mask_set_bit;
>> + =A0 =A0 =A0 =A0 =A0 =A0 ct->chip.irq_unmask =3D irq_gc_mask_clr_bit;
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_setup_generic_chip(gc, IRQ_MSK(nr), IRQ_GC=
_INIT_MASK_CACHE,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 IRQ_NOREQUEST | IRQ_NOPROBE, 0);
>> +
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_set_handler_data(cascade, gc);
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chained_handler(cascade, mmp_irq_demux=
_handler);
>> + =A0 =A0 }
>> +out:
>> + =A0 =A0 return;
>> +}
>> +
>> +static void mmp_irq_unmask(struct irq_data *d)
>> +{
>> + =A0 =A0 struct mmp_intc_info *info =3D irq_data_get_irq_chip_data(d);
>> +
>> + =A0 =A0 /* ICU_INT_CONF */
>> + =A0 =A0 __raw_writel(info->en_mask, info->virt_base + (d->irq << 2));
>> +}
>> +
>> +static void mmp_irq_mask(struct irq_data *d)
>> +{
>> + =A0 =A0 struct mmp_intc_info *info =3D irq_data_get_irq_chip_data(d);
>> +
>> + =A0 =A0 __raw_writel(0, info->virt_base + (d->irq << 2));
>> +}
>> +
>> +static struct irq_chip mmp_irq_chip =3D {
>> + =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "mmp-intc",
>> + =A0 =A0 .irq_unmask =A0 =A0 =3D mmp_irq_unmask,
>> + =A0 =A0 .irq_mask =A0 =A0 =A0 =3D mmp_irq_mask,
>> + =A0 =A0 .irq_ack =A0 =A0 =A0 =A0=3D mmp_irq_mask,
>> +};
>> +
>> +void __init mmp_init_intc(void)
>> +{
>> + =A0 =A0 struct mmp_intc_info *info;
>> + =A0 =A0 struct device_node *np;
>> + =A0 =A0 struct resource rs;
>> + =A0 =A0 unsigned int cells, nr, enable, irq_base;
>> + =A0 =A0 int i;
>> +
>> + =A0 =A0 np =3D of_find_compatible_node(NULL, NULL, "mrvl,pxa168-intc");
>> +
>> + =A0 =A0 BUG_ON(!np);
>> +
>> + =A0 =A0 of_node_get(np);
>> + =A0 =A0 if (of_get_property(np, "interrupt-controller", NULL) =3D=3D N=
ULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 if (of_property_read_u32(np, "#interrupt-cells", &cells) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: interrupt-cells property is=
 missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> + =A0 =A0 if (cells !=3D 1) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: interrupt-cells property is=
 incorrect\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> + =A0 =A0 if (of_property_read_u32(np, "mrvl,intc-numbers", &nr) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: mrvl,intc-numbers property =
is missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> + =A0 =A0 if (of_property_read_u32(np, "mrvl,intc-priority", &enable) < =
0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: mrvl,intc-priority property=
 is missed\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> + =A0 =A0 if (of_address_to_resource(np, 0, &rs) < 0) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: invalid reg property\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 info =3D kzalloc(sizeof(struct mmp_intc_info), GFP_KERNEL);
>> + =A0 =A0 if (info =3D=3D NULL)
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out;
>> + =A0 =A0 info->en_mask =3D enable;
>> + =A0 =A0 info->virt_base =3D ioremap(rs.start, PAGE_SIZE);
>> + =A0 =A0 if (info->virt_base =3D=3D NULL) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 pr_warn("mmp-intc: failed to remap reg base\n"=
);
>> + =A0 =A0 =A0 =A0 =A0 =A0 goto out_mem;
>> + =A0 =A0 }
>> +
>> + =A0 =A0 /* allocate new irq */
>> + =A0 =A0 irq_base =3D irq_alloc_descs(-1, 0, nr, 0);
>> + =A0 =A0 irq_domain_add_simple(np, 0);
>> +
>> + =A0 =A0 for (i =3D irq_base; i < irq_base + nr; i++) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chip_data(i, info);
>> + =A0 =A0 =A0 =A0 =A0 =A0 mmp_irq_mask(irq_get_irq_data(i));
>> + =A0 =A0 =A0 =A0 =A0 =A0 irq_set_chip_and_handler(i, &mmp_irq_chip, han=
dle_level_irq);
>> + =A0 =A0 =A0 =A0 =A0 =A0 set_irq_flags(i, IRQF_VALID);
>> + =A0 =A0 }
>> + =A0 =A0 mux_init_intc(info);
>> + =A0 =A0 of_node_put(np);
>> + =A0 =A0 return;
>> +out_mem:
>> + =A0 =A0 kfree(info);
>> +out:
>> + =A0 =A0 of_node_put(np);
>> + =A0 =A0 return;
>> +}
>> --
>> 1.5.6.5
>>
>
