From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v2 2/3] reset: imx7: Add support for i.MX8MQ IP block variant
Date: Tue, 11 Dec 2018 17:35:15 -0800
Message-ID: <CAHQ1cqHH5Vef1e7bXBXWQdSzmAOpwj1vdyG-t83PkRyLifVFuw@mail.gmail.com>
References: <20181128043738.12714-1-andrew.smirnov@gmail.com>
 <20181128043738.12714-3-andrew.smirnov@gmail.com> <20181211224349.GA30397@bogus>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181211224349.GA30397@bogus>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-imx@nxp.com, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Dec 11, 2018 at 2:43 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Nov 27, 2018 at 08:37:37PM -0800, Andrey Smirnov wrote:
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
> > ---
> >  drivers/reset/Kconfig                    |   2 +-
> >  drivers/reset/reset-imx7.c               | 106 +++++++++++++++++++++++
> >  include/dt-bindings/reset/imx8mq-reset.h |  64 ++++++++++++++
>
> This goes in the binding patch.

OK, I was following the precedent of the original submission:

https://lore.kernel.org/linux-arm-kernel/20170227205408.ajeu3stjpl45dnqf@rob-hp-laptop/

Will split and submit v3.

Thanks,
Andrey Smirnov
