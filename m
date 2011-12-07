From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [RFC PATCH] microblaze/irq: Change NO_IRQ to 0
Date: Wed, 7 Dec 2011 08:02:42 -0700
Message-ID: <CACxGe6tvP+51RPfsU0Jr6nExyD6KXr75e4Rxo1DiaJxYJXN-eA@mail.gmail.com>
References: <4EDEE2B2.7080606@gmail.com>
 <1323268911-6104-1-git-send-email-robherring2@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1323268911-6104-1-git-send-email-robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Rothwell <sfr-3FnU+UHB4dNDw9hX6IcOSA@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Jeff Garzik <jgarzik-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Anton Vorontsov <anton.vorontsov-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, Linus Torvalds <torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Alan Cox <alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Dec 7, 2011 at 7:41 AM, Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
>
> As has been discussed many times[1], Using NO_IRQ set to anything other
> than 0 is bug waiting to happen since many drivers follow the pattern
> "if (!irq)" for testing whether or not an irq has been set.
>
> This patch changes the Microblaze NO_IRQ setting from -1 to 0 to bring
> it in line with most of the rest of the kernel. =A0It also prepares for
> Microblaze eventually supporting multiple interrupt controllers by
> breaking the assumption that hwirq# =3D=3D Linux IRQ#. =A0The Linux IRQ
> number is just a cookie with no guarantee of a direct relationship
> with the hardware irq arrangement.
>
> At this point, Microblaze interrupt handling only supports only one
> instance of one kind of interrupt controller (xilinx_intc). =A0This change
> shouldn't affect any architecture code outside of the interrupt
> controller driver and the irq_of mapping.
>
> Updated to 3.2 and to use irq_data.hwirq by Rob Herring.
>
> Completely untested.
>
> [1] http://lkml.org/lkml/2005/11/21/221
>
> Signed-off-by: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
> Signed-off-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>

Brilliant!  Thanks for updating this Rob.

g.

