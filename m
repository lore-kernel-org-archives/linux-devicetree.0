From: Evgeni Dobrev <evgeni-c3HRhe8yoGxdzLpqerNdyw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: kirkwood: enable phy driver for SATA
 controller on 88f6192
Date: Tue, 16 Dec 2014 19:19:13 +0100
Message-ID: <20141216181913.GF20170@anne>
References: <20141215203724.GA22936@anne>
 <20141216170138.14dcabc1@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20141216170138.14dcabc1-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

Hello Thomas,

On Tue, Dec 16, 2014 at 05:01:38PM +0100, Thomas Petazzoni wrote:
> Dear Evgeni Dobrev,
> 
> On Mon, 15 Dec 2014 21:37:24 +0100, Evgeni Dobrev wrote:
> > This patch enables the phy drivers for the SATA controller on Marvell's 88f6192. Without them it is not possible to use SATA drives attached to this processor.
> 
> Commit log text should be wrapped to some reasonable length.
> 

I will fix this.

> 
> >  			interrupts = <21>;
> >  			clocks = <&gate_clk 14>, <&gate_clk 15>;
> >  			clock-names = "0", "1";
> > +                        phys = <&sata_phy0>, <&sata_phy1>;
> > +                        phy-names = "port0", "port1";
> 
> You should use tabs and not spaces for indentation in Device Tree files.

I will resubmit. Thank you for your review.

> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> --

evgeni
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
