From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: Re: [PATCH v3 3/3] reset: imx7: Add support for i.MX8MQ IP block variant
Date: Mon, 17 Dec 2018 09:09:31 -0800
Message-ID: <CAHQ1cqGO5bLOXM7sRAOkta3M7gemCDy5MtS3+kzXeLcTamrWWw@mail.gmail.com>
References: <20181217023827.7947-1-andrew.smirnov@gmail.com>
 <20181217023827.7947-4-andrew.smirnov@gmail.com> <AM0PR04MB42114239FC75F5514554B55280BC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <AM0PR04MB42114239FC75F5514554B55280BC0@AM0PR04MB4211.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, Fabio Estevam <fabio.estevam@nxp.com>, "cphealy@gmail.com" <cphealy@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, Leonard Crestez <leonard.crestez@nxp.com>, Richard Zhu <hongxing.zhu@nxp.com>, Rob Herring <robh@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Sun, Dec 16, 2018 at 8:30 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Andrey Smirnov [mailto:andrew.smirnov@gmail.com]
> > Sent: Monday, December 17, 2018 10:38 AM
> > To: linux-kernel@vger.kernel.org
> > Cc: Andrey Smirnov <andrew.smirnov@gmail.com>; p.zabel@pengutronix.de;
> > Fabio Estevam <fabio.estevam@nxp.com>; cphealy@gmail.com;
> > l.stach@pengutronix.de; Leonard Crestez <leonard.crestez@nxp.com>; Aisheng
> > Dong <aisheng.dong@nxp.com>; Richard Zhu <hongxing.zhu@nxp.com>; Rob
> > Herring <robh@kernel.org>; devicetree@vger.kernel.org; dl-linux-imx
> > <linux-imx@nxp.com>; linux-arm-kernel@lists.infradead.org
> > Subject: [PATCH v3 3/3] reset: imx7: Add support for i.MX8MQ IP block variant
> >
> > Add bits and pieces needed to support IP block variant found on i.MX8MQ
> > SoCs.
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
> >  drivers/reset/Kconfig      |   2 +-
> >  drivers/reset/reset-imx7.c | 106
> > +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 107 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig index
> > c21da9fe51ec..4909aab7401b 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -50,7 +50,7 @@ config RESET_HSDK
> >  config RESET_IMX7
> >       bool "i.MX7 Reset Driver" if COMPILE_TEST
> >       depends on HAS_IOMEM
> > -     default SOC_IMX7D
> > +     default SOC_IMX7D || SOC_IMX8MQ
>
> SOC_IMX8MQ has been removed in Shawn's tree.
> I'd suggest simply using ARCH_MXC.
>

Oh, that's right, will replace with (ARM64 && ARCH_MXC) in v4.

Thanks,
Andrey Smirnov
