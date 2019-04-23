From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH v2 1/2] arm64: dts: imx8mm: Add SAI nodes
Date: Tue, 23 Apr 2019 09:16:26 +0300
Message-ID: <CAEnQRZA=Ko+hebpCpFAvBMiAtFr8o1m+oktpOpDJh2pkmiEk6A@mail.gmail.com>
References: <20190422193542.2853-1-daniel.baluta@nxp.com> <20190422193542.2853-2-daniel.baluta@nxp.com>
 <20190423052022.orwkfjy6ftqmjq5p@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190423052022.orwkfjy6ftqmjq5p@pengutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, Aisheng Dong <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

On Tue, Apr 23, 2019 at 8:21 AM Marco Felsch <m.felsch@pengutronix.de> wrote:
>
> Hi Daniel,
>
> On 19-04-22 19:35, Daniel Baluta wrote:
> > i.MX8MM has 5 SAI instances with the following base
> > addresses according to RM.
> >
> > SAI1 base address: 3001_0000h
> > SAI2 base address: 3002_0000h
> > SAI3 base address: 3003_0000h
> > SAI5 base address: 3005_0000h
> > SAI6 base address: 3006_0000h
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 71 +++++++++++++++++++++++
> >  1 file changed, 71 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > index de3498c2dd44..4d080dc47216 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > @@ -171,6 +171,77 @@
> >                       #size-cells = <1>;
> >                       ranges;
> >
> > +                     sai1: sai@30010000 {
> > +                             compatible = "fsl,imx8mm-sai",
> > +                                             "fsl,imx8mq-sai";
>
> Just a nitpick but I would not break this line here. This applies to the
> other sai nodes too.

Yes, I thought about this and I think I will fix it as you say also I get past
the 80 chars limit.
