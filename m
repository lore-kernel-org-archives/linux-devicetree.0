From: Dong Aisheng <dongas86@gmail.com>
Subject: Re: [PATCH 4/4] irq: imx: irqsteer: add multi output interrupts
 support
Date: Sun, 27 Jan 2019 22:02:57 +0800
Message-ID: <CAA+hA=SSP8eF6hikBgBqAxv29W4J2+szyvsLS2MXSMvxRv9wDw@mail.gmail.com>
References: <1547797668-30342-1-git-send-email-aisheng.dong@nxp.com>
 <1547797668-30342-5-git-send-email-aisheng.dong@nxp.com>
 <1548413675.28802.45.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1548413675.28802.45.camel@pengutronix.de>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Fri, Jan 25, 2019 at 6:55 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Freitag, den 18.01.2019, 07:53 +0000 schrieb Aisheng Dong:
> > One irqsteer channel can support up to 8 output interrupts.
> >
> > > Cc: Marc Zyngier <marc.zyngier@arm.com>
> > > Cc: Lucas Stach <l.stach@pengutronix.de>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> > ---
> >  drivers/irqchip/irq-imx-irqsteer.c | 39 +++++++++++++++++++++++++++-----------
> >  1 file changed, 28 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
> > index 1bebf0a..54802fa 100644
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
> > @@ -117,7 +121,7 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> > >     struct device_node *np = pdev->dev.of_node;
> > >     struct irqsteer_data *data;
> > >     struct resource *res;
> > > -   int ret;
> > > +   int i, ret;
> >
> > >     data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > >     if (!data)
> > @@ -130,12 +134,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> > >             return PTR_ERR(data->regs);
> > >     }
> >
> > > -   data->irq = platform_get_irq(pdev, 0);
> > > -   if (data->irq <= 0) {
> > > -           dev_err(&pdev->dev, "failed to get irq\n");
> > > -           return -ENODEV;
> > > -   }
> > -
> > >     data->ipg_clk = devm_clk_get(&pdev->dev, "ipg");
> > >     if (IS_ERR(data->ipg_clk)) {
> > >             ret = PTR_ERR(data->ipg_clk);
> > @@ -177,8 +175,23 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
> > >             return -ENOMEM;
> > >     }
> >
> > > -   irq_set_chained_handler_and_data(data->irq, imx_irqsteer_irq_handler,
> > > -                                    data);
> > +     data->irq_count = of_irq_count(np);
>
> We normally don't validate stuff that comes from the DT, but I guess it
> might be helpful to validate that the number of output irqs specified
> matches what the number of input irqs, i.e. there is one output irqs
> specified for each group of 64 inputs.
>

Sound like a good idea.
I think we can calculate the irq_count from irqs number instead of of_irq_count.
Then the following irq_of_parse_and_map() will validate them automatically.

However, i think we'd better to keep the irq_count range check as well.

> > +     if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
> > > +           clk_disable_unprepare(data->ipg_clk);
> > > +           return -EINVAL;
> > > +   }
> > +
> > > +   for (i = 0; i < data->irq_count; i++) {
> > > +           data->irq[i] = irq_of_parse_and_map(np, i);
> > > +           if (!data->irq[i]) {
> > > +                   clk_disable_unprepare(data->ipg_clk);
> > > +                   return -EINVAL;
> > > +           }
> > +
> > > +           irq_set_chained_handler_and_data(data->irq[i],
> > > +                                            imx_irqsteer_irq_handler,
> > +                                              data);
>
> We really want some data about the output irq being passed here, so we
> can cut down the number of register reads in the irq handler to the
> maximum of 2 status registers per group.
>

Will implement it and resend.

Regards
Dong Aisheng

> Regards,
> Lucas
