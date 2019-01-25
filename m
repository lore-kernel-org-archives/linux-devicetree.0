From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v5 3/3] reset: imx7: Add support for i.MX8MQ IP block variant
Date: Thu, 24 Jan 2019 16:21:24 -0800
Message-ID: <CAHQ1cqFx3b2fTy8YbpwC0fGJYpO4BLO4FW9q-Z2Np1tVktrKpg@mail.gmail.com>
References: <20190122021043.25449-1-andrew.smirnov@gmail.com>
 <20190122021043.25449-4-andrew.smirnov@gmail.com> <1548240560.3904.6.camel@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1548240560.3904.6.camel@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, "A.s. Dong" <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-kernel <linux-kernel@vger.kernel.org>
List-Id: devicetree@vger.kernel.org

On Wed, Jan 23, 2019 at 2:49 AM Philipp Zabel <p.zabel@pengutronix.de> wrote:
>
> Hi Andrey,
>
> On Mon, 2019-01-21 at 18:10 -0800, Andrey Smirnov wrote:
> > Add bits and pieces needed to support IP block variant found on
> > i.MX8MQ SoCs.
> >
> > Cc: p.zabel@pengutronix.de
> > Cc: Fabio Estevam <fabio.estevam@nxp.com>
> > Cc: cphealy@gmail.com
> > Cc: l.stach@pengutronix.de
> > Cc: Leonard Crestez <leonard.crestez@nxp.com>
> > Cc: "A.s. Dong" <aisheng.dong@nxp.com>
> > Cc: Richard Zhu <hongxing.zhu@nxp.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: linux-imx@nxp.com
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> [...]
> > +static int imx8mq_reset_assert(struct reset_controller_dev *rcdev,
> > +                          unsigned long id)
>                             ^
> > +{
> > +     return imx8mq_reset_set(rcdev, id, true);
> > +}
> > +
> > +static int imx8mq_reset_deassert(struct reset_controller_dev *rcdev,
> > +                            unsigned long id)
>                               ^
> > +{
> > +     return imx8mq_reset_set(rcdev, id, false);
> > +}
>
> Thank you, applied all three to reset/next with a small whitespace
> alignment fix.
>

Thanks again for applying this stuff. If that's not too much to ask,
would you mind creating an immutable branch, so I could start sending
patches that depend on "dt-bindings/reset/imx8mq-reset.h" to i.MX tree
without waiting for it to trickle down? If not, no worries, I'll wait.

Thanks,
Andrey Smirnov
