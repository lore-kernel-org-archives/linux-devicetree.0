Return-Path: <SRS0=zP+k=QP=gmail.com=lznuaa@kernel.org>
MIME-Version: 1.0
References: <1549650743-27581-1-git-send-email-Frank.Li@nxp.com>
 <1549650743-27581-2-git-send-email-Frank.Li@nxp.com> <CAOMZO5A_WeCuvK-OLifQJk2xytOnhTRMdMVHbQqa1p3-Rk9O+g@mail.gmail.com>
In-Reply-To: <CAOMZO5A_WeCuvK-OLifQJk2xytOnhTRMdMVHbQqa1p3-Rk9O+g@mail.gmail.com>
From: Zhi Li <lznuaa@gmail.com>
Date: Fri, 8 Feb 2019 12:59:21 -0600
Message-ID: <CAHrpEqRj0-F8pT5zPrPh5pOzvKyxePVkrNZOc4N-hM_aZDGiXQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] arm64: dts: imx8qxp: added ddr performance monitor nodes
Content-Type: text/plain; charset="UTF-8"
To: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <frank.li@nxp.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, "will.deacon@arm.com" <will.deacon@arm.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx <linux-imx@nxp.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Aisheng Dong <aisheng.dong@nxp.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
List-ID: <devicetree@vger.kernel.org>

On Fri, Feb 8, 2019 at 12:44 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Frank,
>
> On Fri, Feb 8, 2019 at 4:32 PM Frank Li <frank.li@nxp.com> wrote:
> >
> > Add ddr performance monitor
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > index 4c3dd95..243d7b3 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
> > @@ -79,6 +79,13 @@
> >                 interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> >         };
> >
> > +       ddr_pmu0: ddr_pmu@5c020000 {
> > +               compatible = "fsl,imx8-ddr-pmu";
> > +               reg = <0x0 0x5c020000 0x0 0x10000>;
>
> In mainline tree this should be:
>
>  reg = <0x5c020000 0x10000>;

If it is true if under subsystem node. ddr pmu is the same level as
GIC.  So address should be 64bit

gic: interrupt-controller@51a00000 {
                compatible = "arm,gic-v3";
                reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
                      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base +
SGI_base) */
                #interrupt-cells = <3>;
                interrupt-controller;
                interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
        };


best regards
Frank Li
