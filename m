From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 03/10] arm: dts: mt7623: add mt6323.dtsi file
Date: Wed, 2 Aug 2017 10:02:41 +0800
Message-ID: <1501639361.17690.21.camel@mtkswgap22>
References: <cover.1501486190.git.sean.wang@mediatek.com>
         <f92864cf04cc3ddde20f25d402d8e5d3d915b2a8.1501486190.git.sean.wang@mediatek.com>
         <1501638477.32089.20.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1501638477.32089.20.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, john-Pj+rj9U5foFAfugRpC6u6w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, 2017-08-02 at 09:47 +0800, Yingjoe Chen wrote:
> On Mon, 2017-07-31 at 15:36 +0800, sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org wrote:
> <...>
> > diff --git a/arch/arm/boot/dts/mt7623-evb.dts b/arch/arm/boot/dts/mt7623-evb.dts
> > index b60b41c..0686ad7 100644
> > --- a/arch/arm/boot/dts/mt7623-evb.dts
> > +++ b/arch/arm/boot/dts/mt7623-evb.dts
> > @@ -14,6 +14,7 @@
> >  
> >  /dts-v1/;
> >  #include "mt7623.dtsi"
> > +#include "mt6323.dtsi"
> >  
> >  / {
> >  	model = "MediaTek MT7623 evaluation board";
> > @@ -23,6 +24,24 @@
> >  		stdout-path = &uart2;
> >  	};
> >  
> > +	cpus {
> > +		cpu0 {
> > +			proc-supply = <&mt6323_vproc_reg>;
> > +		};
> > +
> > +		cpu1 {
> > +			proc-supply = <&mt6323_vproc_reg>;
> > +		};
> > +
> > +		cpu2 {
> > +			proc-supply = <&mt6323_vproc_reg>;
> > +		};
> > +
> > +		cpu3 {
> > +			proc-supply = <&mt6323_vproc_reg>;
> > +		};
> > +	};
> > +
> >  	memory {
> >  		reg = <0 0x80000000 0 0x40000000>;
> >  	};
> > @@ -31,3 +50,13 @@
> >  &uart2 {
> >  	status = "okay";
> >  };
> > +
> > +&mmc0 {
> > +	vmmc-supply = <&mt6323_vemc3v3_reg>;
> > +	vqmmc-supply = <&mt6323_vio18_reg>;
> > +};
> > +
> > +&mmc1 {
> > +	vmmc-supply = <&mt6323_vmch_reg>;
> > +	vqmmc-supply = <&mt6323_vmc_reg>;
> > +};
> 
> Please keep nodes sorted.
> 
> Joe.C
> 
> 

Hi, Joe.C

I will have note for this. Those would be fixed up along with following
patches when mt7623a dts is introduced.

	Sean







--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
