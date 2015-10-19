From: chunfeng yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v10 3/3] arm64: dts: mediatek: add xHCI & usb phy for
 mt8173
Date: Mon, 19 Oct 2015 13:31:27 +0800
Message-ID: <1445232687.28324.4.camel@mhfsdcap03>
References: <1445140279-18121-1-git-send-email-chunfeng.yun@mediatek.com>
	 <1445140279-18121-4-git-send-email-chunfeng.yun@mediatek.com>
	 <56237BF2.5070809@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56237BF2.5070809-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sergei Shtylyov <sergei.shtylyov-M4DtvfQ/ZS1MRgGoP+s0PdBPR1lH4CV8@public.gmane.org>
Cc: Mathias Nyman <mathias.nyman-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Matthias Brugger <matthias.bgg-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Roger Quadros <rogerq-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-mediatek-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, John Crispin <blogic-p3rKhJxN3npAfugRpC6u6w@public.gmane.org>, Daniel Kurtz <djkurtz-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sun, 2015-10-18 at 14:01 +0300, Sergei Shtylyov wrote:
> Hello.
> 
> On 10/18/2015 6:51 AM, Chunfeng Yun wrote:
> 
> > add xHCI and phy drivers for MT8173-EVB
> >
> > Signed-off-by: Chunfeng Yun <chunfeng.yun-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> 
> [...]
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > index d18ee42..46f5f50 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> [...]
> > @@ -487,6 +488,47 @@
> >   			clock-names = "source", "hclk";
> >   			status = "disabled";
> >   		};
> > +
> > +		usb30: usb@11270000 {
> > +			compatible = "mediatek,mt8173-xhci";
> > +			reg = <0 0x11270000 0 0x1000>,
> > +			      <0 0x11280700 0 0x0100>;
> > +			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_LOW>;
> > +			power-domains = <&scpsys MT8173_POWER_DOMAIN_USB>;
> > +			clocks = <&topckgen CLK_TOP_USB30_SEL>,
> > +				 <&pericfg CLK_PERI_USB0>,
> > +				 <&pericfg CLK_PERI_USB1>;
> > +			clock-names = "sys_ck",
> > +				      "wakeup_deb_p0",
> > +				      "wakeup_deb_p1";
> > +			phys = <&phy_port0 PHY_TYPE_USB3>,
> > +			       <&phy_port1 PHY_TYPE_USB2>;
> > +			mediatek,syscon-wakeup = <&pericfg>;
> > +			status = "okay";
> > +		};
> > +
> > +		u3phy: usb-phy@11290000 {
> > +			compatible = "mediatek,mt8173-u3phy";
> > +			reg = <0 0x11290000 0 0x800>;
> > +			clocks = <&apmixedsys CLK_APMIXED_REF2USB_TX>;
> > +			clock-names = "u3phya_ref";
> > +			#address-cells = <2>;
> > +			#size-cells = <2>;
> > +			ranges;
> > +			status = "okay";
> 
>     Don't you need the "power-domains" prop here as well?
No, the power-domains of MAC and PHY are separated, but PHY's can't be
operated by software.

Thanks.
> 
> > +
> > +			phy_port0: port@11290800 {
> > +				reg = <0 0x11290800 0 0x800>;
> > +				#phy-cells = <1>;
> > +				status = "okay";
> > +			};
> > +
> > +			phy_port1: port@11291000 {
> > +				reg = <0 0x11291000 0 0x800>;
> > +				#phy-cells = <1>;
> > +				status = "okay";
> > +			};
> > +		};
> >   	};
> >   };
> >
> 
> MBR, Sergei
> 


--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