> ---
>
> The main complaint with the prior version was Michal's complaint about the
> +1 / -1 conversion in every function. This is now solved with the use of
> irq_data.hwirq to store the h/w irq numbers.
>
> I also fixed some errors around nr_irq.
>
> Rob
>
> =A0arch/microblaze/include/asm/irq.h | =A0 =A04 ++--
> =A0arch/microblaze/kernel/intc.c =A0 =A0 | =A0 18 ++++++++++--------
> =A0arch/microblaze/kernel/irq.c =A0 =A0 =A0| =A0 10 ++++++----
> =A03 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/arch/microblaze/include/asm/irq.h b/arch/microblaze/include/=
asm/irq.h
> index cc54187..b07c179 100644
> --- a/arch/microblaze/include/asm/irq.h
> +++ b/arch/microblaze/include/asm/irq.h
> @@ -9,7 +9,7 @@
> =A0#ifndef _ASM_MICROBLAZE_IRQ_H
> =A0#define _ASM_MICROBLAZE_IRQ_H
>
> -#define NR_IRQS 32
> +#define NR_IRQS (32 + 1) =A0 =A0 =A0 /* Add 1 to skip over IRQ0 */
> =A0#include <asm-generic/irq.h>
>
> =A0/* This type is the placeholder for a hardware interrupt number. It ha=
s to
> @@ -20,7 +20,7 @@ typedef unsigned long irq_hw_number_t;
>
> =A0extern unsigned int nr_irq;
>
> -#define NO_IRQ (-1)
> +#define NO_IRQ 0
>
> =A0struct pt_regs;
> =A0extern void do_IRQ(struct pt_regs *regs);
> diff --git a/arch/microblaze/kernel/intc.c b/arch/microblaze/kernel/intc.c
> index eb41441..ed65aac 100644
> --- a/arch/microblaze/kernel/intc.c
> +++ b/arch/microblaze/kernel/intc.c
> @@ -42,7 +42,7 @@ unsigned int nr_irq;
>
> =A0static void intc_enable_or_unmask(struct irq_data *d)
> =A0{
> - =A0 =A0 =A0 unsigned long mask =3D 1 << d->irq;
> + =A0 =A0 =A0 unsigned long mask =3D 1 << d->hwirq;
> =A0 =A0 =A0 =A0pr_debug("enable_or_unmask: %d\n", d->irq);
> =A0 =A0 =A0 =A0out_be32(INTC_BASE + SIE, mask);
>
> @@ -57,18 +57,18 @@ static void intc_enable_or_unmask(struct irq_data *d)
> =A0static void intc_disable_or_mask(struct irq_data *d)
> =A0{
> =A0 =A0 =A0 =A0pr_debug("disable: %d\n", d->irq);
> - =A0 =A0 =A0 out_be32(INTC_BASE + CIE, 1 << d->irq);
> + =A0 =A0 =A0 out_be32(INTC_BASE + CIE, 1 << d->hwirq);
> =A0}
>
> =A0static void intc_ack(struct irq_data *d)
> =A0{
> =A0 =A0 =A0 =A0pr_debug("ack: %d\n", d->irq);
> - =A0 =A0 =A0 out_be32(INTC_BASE + IAR, 1 << d->irq);
> + =A0 =A0 =A0 out_be32(INTC_BASE + IAR, 1 << d->hwirq);
> =A0}
>
> =A0static void intc_mask_ack(struct irq_data *d)
> =A0{
> - =A0 =A0 =A0 unsigned long mask =3D 1 << d->irq;
> + =A0 =A0 =A0 unsigned long mask =3D 1 << d->hwirq;
> =A0 =A0 =A0 =A0pr_debug("disable_and_ack: %d\n", d->irq);
> =A0 =A0 =A0 =A0out_be32(INTC_BASE + CIE, mask);
> =A0 =A0 =A0 =A0out_be32(INTC_BASE + IAR, mask);
> @@ -90,8 +90,11 @@ unsigned int get_irq(struct pt_regs *regs)
> =A0 =A0 =A0 =A0 * NOTE: This function is the one that needs to be improve=
d in
> =A0 =A0 =A0 =A0 * order to handle multiple interrupt controllers. It curr=
ently
> =A0 =A0 =A0 =A0 * is hardcoded to check for interrupts only on the first =
INTC.
> + =A0 =A0 =A0 =A0*
> + =A0 =A0 =A0 =A0* Linux IRQ# is currently offset by one to map to the ha=
rdware
> + =A0 =A0 =A0 =A0* irq number. =A0So hardware IRQ0 maps to Linux irq 1.
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 irq =3D in_be32(INTC_BASE + IVR);
> + =A0 =A0 =A0 irq =3D in_be32(INTC_BASE + IVR) + 1;
> =A0 =A0 =A0 =A0pr_debug("get_irq: %d\n", irq);
>
> =A0 =A0 =A0 =A0return irq;
> @@ -134,8 +137,6 @@ void __init init_IRQ(void)
> =A0 =A0 =A0 =A0intr_type =3D
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0be32_to_cpup(of_get_property(intc,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0"xlnx,kind-of-intr", NULL));
> - =A0 =A0 =A0 if (intr_type > (u32)((1ULL << nr_irq) - 1))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO " ERROR: Mismatch in kind-=
of-intr param\n");
>
> =A0#ifdef CONFIG_SELFMOD_INTC
> =A0 =A0 =A0 =A0selfmod_function((int *) arr_func, intc_baseaddr);
> @@ -155,7 +156,7 @@ void __init init_IRQ(void)
> =A0 =A0 =A0 =A0/* Turn on the Master Enable. */
> =A0 =A0 =A0 =A0out_be32(intc_baseaddr + MER, MER_HIE | MER_ME);
>
> - =A0 =A0 =A0 for (i =3D 0; i < nr_irq; ++i) {
> + =A0 =A0 =A0 for (i =3D 1; i < nr_irq; ++i) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (intr_type & (0x00000001 << i)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_set_chip_and_handler_n=
ame(i, &intc_dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_edg=
e_irq, "edge");
> @@ -165,5 +166,6 @@ void __init init_IRQ(void)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0handle_lev=
el_irq, "level");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0irq_set_status_flags(i, IR=
Q_LEVEL);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 irq_get_irq_data(i)->hwirq =3D i - 1;
> =A0 =A0 =A0 =A0}
> =A0}
> diff --git a/arch/microblaze/kernel/irq.c b/arch/microblaze/kernel/irq.c
> index e5d63a8..ac1b463 100644
> --- a/arch/microblaze/kernel/irq.c
> +++ b/arch/microblaze/kernel/irq.c
> @@ -33,11 +33,11 @@ void __irq_entry do_IRQ(struct pt_regs *regs)
> =A0 =A0 =A0 =A0irq_enter();
> =A0 =A0 =A0 =A0irq =3D get_irq(regs);
> =A0next_irq:
> - =A0 =A0 =A0 BUG_ON(irq =3D=3D -1U);
> + =A0 =A0 =A0 BUG_ON(!irq);
> =A0 =A0 =A0 =A0generic_handle_irq(irq);
>
> =A0 =A0 =A0 =A0irq =3D get_irq(regs);
> - =A0 =A0 =A0 if (irq !=3D -1U) {
> + =A0 =A0 =A0 if (irq) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pr_debug("next irq: %d\n", irq);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0++concurrent_irq;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto next_irq;
> @@ -52,13 +52,15 @@ next_irq:
> =A0 intc without any cascades or any connection that's why mapping is 1:1=
 */
> =A0unsigned int irq_create_mapping(struct irq_host *host, irq_hw_number_t=
 hwirq)
> =A0{
> - =A0 =A0 =A0 return hwirq;
> + =A0 =A0 =A0 return hwirq + 1;
> =A0}
> =A0EXPORT_SYMBOL_GPL(irq_create_mapping);
>
> =A0unsigned int irq_create_of_mapping(struct device_node *controller,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const=
 u32 *intspec, unsigned int intsize)
> =A0{
> - =A0 =A0 =A0 return intspec[0];
> + =A0 =A0 =A0 /* Hardware irq is mapped to Linux IRQ# by a 1 offset. Linu=
x irq
> + =A0 =A0 =A0 =A0* 0 means no IRQ. */
> + =A0 =A0 =A0 return intspec[0] + 1;
> =A0}
> =A0EXPORT_SYMBOL_GPL(irq_create_of_mapping);
> --
> 1.7.5.4
>



-- =

Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
