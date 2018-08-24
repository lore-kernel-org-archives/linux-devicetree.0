From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
Date: Fri, 24 Aug 2018 09:06:49 +0000
Message-ID: <TY1PR01MB17707A80E98DE4602177C8EBC0360@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1535014731-64472-1-git-send-email-biju.das@bp.renesas.com>
 <1535014731-64472-5-git-send-email-biju.das@bp.renesas.com>
 <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180824090320.ib7zt4ae6kacjzlu@verge.net.au>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Simon Horman <horms@verge.net.au>, Biju Das <biju.das@bp.renesas.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

Thank you for your feedback!

> Subject: Re: [PATCH 4/5] arm64: dts: renesas: r8a774a1: Add Ethernet AVB node
>
> On Thu, Aug 23, 2018 at 09:58:50AM +0100, Biju Das wrote:
> > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> >
> > This patch adds the SoC specific part of the Ethernet AVB
> > device tree node.
> >
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 45 +++++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index 15d7785..b771211 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -350,6 +350,51 @@
> >  dma-channels = <16>;
> >  };
> >
> > +avb: ethernet@e6800000 {
> > +compatible = "renesas,etheravb-r8a774a1",
> > +     "renesas,etheravb-rcar-gen3";
> > +reg = <0 0xe6800000 0 0x800>;
>
> Should a region, <0 0xe6a00000 0 0x10000>, also be added
> here to describe the suggested space for descriptors?

There is no STBE (Stream Buffer for EthernetAVB-IF) on the r8a774a1, and that's why this node doesn't come with such a region.

Thanks,
Fab

>
> Otherwise the patch looks good to me.
>
> > +interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> > +     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> > +interrupt-names = "ch0", "ch1", "ch2", "ch3",
> > +  "ch4", "ch5", "ch6", "ch7",
> > +  "ch8", "ch9", "ch10", "ch11",
> > +  "ch12", "ch13", "ch14", "ch15",
> > +  "ch16", "ch17", "ch18", "ch19",
> > +  "ch20", "ch21", "ch22", "ch23",
> > +  "ch24";
> > +clocks = <&cpg CPG_MOD 812>;
> > +power-domains = <&sysc 32>;
> > +resets = <&cpg 812>;
> > +phy-mode = "rgmii";
> > +#address-cells = <1>;
> > +#size-cells = <0>;
> > +status = "disabled";
> > +};
> > +
> >  scif0: serial@e6e60000 {
> >  compatible = "renesas,scif-r8a774a1",
> >       "renesas,rcar-gen3-scif", "renesas,scif";
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
