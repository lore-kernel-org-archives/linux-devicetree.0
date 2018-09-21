Return-Path: <SRS0=FcRA=MD=verge.net.au=horms@kernel.org>
Date: Fri, 21 Sep 2018 09:35:02 +0200
From: Simon Horman <horms@verge.net.au>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779{7|8}0: add TPU support
Message-ID: <20180921073501.fqqwwkzu5qukurzs@verge.net.au>
References: <fb4eb097-40aa-82df-68c7-9b727c858a8b@cogentembedded.com>
 <009bf131-c98e-df15-9c17-fb03c7bb09e2@cogentembedded.com>
 <da71d911-7115-f389-dcb3-1ccf1ef08d76@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da71d911-7115-f389-dcb3-1ccf1ef08d76@cogentembedded.com>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, Magnus Damm <magnus.damm@gmail.com>, Mark Rutland <mark.rutland@arm.com>
List-ID: <devicetree@vger.kernel.org>

On Wed, Sep 19, 2018 at 11:21:49PM +0300, Sergei Shtylyov wrote:
> On 09/19/2018 11:02 PM, Sergei Shtylyov wrote:
> 
> > Describe TPU in the R8A779{7|8}0 device trees.
> > 
> > Based on the original (and large) patches by Vladimir Barinov.
> > 
> > Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > ---
> > This patch is against the 'renesas-devel-20180919-v4.19-rc4' branch of
> > Simon Horman's 'renesas.git' repo.
> > 
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi |    8 ++++++++
> >  arch/arm64/boot/dts/renesas/r8a77980.dtsi |    9 +++++++++
> >  2 files changed, 17 insertions(+)
> > 
> > Index: renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > ===================================================================
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77970.dtsi
> > @@ -614,6 +614,14 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		tpu: pwm@e6e80000 {
> > +			compatible = "renesas,tpu-r8a77970", "renesas,tpu";
> 
>   Oops, forgot to document the SoC specific binding...

I'm still not seeing the binding in my inbox.
Could you post it or point me to a link to it?

> 
> > +			reg = <0 0xe6e80000 0 0x100>;

This register range seems a little small.
>From my reading of the documentation 0x148 would be a more obvious choice.
Is the driver only accessing registers in in the 0x100 range for some
reason?

> > +			clocks = <&cpg CPG_MOD 304>;
> > +			power-domains = <&sysc R8A77970_PD_ALWAYS_ON>;
> > +			#pwm-cells = <4>;
> > +			status = "disabled";
> > +		};
> >  
> >  		vin0: video@e6ef0000 {
> >  			compatible = "renesas,vin-r8a77970";
> > Index: renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > ===================================================================
> > --- renesas.orig/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > +++ renesas/arch/arm64/boot/dts/renesas/r8a77980.dtsi
> > @@ -666,6 +666,15 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		tpu: pwm@e6e80000 {
> > +			compatible = "renesas,tpu-r8a7798", "renesas,tpu";
> 
>    Same here. Plus forgot a zero at the end. :-/
> 
> > +			reg = <0 0xe6e80000 0 0x100>;
> > +			clocks = <&cpg CPG_MOD 304>;
> > +			power-domains = <&sysc R8A77980_PD_ALWAYS_ON>;
> > +			#pwm-cells = <4>;
> > +			status = "disabled";
> > +		};
> > +
> >  		vin0: video@e6ef0000 {
> >  			compatible = "renesas,vin-r8a77980";
> >  			reg = <0 0xe6ef0000 0 0x1000>;
> > 
> 
> MBR, Sergei
> 
