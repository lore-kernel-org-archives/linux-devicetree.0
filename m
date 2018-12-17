From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: reset: imx7: Document usage on
 i.MX8MQ SoCs
Date: Sun, 16 Dec 2018 23:39:44 -0800
Message-ID: <CAHQ1cqEx=jh86AkOhqiOmEcu51x-FMujFAsMiGgq5=6atvUXZw@mail.gmail.com>
References: <20181217023827.7947-1-andrew.smirnov@gmail.com>
 <20181217023827.7947-3-andrew.smirnov@gmail.com> <871s6gahvh.fsf@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <871s6gahvh.fsf@tkos.co.il>
Sender: linux-kernel-owner@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "A.s. Dong" <aisheng.dong@nxp.com>, Rob Herring <robh@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-imx@nxp.com, Philipp Zabel <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, Leonard Crestez <leonard.crestez@nxp.com>, Chris Healy <cphealy@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 9:03 PM Baruch Siach <baruch@tkos.co.il> wrote:
>
> Hi Andrey,
>
> Andrey Smirnov writes:
> > The driver now supports i.MX8MQ, so update bindings accordingly.
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
> >  .../bindings/reset/fsl,imx7-src.txt           |  7 +-
> >  include/dt-bindings/reset/imx8mq-reset.h      | 64 +++++++++++++++++++
>
> This header file belongs at the next patch in this series, right?
>

I was asked to move it here, see lkml.kernel.org/r/20181211224349.GA30397@bogus

Thanks,
Andrey Smirnov
