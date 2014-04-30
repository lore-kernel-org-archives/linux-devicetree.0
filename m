From: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 03/15] ARM: dts: kirkwood: add stdout-path property to
 all boards
Date: Wed, 30 Apr 2014 21:47:14 +0200
Message-ID: <53615342.8010600@gmail.com>
References: <1398862602-29595-1-git-send-email-sebastian.hesselbarth@gmail.com> <1398862602-29595-4-git-send-email-sebastian.hesselbarth@gmail.com> <20140430163807.GA3082@lunn.ch>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140430163807.GA3082-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On 04/30/2014 06:38 PM, Andrew Lunn wrote:
> On Wed, Apr 30, 2014 at 02:56:30PM +0200, Sebastian Hesselbarth wrote:
>> ePAPR allows to reference the device used for console output by
>> stdout-path property. With node labels for Kirkwood UART0, now
>> reference it on all Kirkwood boards that already have ttyS0 in
>> their bootargs property.
> 
> Could this be done in kirkwood.dtsi. I don't think we have any board
> using ttyS1 for console, and if one does come along, it should be able
> to override it.

Yes, we *can* move it in kirkwood.dtsi, but IMHO we *should* keep it in
the board files. I see the "chosen" node and its properties as _the_
board node.

One could argue then, that we should count the memory properties too and
put the most common in the SoC dtsi. But you are right, as UART0 is also
the UART with boot support, it is likely to be always connected to
a more-or-less accessible console output.

I really have no strong opinion about it.

Sebastian

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
