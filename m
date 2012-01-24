From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [RFCv2 03/14] irq_domain: Make irq_domain structure match
 powerpc's irq_host
Date: Tue, 24 Jan 2012 15:08:40 -0700
Message-ID: <CACxGe6sO-3LHbimBGaWFY98QtK5tiK8uiDodmgO1kVQoi4jDTQ@mail.gmail.com>
References: <1327352870-14687-1-git-send-email-grant.likely@secretlab.ca>
 <1327352870-14687-4-git-send-email-grant.likely@secretlab.ca> <4F1F24DD.5030904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4F1F24DD.5030904@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robherring2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, devicetree-discuss@lists.ozlabs.org, Milton Miller <miltonm@bga.com>, benh@kernel.crashing.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Jan 24, 2012 at 2:38 PM, Rob Herring <robherring2@gmail.com> wr=
ote:
> On 01/23/2012 03:07 PM, Grant Likely wrote:
>> Part of the series to unify the irq remapping mechanisms in the
>> kernel. =A0A follow up patch will copy the powerpc implementation in=
to
>> kernel/irq/irqdomain.c, which will be a lot easier if the structures
>> are identical.
>>
>> Where they differ, I've chose to use the powerpc names since there i=
s
>> a lot more code using those names.
>>
>> Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
>> ---
>> =A0arch/arm/common/gic.c =A0 =A0 | =A0 14 ++++----
>> =A0include/linux/irqdomain.h | =A0 84 ++++++++++++++++++++++++++++++=
++++-----------
>> =A0kernel/irq/irqdomain.c =A0 =A0| =A0 14 ++++----
>> =A03 files changed, 78 insertions(+), 34 deletions(-)
>>
>
> snip...
>
>> @@ -126,7 +126,7 @@ void irq_dispose_mapping(unsigned int irq)
>> =A0}
>> =A0EXPORT_SYMBOL_GPL(irq_dispose_mapping);
>>
>> -int irq_domain_simple_dt_translate(struct irq_domain *d,
>> +int irq_domain_simple_xlate(struct irq_domain *d,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct device_no=
de *controller,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 const u32 *intsp=
ec, unsigned int intsize,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned long *o=
ut_hwirq, unsigned int *out_type)
>
> This needs a declaration in irqdomain.h (as well as EXPORT?). There
> could be others as well, but this is the one I'm using for generic ir=
q chip.

=46ine by me.  I'll add that as a follow-on patch since nothing in-tree
currently depends on that.  It will be in the next version of the
patch series.  Also, are you okay if I rename it to
irq_domain_generic_xlate()?  Simple doesn't really describe it well,
and it can be used for any interrupt controller implementing the
binding we've settled on as recommended for new device support.

g.

>
> Rob
>
>> @@ -181,7 +181,7 @@ EXPORT_SYMBOL_GPL(irq_domain_generate_simple);
>>
>> =A0struct irq_domain_ops irq_domain_simple_ops =3D {
>> =A0#ifdef CONFIG_OF_IRQ
>> - =A0 =A0 .dt_translate =3D irq_domain_simple_dt_translate,
>> + =A0 =A0 .xlate =3D irq_domain_simple_xlate,
>> =A0#endif /* CONFIG_OF_IRQ */
>> =A0};
>> =A0EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
>



--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
