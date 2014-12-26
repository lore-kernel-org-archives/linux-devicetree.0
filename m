From: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH v2 6/6] arm: pxa: Transition pxa27x to clk framework
Date: Fri, 26 Dec 2014 17:58:51 +0100
Message-ID: <8761cy73g4.fsf@free.fr>
References: <1405353263-13424-1-git-send-email-robert.jarzmik@free.fr>
	<1405353263-13424-7-git-send-email-robert.jarzmik@free.fr>
	<2303917.o2xPYRxhCJ@avalon>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <2303917.o2xPYRxhCJ@avalon> (Laurent Pinchart's message of "Fri,
	26 Dec 2014 11:56:33 +0200")
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org> writes:

> Hi Robert,
>
> What happened to this patch ? It looks like the rest of the series got merged, 
> but this one seems to be missing.

It got reverted, because there were 3 boards with a defconfig which required
that both pxa27x and pxa25x were ported to common clock framework. As at that
time I had not ported pxa25x, I had to revert this one.

But now the situation is brighter. pxa25x was ported, tested, and merged by
Mike..Linus, so I can enable again common clock framework for both pxa27x and
pxa25x.

Actually it's good you make me think of it, as I've had the "pxa25x + pxa27x
common clocks enabler" patch in my local development tree for some time but I
didn't post it.

I'll post if for review this weekend I think.

Cheers.

--
Robert
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
