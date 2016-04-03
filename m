From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 06/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos5250
Date: Sun, 3 Apr 2016 11:56:33 +0900
Message-ID: <20160403025633.GA3789__9433.57523433424$1459652632$gmane$org@kozik-lap>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
 <1459493874-2366-6-git-send-email-k.kozlowski@samsung.com>
 <56FEAE29.6010405@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56FEAE29.6010405-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Fri, Apr 01, 2016 at 01:21:45PM -0400, Javier Martinez Canillas wrote:
> >  
> > -	usb@12000000 {
> > +	usb_dwc3 {
> >  		compatible = "samsung,exynos5250-dwusb3";
> >  		clocks = <&clock CLK_USB3>;
> >  		clock-names = "usbdrd30";
> 
> The ePAPR document says that "The name of a node should be somewhat generic,
> reflecting the function of the device and not its precise programming model"
> 
> So I wonder if this shouldn't be instead:
> 
> usb_dwc3: usb {

There are already nodes with 'usb' name:
	ehci: usb@12110000 {
		compatible = "samsung,exynos4210-ehci";
		...
	}
	ohci: usb@12120000 {
		compatible = "samsung,exynos4210-ohci";
	}
Having nodes with the same name but some with address some not, should
work (none should be overridden)... but looks a little bit weird.

Anyway I am fine with both.


> Although it seems that not all DT bindings follow this convention so probably
> the name in your patch is correct.
> 
> Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Thanks for review and comments. I already spotted the 'memory' node
issue so I won't be replying to you with acknowledging comments. :)

BR,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
