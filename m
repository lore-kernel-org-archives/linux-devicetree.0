From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH RFC] ARM: dts: add support for Turris Omnia
Date: Mon, 14 Nov 2016 14:10:10 +0100
Message-ID: <20161114131010.GC26710@lunn.ch>
References: <20161105203841.9661-1-uwe@kleine-koenig.org>
 <1479126185.15557.5@smtp.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1479126185.15557.5-TAvD023jEQEN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: tomas.hlavacek-x+rMaJPWets@public.gmane.org
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe-rXY34ruvC2xidJT2blvkqNi2O/JbrIOy@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Martin Strba??ka <martin.strbacka-x+rMaJPWets@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> Actually SFP is connected to SGMII interface of eth1, which is
> routed through SERDES 5.

You say eth1 here. Yet lower down you say got eth0 and eth1 are
connected to the switch?

> We have our proprietary support hacked onto mvneta driver for
> disconnecting PHY on the fly. It is a bit nasty, so I suggest to
> ignore SFP in this DTS altogether and let's wait till "phylink based
> SFP module support" or something alike hits upstream, so we can base
> the SFP support on solid code;

It would be great if you could work on getting the phylink patches
into mainline. It is something i have wanted to do for a long time,
but it is too low down on my priority list to get to. The code is high
quality, so i don't think there will be too many issues. It probably
just needs splitting up into smaller batches, submitting, and working
on any comments.

> Actually eth0 and eth1 (both are RGMII) are connected to the 88E6176
> switch. The problem is that from what I have read so far the switch
> can not operate in DSA mode with two CPU ports.

Again, this is something i wanted to do, and i did have a prototype at
one point. But again, not enough time. If you have resources to work
on this, i can find my code, explain my ideas, and let you complete
it.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
