From: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v2 05/10] arm: dts: mt7623: update pio, usb and crypto
 nodes
Date: Wed, 27 Sep 2017 11:22:51 +0800
Message-ID: <1506482571.14972.6.camel@mtkswgap22>
References: <cover.1506390597.git.ryder.lee@mediatek.com>
         <93734b87262a8305b67e989777dfa1297d66cee4.1506390597.git.ryder.lee@mediatek.com>
         <1506421025.5626.6.camel@mtksdaap41>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506421025.5626.6.camel@mtksdaap41>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yingjoe Chen <yingjoe.chen-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Cc: Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Erin Lo <erin.lo-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Tue, 2017-09-26 at 18:17 +0800, Yingjoe Chen wrote:
> On Tue, 2017-09-26 at 10:02 +0800, Ryder Lee wrote:
> > This patch updates pio, usb and crypto nodes to make them be consistent
> > with the binding documents.
> > 
> > Signed-off-by: Ryder Lee <ryder.lee-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >  arch/arm/boot/dts/mt7623.dtsi | 52 ++++++++++++++++++++++---------------------
> >  1 file changed, 27 insertions(+), 25 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> > index 381843e..9ec3767 100644
> > --- a/arch/arm/boot/dts/mt7623.dtsi
> > +++ b/arch/arm/boot/dts/mt7623.dtsi
> > @@ -226,21 +226,6 @@
> >  		#reset-cells = <1>;
> >  	};
> >  
> > -	pio: pinctrl@10005000 {
> > -		compatible = "mediatek,mt7623-pinctrl",
> > -			     "mediatek,mt2701-pinctrl";
> > -		reg = <0 0x1000b000 0 0x1000>;
> > -		mediatek,pctl-regmap = <&syscfg_pctl_a>;
> > -		pins-are-numbered;
> > -		gpio-controller;
> > -		#gpio-cells = <2>;
> > -		interrupt-controller;
> > -		interrupt-parent = <&gic>;
> > -		#interrupt-cells = <2>;
> > -		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
> > -			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
> > -	};
> > -
> >  	syscfg_pctl_a: syscfg@10005000 {
> >  		compatible = "mediatek,mt7623-pctl-a-syscfg", "syscon";
> >  		reg = <0 0x10005000 0 0x1000>;
> 
> 
> Hi Ryder,
> 
> pio node is special, it have 2 registers space.
> The address 10005000 is for PIO, it was accesed through syscfg_pctl_a
> regmap. The other one, 0x1000b000, is for EINT.
> 
> So,I think using address @10005000 is correct.
> 
> Joe.C
> 

Thanks for explanation. I'll revert this part to a previous state.

> 


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
