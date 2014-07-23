From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH 1/2] Added dts defintion for Lenovo ix4-300d nas
Date: Wed, 23 Jul 2014 16:14:43 +0200
Message-ID: <20140723141443.GC2856@lunn.ch>
References: <1406117232-5962-1-git-send-email-yahoo@perenite.com>
 <20140723134534.GF23220@titan.lakedaemon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140723134534.GF23220-u4khhh1J0LxI1Ri9qeTfzeTW4wlIGRCZ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>
Cc: benoitm974 <yahoo-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org>, benoitm-+V3Jd3LB6RBWk0Htik3J/w@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Gregory CLEMENT <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Benoit,

> 
> > +			};
> > +
> > +			serial@12000 {
> > +				clocks = <&coreclk 0>;

I don't think you need the clocks property. It should be already set
in armada-xp.dtsi.

> > +				adt7473@2e {
> > +					compatible = "adt7473";

Please include a vendor prefix here. 


> > +					reg = <0x2e>;
> > +				};
> > +
> > +				pcf8563@51 {
> > +					compatible = "pcf8563";

and a vendor prefix here.

> > +	/* warning: you need both eth1 & 0 to be initialize for poweroff to shutdown otherwise it reboots */

What do you mean by initialized? Driver loaded? Interface up? 

> This is a great first version

I agree with Jason, well done.

  Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
