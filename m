From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: imx8mm: Add SAI nodes
Date: Mon, 22 Apr 2019 22:09:25 +0300
Message-ID: <CAEnQRZAZ4b2ykdfMc-egdT6rbq+uxbqzC8RwQEcd_uRWY3UWmQ@mail.gmail.com>
References: <20190419202024.27314-1-daniel.baluta@nxp.com> <20190419202024.27314-2-daniel.baluta@nxp.com>
 <20190422024427.GU19962@dragon> <CAEnQRZAA9_Worz8taLC_zWanx2vdujb8YWqi+1VV99bRTueWow@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEnQRZAA9_Worz8taLC_zWanx2vdujb8YWqi+1VV99bRTueWow@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Shawn Guo <shawnguo@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>, Anson Huang <anson.huang@nxp.com>, Peng Fan <peng.fan@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, Jacky Bai <ping.bai@nxp.com>
List-Id: devicetree@vger.kernel.org

On Mon, Apr 22, 2019 at 9:51 AM Daniel Baluta <daniel.baluta@gmail.com> wrote:
>
> On Mon, Apr 22, 2019 at 5:45 AM Shawn Guo <shawnguo@kernel.org> wrote:
> >
> > On Fri, Apr 19, 2019 at 08:20:39PM +0000, Daniel Baluta wrote:
> > > i.MX8MM has 5 SAI instances with the following base
> > > addresses according to RM.
> > >
> > > SAI1 base address: 3001_0000h
> > > SAI2 base address: 3002_0000h
> > > SAI3 base address: 3003_0000h
> > > SAI5 base address: 3005_0000h
> > > SAI6 base address: 3006_0000h
> > >
> > > Signed-off-by: Bai Ping <ping.bai@nxp.com>
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > > ---
> > >  arch/arm64/boot/dts/freescale/imx8mm.dtsi | 68 +++++++++++++++++++++++
> > >  1 file changed, 68 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > index de3498c2dd44..e9a0b2b6063a 100644
> > > --- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
> > > @@ -171,6 +171,74 @@
> > >                       #size-cells = <1>;
> > >                       ranges;
> > >
> > > +                     sai1: sai@30010000 {
> > > +                             compatible = "fsl,imx8mq-sai",
> >
> > Should be "fsl,imx8mm-sai"?
>
> SAI IP on imx8mm is identical with the one on imx8mq. There is no need
> to differentiate with a compatible string.

On a second thought sai on i.MX8M is not compatible with SAI on i.MX6.
So, the correct
compatbile should be:

     compatible = "fsl,imx8mm-sai", "fsl,imx8mq-sai";

Will fix this in v2.
