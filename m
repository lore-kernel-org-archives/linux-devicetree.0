From: Simon Horman <horms-/R6kz+dDXgpPR4JQBCEnsQ@public.gmane.org>
Subject: Re: [PATCH v2 05/22] ARM: dts: at91: Add generic compatible string
 for I2C EEPROM
Date: Fri, 14 Apr 2017 08:58:50 +0900
Message-ID: <20170413235850.GA6944@verge.net.au>
References: <20170413182839.25381-1-javier@osg.samsung.com>
 <20170413182839.25381-6-javier@osg.samsung.com>
 <869a0f44-6c97-2109-776b-6da9b86c732a@axentia.se>
 <dd93eb32-ca1e-5041-051e-c4f072f0f9a2@osg.samsung.com>
 <20170413212059.unh2mfo2w4oc4t33@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170413212059.unh2mfo2w4oc4t33-m++hUPXGwpdeoWH0uzbU5w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Thu, Apr 13, 2017 at 11:20:59PM +0200, Alexandre Belloni wrote:
> On 13/04/2017 at 18:09:56 -0300, Javier Martinez Canillas wrote:
> > Hello Peter,
> > 
> > On 04/13/2017 05:43 PM, Peter Rosin wrote:
> > > On 2017-04-13 20:28, Javier Martinez Canillas wrote:
> > 
> > [snip]
> > 
> > >>  
> > >>  	eeprom@50 {
> > >> -		compatible = "nxp,24c02";
> > >> +		compatible = "nxp,24c02","atmel,24c02";
> > >>  		reg = <0x50>;
> > >>  		pagesize = <16>;
> > >>  	};
> > >>
> > > 
> > > Sure, in principle. But not having a space after the commas is a real OCD
> > > trigger for me. My spine is rotating... :-)
> > >
> > 
> > Right, Geert already pointed out. It's something I missed in my sed script
> > so I got it wrong in all the DTS :(
> > 
> > I'll fix my script and send a v2.
> > 
> 
> That would be v3, right? ;)
> 
> > > Anyway, with those whitespace fixes (and without them too, but please):
> > > Acked-by: Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
> > >
> > 
> > Thanks for the review!
> > 
> 
> I'd like to be copied on the first patches to ensure they are applied
> before applying that one. (Also, it is probably too late for 4.12 anyway
> because we are past rc6).

Ditto
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
