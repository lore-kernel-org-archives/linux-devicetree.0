From: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: imx8qxp: Add EDMA0/EDMA1 nodes
Date: Wed, 27 Mar 2019 10:51:22 +0200
Message-ID: <CAEnQRZCb=rZMdBYyYCSCQ3Dba5Nk43BvV6whHx-vNPmox-OOSw@mail.gmail.com>
References: <20190326094239.5910-1-daniel.baluta@nxp.com> <20190326094239.5910-3-daniel.baluta@nxp.com>
 <VI1PR04MB4222A8DBC2312E72AAD3AFAE805F0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <VI1PR04MB4222A8DBC2312E72AAD3AFAE805F0@VI1PR04MB4222.eurprd04.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aisheng Dong <aisheng.dong@nxp.com>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-linux-imx <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, Anson Huang <anson.huang@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "S.j. Wang" <shengjiu.wang@nxp.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Teo Hall <teo.hall@nxp.com>
List-Id: devicetree@vger.kernel.org

On Tue, Mar 26, 2019 at 3:31 PM Aisheng Dong <aisheng.dong@nxp.com> wrote:
>
> > From: Daniel Baluta
> > Sent: Tuesday, March 26, 2019 5:43 PM
> >
> > i.MX8QXP contains a total of 4 EDMA controllers of which two are primarily
> > for audio components and the other two are for non-audio periperhals.
> >
> > This patch adds the EDMA0/EDMA1 nodes used by audio peripherals.
> >
> > EDMA0 contains channels for:
> >       * ASRC0
> >       * ESAI0
> >       * SPDIF0
> >       * SAI0, SAI1, SAI2, SAI3
> >
> > EDMA1 contains channels for:
> >       * ASRC1
> >       * SAI4, SAI5
> >
> > See chapter Audio DMA Memory Maps (2.2.3) from i.MX8QXP RM [1]
> >
> > This patch is based on the dtsi file initially submitted by Teo Hall in i.MX NXP
> > internal tree.
> >
> > [1] https://www.nxp.com/docs/en/reference-manual/IMX8DQXPRM.pdf
> >
> > Cc: Teo Hall <teo.hall@nxp.com>
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 72
> > ++++++++++++++++++++++
> >  1 file changed, 72 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 0cb939861a60..9e959deb2499 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -182,6 +182,78 @@
> >                       #clock-cells = <1>;
> >               };
> >
> > +             edma0: dma-controller@591f0000 {
> > +                     compatible = "fsl,imx8qm-edma";

Thanks for the comment Aisheng!

>
> Should this be "fsl,imx8qxp-edma"?

Yes, I think that's the more clear approach although in
our internal tree the edma driver uses only the "fsl,imx8qm-edma
compatible.

I will go with your suggestion.


> or
> "fsl,imx8qxp-edma", "fsl,imx8qm-edma"?

One thing that it is not clear for me is why there are places
where we use two compatible strings?

I understand the situation where are two distinct drivers, but is there
any other reason to add multiple compatible strings for a node in dts?

thanks,
Daniel.
