From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH V2 4/4] irq: imx: irqsteer: add multi output interrupts support
Date: Wed, 30 Jan 2019 22:03:20 +0800
Message-ID: <CAA+hA=Q79RcUk=epBighR_jZCLxaNzRvc9Lukzrzby_Av6d9wQ@mail.gmail.com>
References: <1548853196-11447-1-git-send-email-aisheng.dong@nxp.com>
 <1548853196-11447-5-git-send-email-aisheng.dong@nxp.com> <1548855138.6869.27.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548855138.6869.27.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 30, 2019 at 9:33 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, den 30.01.2019, 13:06 +0000 schrieb Aisheng Dong:
> > One irqsteer channel can support up to 8 output interrupts.
> >
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> > ChangeLog:
> > v1->v2:
> >  * calculate irq_count by fsl,num-irqs instead of parsing interrupts
> >    property from devicetree to match the input interrupts and outputs
> >  * improve output interrupt handler by searching only two registers
> >    withint the same group
> > ---
> >  drivers/irqchip/irq-imx-irqsteer.c | 76 +++++++++++++++++++++++++++++-=
--------
> >  1 file changed, 59 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-i=
mx-irqsteer.c
> > index 67ed862..cc40039 100644
> > --- a/drivers/irqchip/irq-imx-irqsteer.c
> > +++ b/drivers/irqchip/irq-imx-irqsteer.c
> > @@ -10,6 +10,7 @@
> >  #include <linux/irqchip/chained_irq.h>
> >  #include <linux/irqdomain.h>
> >  #include <linux/kernel.h>
> > +#include <linux/of_irq.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/spinlock.h>
> >
> > @@ -21,10 +22,13 @@
> > >  #define CHAN_MINTDIS(t)            (CTRL_STRIDE_OFF(t, 3) + 0x4)
> > >  #define CHAN_MASTRSTAT(t)  (CTRL_STRIDE_OFF(t, 3) + 0x8)
> >
> > > +#define CHAN_MAX_OUTPUT_INT        0x8
> > +
> >  struct irqsteer_data {
> > > >   void __iomem            *regs;
> > > >   struct clk              *ipg_clk;
> > > > - int                     irq;
> > > > + int                     irq[CHAN_MAX_OUTPUT_INT];
> > > > + int                     irq_count;
> > > >   raw_spinlock_t          lock;
> > > >   int                     reg_num;
> > > >   int                     channel;
> > @@ -87,26 +91,45 @@ static const struct irq_domain_ops imx_irqsteer_dom=
ain_ops =3D {
> > > >   .xlate          =3D irq_domain_xlate_onecell,
> >  };
> >
> > +static int imx_irqsteer_get_hwirq_base(struct irqsteer_data *data, u32=
 irq)
> > +{
> > > +   int i;
> > +
> > > +   for (i =3D 0; i < data->irq_count; i++) {
> > > +           if (data->irq[i] =3D=3D irq)
> > +                     break;
>
> return i * 64; here...
> > +     }
> > +
> > +     return i * 64;
>
> ... and -EINVAL or something here, so we don't return a out of bounds
> hwirq base if the loop ever doesn't match something?
>

Good suggestion, will add it.

> > +}
> > +
> >  static void imx_irqsteer_irq_handler(struct irq_desc *desc)
> >  {
> > >     struct irqsteer_data *data =3D irq_desc_get_handler_data(desc);
> > > +   int hwirq;
> > >     int i;
> >
> > >     chained_irq_enter(irq_desc_get_chip(desc), desc);
> >
> > > -   for (i =3D 0; i < data->reg_num * 32; i +=3D 32) {
> > > -           int idx =3D imx_irqsteer_get_reg_index(data, i);
> > > +   hwirq =3D imx_irqsteer_get_hwirq_base(data, irq_desc_get_irq(desc=
));
> > +
> > > +   for (i =3D 0; i < 2; i++) {
> > > +           int idx =3D imx_irqsteer_get_reg_index(data, hwirq);
> > >             unsigned long irqmap;
> > >             int pos, virq;
> >
> > > +           if (hwirq >=3D data->reg_num * 32)
> > > +                   break;
> > +
> > >             irqmap =3D readl_relaxed(data->regs +
> > >                                    CHANSTATUS(idx, data->reg_num));
> >
> > >             for_each_set_bit(pos, &irqmap, 32) {
> > > -                   virq =3D irq_find_mapping(data->domain, pos + i);
> > +                     virq =3D irq_find_mapping(data->domain, pos + hwi=
rq);
>
> The irq index calculation need to be "pos + i * 32 + hwirq", otherwise
> this will map to the wrong virqs for the second register in each group.
>

For second register map, hwirq will plus 32 in next round.
So i can't see this will map a wrong virqs.
And it looks to me ""pos + i * 32 + hwirq" is equal to "hwirq + 32".
Am i missed something?

> >                       if (virq)
> > >                             generic_handle_irq(virq);
> > >             }
> > +             hwirq +=3D 32;
>
> Could be folded into the loop head.
>

You mean =E2=80=9Cfor (i =3D 0; i < 2; i++, hwirq +=3D32)=E2=80=9D ?
I feel that's not quite necessary.

> >       }
> >
> > >     chained_irq_exit(irq_desc_get_chip(desc), desc);
> > @@ -117,7 +140,8 @@ static int imx_irqsteer_probe(struct platform_devic=
e *pdev)
> > >     struct device_node *np =3D pdev->dev.of_node;
> > >     struct irqsteer_data *data;
> > >     struct resource *res;
> > > -   int ret;
> > > +   u32 irqs_num;
> > > +   int i, ret;
> >
> > >     data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > >     if (!data)
> > @@ -130,12 +154,6 @@ static int imx_irqsteer_probe(struct platform_devi=
ce *pdev)
> > >             return PTR_ERR(data->regs);
> > >     }
> >
> > > -   data->irq =3D platform_get_irq(pdev, 0);
> > > -   if (data->irq <=3D 0) {
> > > -           dev_err(&pdev->dev, "failed to get irq\n");
> > > -           return -ENODEV;
> > > -   }
> > -
> > >     data->ipg_clk =3D devm_clk_get(&pdev->dev, "ipg");
> > >     if (IS_ERR(data->ipg_clk)) {
> > >             ret =3D PTR_ERR(data->ipg_clk);
> > @@ -146,11 +164,17 @@ static int imx_irqsteer_probe(struct platform_dev=
ice *pdev)
> >
> > >     raw_spin_lock_init(&data->lock);
> >
> > > -   of_property_read_u32(np, "fsl,num-irqs", &data->reg_num);
> > > +   of_property_read_u32(np, "fsl,num-irqs", &irqs_num);
> > >     of_property_read_u32(np, "fsl,channel", &data->channel);
> >
> > > -   /* one register bit map represents 32 input interrupts */
> > > -   data->reg_num /=3D 32;
> > > +   /*
> > +      * There is one output irqs for each group of 64 inputs.
>
> "irq", singular.
>

Got it

> > +      * One register bit map can represent 32 input interrupts.
> > > +    */
> > > +   data->irq_count =3D irqs_num / 64;
> > > +   if (irqs_num % 64)
> > +             data->irq_count +=3D 1;
>
> This is a weird way of writing DIV_ROUND_UP.
>

Good suggestion

> > +     data->reg_num =3D irqs_num / 32;
> >
> > >     if (IS_ENABLED(CONFIG_PM_SLEEP)) {
> > >             data->saved_reg =3D devm_kzalloc(&pdev->dev,
> > @@ -177,8 +201,22 @@ static int imx_irqsteer_probe(struct platform_devi=
ce *pdev)
> > >             return -ENOMEM;
> > >     }
> >
> > > -   irq_set_chained_handler_and_data(data->irq, imx_irqsteer_irq_hand=
ler,
> > > -                                    data);
> > > +   if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> > > +           clk_disable_unprepare(data->ipg_clk);
> > > +           return -EINVAL;
> > > +   }
> > +
> > > +   for (i =3D 0; i < data->irq_count; i++) {
> > > +           data->irq[i] =3D irq_of_parse_and_map(np, i);
> > > +           if (!data->irq[i]) {
> > > +                   clk_disable_unprepare(data->ipg_clk);
> > +                     return -EINVAL;
>
> With a lot of failure paths now replicating the clk_disable_unprepare,
> return error, I think this warrants a common cleanup path that all
> those paths could reach via simple goto.
>

Sound goods to me

Regards
Dong Aisheng

> > +             }
> > +
> > > +           irq_set_chained_handler_and_data(data->irq[i],
> > > +                                            imx_irqsteer_irq_handler=
,
> > > +                                            data);
> > > +   }
> >
> > >     platform_set_drvdata(pdev, data);
> >
> > @@ -188,8 +226,12 @@ static int imx_irqsteer_probe(struct platform_devi=
ce *pdev)
> >  static int imx_irqsteer_remove(struct platform_device *pdev)
> >  {
> > >     struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev=
);
> > > +   int i;
> > +
> > > +   for (i =3D 0; i < irqsteer_data->irq_count; i++)
> > > +           irq_set_chained_handler_and_data(irqsteer_data->irq[i],
> > > +                                            NULL, NULL);
> >
> > > -   irq_set_chained_handler_and_data(irqsteer_data->irq, NULL, NULL);
> > >     irq_domain_remove(irqsteer_data->domain);
> >
> > >     clk_disable_unprepare(irqsteer_data->ipg_clk);
