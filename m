From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
Date: Thu, 27 Sep 2018 10:53:41 +0000
Message-ID: <TY1PR01MB1770B42824076BF5C57F12DDC0140@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1536576195-11520-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1536576195-11520-4-git-send-email-fabrizio.castro@bp.renesas.com>
 <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180911133220.3kjx5dqp65drx3qs@verge.net.au>
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
To: Simon Horman <horms@verge.net.au>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Magnus Damm <magnus.damm@gmail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Biju Das <biju.das@bp.renesas.com>, "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: devicetree@vger.kernel.org

Hello Simon,

> Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: r8a774a1: Add CAN nodes
>
> On Mon, Sep 10, 2018 at 11:43:15AM +0100, Fabrizio Castro wrote:
> > From: Chris Paterson <chris.paterson2@renesas.com>
> >
> > Add the device nodes for both RZ/G2M CAN channels.
> >
> > Signed-off-by: Chris Paterson <chris.paterson2@renesas.com>
> > Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> > ---
> >
> > v1->v2:
> > * replaced "renesas,rzg-gen2-can" with "renesas,rcar-gen3-can" as per
> >   Geert's comment.
> >
> > This patch applies on top of renesas-devel-20180906-v4.19-rc2.
>
> Thanks Fabrizio,
>
> I would like to waif for the bindings to be accepted before accepting this
> patch.

Marc has taken the bindings, I guess we can unblock this patch now?

Thanks,
Fab

>
> >
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > index 046fc93..867e875 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> > @@ -874,6 +874,30 @@
> >  status = "disabled";
> >  };
> >
> > +can0: can@e6c30000 {
> > +compatible = "renesas,can-r8a774a1",
> > +     "renesas,rcar-gen3-can";
> > +reg = <0 0xe6c30000 0 0x1000>;
> > +interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks = <&cpg CPG_MOD 916>, <&can_clk>;
> > +clock-names = "clkp1", "can_clk";
> > +power-domains = <&sysc 32>;
> > +resets = <&cpg 916>;
> > +status = "disabled";
> > +};
> > +
> > +can1: can@e6c38000 {
> > +compatible = "renesas,can-r8a774a1",
> > +     "renesas,rcar-gen3-can";
> > +reg = <0 0xe6c38000 0 0x1000>;
> > +interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
> > +clocks = <&cpg CPG_MOD 915>, <&can_clk>;
> > +clock-names = "clkp1", "can_clk";
> > +power-domains = <&sysc 32>;
> > +resets = <&cpg 915>;
> > +status = "disabled";
> > +};
> > +
> >  pwm0: pwm@e6e30000 {
> >  compatible = "renesas,pwm-r8a774a1", "renesas,pwm-rcar";
> >  reg = <0 0xe6e30000 0 0x8>;
> > --
> > 2.7.4
> >



Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, Buckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered No. 04586709.
