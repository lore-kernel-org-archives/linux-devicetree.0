From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 03/15] ARM: dts: kirkwood: add stdout-path property to all boards
Date: Wed, 30 Apr 2014 22:30:21 +0200
Message-ID: <142642785.6KSg8q4tJP@wuerfel>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com> <53615342.8010600@gmail.com> <20140430202130.GE3082@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140430202130.GE3082-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 30 April 2014 22:21:30 Andrew Lunn wrote:
> > Yes, we *can* move it in kirkwood.dtsi, but IMHO we *should* keep it in
> > the board files. I see the "chosen" node and its properties as _the_
> > board node.
> > 
> > One could argue then, that we should count the memory properties too and
> > put the most common in the SoC dtsi. But you are right, as UART0 is also
> > the UART with boot support, it is likely to be always connected to
> > a more-or-less accessible console output.
> > 
> > I really have no strong opinion about it.
> 
> Me neithe, but the advantage of putting it in kirkwood.dtsi is that it
> then does not get forgotten, and is always there for bearbox to use.

I would prefer having it in the board.dts file out of principle, but I
agree it's not very important either way.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
