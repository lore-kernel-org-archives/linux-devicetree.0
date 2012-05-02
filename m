From: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: mmp: support DT in irq
Date: Wed, 2 May 2012 13:40:31 +0800
Message-ID: <CAN1soZz5b0bc10isc6syxM7WzKfvVqc-HzotW6Auqv1A1mnC9A@mail.gmail.com>
References: <1335515957-1798-1-git-send-email-haojian.zhuang@gmail.com>
 <1335515957-1798-4-git-send-email-haojian.zhuang@gmail.com>
 <20120427190620.D3C313E0B4D@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120427190620.D3C313E0B4D@localhost>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Apr 28, 2012 at 3:06 AM, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org> w=
rote:
> On Fri, 27 Apr 2012 16:39:11 +0800, Haojian Zhuang <haojian.zhuang@gmail.=
com> wrote:
>> Append new interrupt driver that could support both pxa168 and mmp2
>> silicon. And this driver supports device tree.
>>
>> Since CONFIG_SPARSE_IRQ is enabled in arch-mmp, irq driver should
>> handle reserved NR_IRQS_LEGACY in irq domain.
>>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>> ---
>> =A0arch/arm/mach-mmp/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
>> =A0arch/arm/mach-mmp/include/mach/entry-macro.S | =A0 =A09 +
>> =A0arch/arm/mach-mmp/irq.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0287 ++++++++++++++++++++++++++
>
> It shouldn't be necessary to create an entirely new irq controller
> driver that duplicates the functionality of irq-mmp2.c and
> irq-pxa168.c. =A0Instead, the existing drivers should be refactored to
> work with both DT and non-DT user.
>
New irq controller driver handles both pxa168 and mmp2. The register defini=
tion
is different. And some mux interrupt controllers are in mmp2. There
are different
interrupt numbers in each mux interrupt controller.

Directly merging these two drivers are a bit difficult. But I can make
use of DTS file
to record register address and interrupt numbers.

>> diff --git a/arch/arm/mach-mmp/include/mach/entry-macro.S b/arch/arm/mac=
h-mmp/include/mach/entry-macro.S
>> index 9cff9e7..6b9d925 100644
>> --- a/arch/arm/mach-mmp/include/mach/entry-macro.S
>> +++ b/arch/arm/mach-mmp/include/mach/entry-macro.S
>> @@ -6,13 +6,19 @@
>> =A0 * published by the Free Software Foundation.
>> =A0 */
>>
>> +#include <asm/irq.h>
>> =A0#include <mach/regs-icu.h>
>>
>> =A0 =A0 =A0 .macro =A0get_irqnr_preamble, base, tmp
>> =A0 =A0 =A0 mrc =A0 =A0 p15, 0, \tmp, c0, c0, 0 =A0 =A0 =A0 =A0 @ CPUID
>> =A0 =A0 =A0 and =A0 =A0 \tmp, \tmp, #0xff00
>> =A0 =A0 =A0 cmp =A0 =A0 \tmp, #0x5800
>> +#ifdef CONFIG_OF
>> + =A0 =A0 ldr =A0 =A0 \base, =3Dmmp_icu_base
>> + =A0 =A0 ldr =A0 =A0 \base, [\base, #0]
>> +#else
>> =A0 =A0 =A0 ldr =A0 =A0 \base, =3DICU_VIRT_BASE
>> +#endif
>> =A0 =A0 =A0 addne =A0 \base, \base, #0x10c =A0 =A0 =A0 =A0 =A0 =A0@ PJ1 =
AP INT SEL register
>> =A0 =A0 =A0 addeq =A0 \base, \base, #0x104 =A0 =A0 =A0 =A0 =A0 =A0@ PJ4 =
IRQ SEL register
>> =A0 =A0 =A0 .endm
>> @@ -20,5 +26,8 @@
>> =A0 =A0 =A0 .macro =A0get_irqnr_and_base, irqnr, irqstat, base, tmp
>> =A0 =A0 =A0 ldr =A0 =A0 \tmp, [\base, #0]
>> =A0 =A0 =A0 and =A0 =A0 \irqnr, \tmp, #0x3f
>> +#ifdef CONFIG_OF
>> + =A0 =A0 add =A0 =A0 \irqnr, \irqnr, #NR_IRQS_LEGACY
>> +#endif
>
> What do these do? =A0Does turning on CONFIG_OF break booting with atags?
> If so then this will need to be reworked. =A0CONFIG_OF must not disable
> non-devicetree usage.
>
> g.

I use two CONFIG_OF in this file. The first one is used to record
register base address
of interrupt controller. In legacy code, the register address is
hardcoding. Do you mean
that I should remove this CONFIG_OF?

The second CONFIG_OF is used to do a rebase of interrupt number. Since
SPARSE IRQ
is enabled, NR_IRQS_LEGACY (16) is defined already. I have two
choices. Either I extended
to define ".nr_irqs" in machine script for internal interrupts, or I
reserve NR_IRQS_LEGACY and
allocate new irqs for internal interrupts. I choose the second
solution. Do you mean that I have to
use the first solution?
