From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH 1/3] arm: dts: mt2701: Add ethernet device node
Date: Wed, 14 Jun 2017 11:08:28 +0800
Message-ID: <1497409708.21216.2.camel@mtkswgap22>
References: <1496297324-21091-1-git-send-email-erin.lo@mediatek.com>
         <1496297324-21091-2-git-send-email-erin.lo@mediatek.com>
         <d0a1217b-7761-fea6-888a-da06573400b8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <d0a1217b-7761-fea6-888a-da06573400b8-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, srv_heupstream-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Fri, 2017-06-09 at 10:22 +0200, Matthias Brugger wrote:
> 
> On 01/06/17 08:08, Erin Lo wrote:
> > From: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > 
> > Add ethernet device node for MT2701
> > 
> > Signed-off-by: Sean Wang <sean.wang-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > Signed-off-by: Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm/boot/dts/mt2701.dtsi | 20 ++++++++++++++++++++
> >   1 file changed, 20 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
> > index 8037210..de88bd7 100644
> > --- a/arch/arm/boot/dts/mt2701.dtsi
> > +++ b/arch/arm/boot/dts/mt2701.dtsi
> > @@ -420,6 +420,26 @@
> >   		#clock-cells = <1>;
> >   	};
> >   
> > +	eth: ethernet@1b100000 {
> > +		compatible = "mediatek,mt2701-eth", "syscon";
> > +		reg = <0 0x1b100000 0 0x20000>;
> > +		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 199 IRQ_TYPE_LEVEL_LOW>,
> > +			     <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
> > +		clocks = <&topckgen CLK_TOP_ETHIF_SEL>,
> > +			 <&ethsys CLK_ETHSYS_ESW>,
> > +			 <&ethsys CLK_ETHSYS_GP1>,
> > +			 <&ethsys CLK_ETHSYS_GP2>,
> > +			 <&apmixedsys CLK_APMIXED_TRGPLL>;
> > +		clock-names = "ethif", "esw", "gp1", "gp2", "trgpll";
> > +		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
> > +		mediatek,ethsys = <&ethsys>;
> > +		mediatek,pctl = <&syscfg_pctl_a>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		status = "disabled";
> > +	};
> > +
> 
> I'm missing the reset properties.


Hi Matthias,

Appreciate your careful reviewing, 

I'll add it for the missing which causes binding violation. 


	Sean

> 
> Regards,
> Matthias


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
