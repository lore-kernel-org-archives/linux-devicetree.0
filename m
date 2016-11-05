From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Sat, 5 Nov 2016 22:37:41 +0100
Message-ID: <20161105213741.GD1216@lunn.ch>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <20161105212326.GC1216@lunn.ch>
 <20161105212748.vtdprlxxismy5xmk@perseus.defre.kleine-koenig.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20161105212748.vtdprlxxismy5xmk-jgopVnDzZD+b0XQX99//ntPVjbGH4+40kFgPdswSElo@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Tomas Hlavacek <tomas.hlavacek-x+rMaJPWets@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Sat, Nov 05, 2016 at 10:27:49PM +0100, Uwe Kleine-König wrote:
> Hello Andrew,
> 
> On Sat, Nov 05, 2016 at 10:23:26PM +0100, Andrew Lunn wrote:
> > > Still missing is support for the switch.
> > 
> > Is it a Marvell Switch? armada-370-rd.dts would be a good start for
> > the old binding? vf610-zii-dev-rev-b.dts uses the new binding.
> 
> Yeah, a 88E6176. I already try to understand vf610-zii-dev-rev-b.dts. Do
> you know if this driver works for the 88E6176?

Yes it does. 

The vf610-zii-dev-rev-b is a bit complex because it has three
switches, and an mdio mux. You should be able to transplant the
switch0: switch0@0 part into the mdio node.

	 Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
