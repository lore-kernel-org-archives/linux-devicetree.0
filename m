Return-Path: <SRS0=3//v=L2=verge.net.au=horms@kernel.org>
Date: Wed, 12 Sep 2018 11:39:50 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add TMU support
Message-ID: <20180912093949.dbxaerbvpqzxdgnk@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <a3846f74-78b4-bf4a-9231-961c5b16091c@cogentembedded.com>
 <20180910092305.4nqdm43ugvuay52o@verge.net.au>
 <298e7c6a-582f-d281-2f9f-003335b21b4a@cogentembedded.com>
 <20180911133617.cz3hgexltc5qy5f3@verge.net.au>
 <77189c6b-36cd-c6bb-2191-4063f77dd0ee@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77189c6b-36cd-c6bb-2191-4063f77dd0ee@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Geert Uytterhoeven <geert+renesas@glider.be>
List-ID: <devicetree@vger.kernel.org>

On Tue, Sep 11, 2018 at 09:35:50PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 09/11/2018 04:36 PM, Simon Horman wrote:
> 
> >>>> Describe TMUs in the R8A779{7|8}0 device trees.
> >>>>
> >>>> Based on the original (and large) patches by Vladimir Barinov.
> >>>>
> >>>> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> >>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> >>>>
> >>>> ---
> >>>> This patch is against the 'renesas-devel-20180906-v4.19-rc2' branch of
> >>>> Simon Horman's 'renesas.git' repo plus the R8A779{7|8}0 DT patch adding
> >>>> the CMT support).
> >>>>
> >>>> The R8A779{7|8}0 TMU DT binding update have been just posted...
> >>>>
> >>>>  arch/arm64/boot/dts/renesas/r8a77970.dtsi |   66 ++++++++++++++++++++++++++++++
> >>>>  arch/arm64/boot/dts/renesas/r8a77980.dtsi |   66 ++++++++++++++++++++++++++++++
> >>>>  2 files changed, 132 insertions(+)
> >>>>
> >>>> Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> >>>> ===================================================================
> >>>> --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> >>>> +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> >>>> @@ -316,6 +316,72 @@
> >>>>  			resets = <&cpg 407>;
> >>>>  		};
> >>>>  
> >>>> +		tmu0: timer@e61e0000 {
> >>>> +			compatible = "renesas,tmu-r8a77970", "renesas,tmu";
> >>>> +			reg = <0 0xe61e0000 0 0x30>;
> >>>> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +			clocks = <&cpg CPG_MOD 125>;
> >>>> +			clock-names = "fck";
> >>>> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >>>> +			resets = <&cpg 125>;
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		tmu1: timer@e6fc0000 {
> >>>> +			compatible = "renesas,tmu-r8a77970", "renesas,tmu";
> >>>> +			reg = <0 0xe6fc0000 0 0x30>;
> >>>> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +			clocks = <&cpg CPG_MOD 124>;
> >>>> +			clock-names = "fck";
> >>>> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >>>> +			resets = <&cpg 124>;
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		tmu2: timer@e6fd0000 {
> >>>> +			compatible = "renesas,tmu-r8a77970", "renesas,tmu";
> >>>> +			reg = <0 0xe6fd0000 0 0x30>;
> >>>> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >>>
> >>> Should GIC_SPI 306 also be here for TMU 2 channel 3?> 
> >>> And likewise for the r8a77980 (V3H)
> >>
> >>    There are only 3 channels per TMU according to the beginning of the TMU chapter.
> >>
> >>> The documentation seems inconsistent as I see this listed in the
> >>> interrupt controller documentation. But I do not see that channel
> >>> documented in the TMU documentation.
> >>
> >>    Right!
> >>
> >>>> +			clocks = <&cpg CPG_MOD 123>;
> >>>> +			clock-names = "fck";
> >>>> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >>>> +			resets = <&cpg 123>;
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		tmu3: timer@e6fe0000 {
> >>>> +			compatible = "renesas,tmu-r8a7797", "renesas,tmu";
> >>>> +			reg = <0 0xe6fe0000 0 0x30>;
> >>>> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
> >>>> +			clocks = <&cpg CPG_MOD 122>;
> >>>> +			clock-names = "fck";
> >>>> +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> >>>> +			resets = <&cpg 122>;
> >>>> +			status = "disabled";
> >>>> +		};
> >>>> +
> >>>> +		tmu4: timer@ffc00000 {
> >>>> +			compatible = "renesas,tmu-r8a7797", "renesas,tmu";
> >>>> +			reg = <0 0xffc00000 0 0x30>;
> >>>> +			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> >>>> +				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>;
> >>>
> >>> Should GIC_SPI 369 for TMU 4 channel 3 be present not here for
> >>> the r8a77970 (V3M) but rather below for the r8a77980 (V3H) ?
> >>
> >>    I don't think it should be pesent in either place, and I thought I had removed
> >> the 4th IRQ from every node before posting... :-/
> >>
> >>> As per my note above, the documentation seems inconsistent here.
> >>
> >>    Yes.
> > 
> > Lets go with no 4th IRQ anywhere :)
> 
>    After having studied the manual, 4th IRQ might have sometging to do with the input capture channel capability which uses an extra IRQ output.
> 
> > Could you send an updated patch?
> 
>    Sure. I'll verify and repost.

Geert seems to want us to consider this further.

As DT describes hardware it seems reasonable that we should describe the
TMU device fully in DT, including all IRQs. But it seems to me that the
documentation may not be consistent enough to judge how to do that.
So perhaps a way forwards is to seek clarification of the documentation?
