From: Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>
Subject: Re: Re: [PATCH v6 2/9] irqchip/sunxi-nmi: add support
 for the NMI in A64 R_INTC
Date: Mon, 5 Jun 2017 13:57:45 +0800
Message-ID: <CAGb2v64b80fZ81rC_dWzes9VzMKfVA4HYC7yJ779tb=4r2jeSw@mail.gmail.com>
References: <20170518071653.36561-1-icenowy@aosc.io> <20170518071653.36561-3-icenowy@aosc.io>
 <ed99d87b-86eb-cf8a-8614-51d59fa00c8c@arm.com> <98014597-29BA-4D02-8137-4E399955F4FD@aosc.io>
 <CAGb2v66NY49OL0J3C64CKzngri5-Na6uPBizj-BNJW3vNkFUQw@mail.gmail.com>
Reply-To: wens-jdAy2FN1RRM@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCMILY6JWQBBB4PF2PEQKGQETWZ5KNQ-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-Reply-To: <CAGb2v66NY49OL0J3C64CKzngri5-Na6uPBizj-BNJW3vNkFUQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
Cc: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-arm-kernel <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-sunxi <linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Marc,

On Mon, May 22, 2017 at 10:25 PM, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org> wrote:
> On Mon, May 22, 2017 at 5:41 PM, Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org> wrote:
>>
>>
>> =E4=BA=8E 2017=E5=B9=B45=E6=9C=8822=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=885:39:22, Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org> =E5=86=99=E5=88=B0:
>>>On 18/05/17 08:16, Icenowy Zheng wrote:
>>>> Add support for the newly imported compatible for the A64 R_INTC in
>>>> irq-sunxi-nmi driver.
>>>>
>>>> Signed-off-by: Icenowy Zheng <icenowy-h8G6r0blFSE@public.gmane.org>
>>>> ---
>>>> Changes in v5:
>>>> - Fix A64 R_INTC compatible.
>>>>
>>>>  drivers/irqchip/irq-sunxi-nmi.c | 13 +++++++++++++
>>>>  1 file changed, 13 insertions(+)
>>>>
>>>> diff --git a/drivers/irqchip/irq-sunxi-nmi.c
>>>b/drivers/irqchip/irq-sunxi-nmi.c
>>>> index 668730c5cb66..5559c1d593bf 100644
>>>> --- a/drivers/irqchip/irq-sunxi-nmi.c
>>>> +++ b/drivers/irqchip/irq-sunxi-nmi.c
>>>> @@ -56,6 +56,12 @@ static struct sunxi_sc_nmi_reg_offs sun9i_reg_offs
>>>=3D {
>>>>      .enable =3D 0x04,
>>>>  };
>>>>
>>>> +static struct sunxi_sc_nmi_reg_offs sun50i_reg_offs =3D {
>>>> +    .ctrl   =3D 0x0c,
>>>> +    .pend   =3D 0x10,
>>>> +    .enable =3D 0x40,
>>>> +};
>>>> +
>>>
>>>Magic values? Even if no #define is provided, a pointer to the
>>>corresponding documentation would be appreciated (assuming
>>>documentation
>>>exists).
>>
>> No documents is available for A64 R_INTC.
>
> No code either. In Allwinner's BSP, the interrupts for the PMICs go
> through the (closed source) OpenRISC firmware, so there's no driver
> for it in the kernel.
>
> The registers line up with the old interrupt controller from the A10,
> but it seems only the NMI interrupt is wired up.

Is this OK? Or do you want Icenowy to respin a version with defines?

>>>
>>>>  static inline void sunxi_sc_nmi_write(struct irq_chip_generic *gc,
>>>u32 off,
>>>>                                    u32 val)
>>>>  {
>>>> @@ -220,3 +226,10 @@ static int __init sun9i_nmi_irq_init(struct
>>>device_node *node,
>>>>      return sunxi_sc_nmi_irq_init(node, &sun9i_reg_offs);
>>>>  }
>>>>  IRQCHIP_DECLARE(sun9i_nmi, "allwinner,sun9i-a80-nmi",
>>>sun9i_nmi_irq_init);
>>>> +
>>>> +static int __init sun50i_nmi_irq_init(struct device_node *node,
>>>> +                                 struct device_node *parent)
>>>> +{
>>>> +    return sunxi_sc_nmi_irq_init(node, &sun50i_reg_offs);
>>>> +}
>>>> +IRQCHIP_DECLARE(sun50i_nmi, "allwinner,sun50i-a64-r-intc",
>>>sun50i_nmi_irq_init);
>>>>
>>>
>>>Apart from the above:
>>>
>>>Acked-by: Marc Zyngier <marc.zyngier-5wv7dgnIgG8@public.gmane.org>
>>>
>>>Let me know how you want this to be merged.

This, and the previous dt bindings patch, can be merged through whatever
tree irqchip drivers are merged through. Is that Jason's irqchip tree?

We're mostly waiting on this before merging the remaining device tree
changes.


Thanks
ChenYu

>>
>> I think it can just go via IRQ subsystem.
>>
>>>
>>>Thanks,
>>>
>>>       M.
>>
>> --
>> You received this message because you are subscribed to the Google Group=
s "linux-sunxi" group.
>> To unsubscribe from this group and stop receiving emails from it, send a=
n email to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
>> For more options, visit https://groups.google.com/d/optout.

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
