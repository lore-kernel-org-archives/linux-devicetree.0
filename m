From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v3 5/5] arm64: dts: mediatek: add xHCI & usb phy for
 mt8173
Date: Sun, 26 Jul 2015 10:41:22 +0800
Message-ID: <1437878482.3040.6.camel@mhfsdcap03>
References: <1437573945-31586-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1437573945-31586-6-git-send-email-chunfeng.yun@mediatek.com>
	 <55AFDCE6.2060608@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55AFDCE6.2060608-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

hi
On Wed, 2015-07-22 at 21:11 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 07/22/2015 05:05 PM, Chunfeng Yun wrote:
> 
> > add xHCI and phy drivers for MT8173-EVB
> 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173-evb.dts | 15 ++++++++++++++
> >   arch/arm64/boot/dts/mediatek/mt8173.dtsi    | 31 +++++++++++++++++++++++++++++
> >   2 files changed, 46 insertions(+)
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> > index f433c21..202b2b9 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
> > @@ -13,6 +13,7 @@
> >    */
> >
> >   /dts-v1/;
> > +#include <dt-bindings/gpio/gpio.h>
> >   #include "mt8173.dtsi"
> >
> >   / {
> > @@ -32,6 +33,15 @@
> >   	};
> >
> >   	chosen { };
> > +
> > +	usb_p1_vbus: fixedregulator@0 {
> 
>     Just "regulator@0" please. This is more in line with what ePAPR requires 
> from the node names.
> 
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "usb_vbus";
> > +		regulator-min-microvolt = <5000000>;
> > +		regulator-max-microvolt = <5000000>;
> > +		gpio = <&pio 130 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +	};
> >   };
> >
> >   &pwrap {
> [...]
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index 0696f8f..aa1ecc7 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> [...]
> > @@ -393,6 +394,36 @@
> >   			#size-cells = <0>;
> >   			status = "disabled";
> >   		};
> > +
> > +		usb: usb30@11270000 {
> 
>     ePAPR standardizes the name "usb" for such nodes, please fix.
> 
> [...]
> 
ok, I'll revise it, thanks a lot

> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
