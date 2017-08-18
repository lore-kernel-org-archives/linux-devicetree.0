From: Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH] arm64: dts: ls1088a: Add USB support
Date: Fri, 18 Aug 2017 16:03:57 +0800
Message-ID: <20170818080355.GK7608@dragon>
References: <1502938358-23522-1-git-send-email-yinbo.zhu@nxp.com>
 <20170817140232.GE7608@dragon>
 <VI1PR04MB1262662395B8CD06BAF074CFE9800@VI1PR04MB1262.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <VI1PR04MB1262662395B8CD06BAF074CFE9800-mr6QIVyDiCGbtYzA8xQqo89NdZoXdze2vxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yinbo Zhu <yinbo.zhu-3arQi8VN3Tc@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Harninder Rai <harninder.rai-3arQi8VN3Tc@public.gmane.org>, Andy Tang <andy.tang-3arQi8VN3Tc@public.gmane.org>, "open list:" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Ashish Kumar <ashish.kumar-3arQi8VN3Tc@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org" <linux-devel-XDVM779Km55Y1YpKYGMr2+TW4wlIGRCZ@public.gmane.org>, Raghav Dogra <raghav.dogra-3arQi8VN3Tc@public.gmane.org>, "moderated list:" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Aug 18, 2017 at 07:48:19AM +0000, Yinbo Zhu wrote:
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > index 3a3be87..0dbff29 100644
> > --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
> > @@ -458,6 +458,24 @@
> >  			status = "disabled";
> >  		};
> >  
> > +		usb0: usb3@3100000 {
> > +			compatible = "snps,dwc3";
> > +			reg = <0x0 0x3100000 0x0 0x10000>;
> > +			interrupts = <0 80 0x4>; /* Level high type */
> 
> Use IRQ_TYPE_LEVEL_HIGH, so that you can save the comment.
> 
> > +			dr_mode = "host";
> > +			configure-gfladj;
> 
> What is this?  I do not see it in upstream kernel.
> 
> > +			snps,dis_rxdet_inp3_quirk;
> 
> You probably need a "disabled" status.
> 
> Shawn
> 
> Hi Shawn,
> 
>  About your description " You probably need a "disabled" status."
>  Your meaning is that remove the property "snps,dis_rxdet_inp3_quirk;", isn't it?
>  In fact, if remove the property , 1088ardb usb will doesn't detect.

No, that's not what I meant.  I meant the USB device should be disabled
by default in <soc>.dtsi by having the following line.

	status = "disabled";

And then if your board has the pin-out of this USB device, you have the
line below to turn on the support.

	status = "okay";

Shawn
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
