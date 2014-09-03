From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v3 0/6] Migrate PXA27x platforms to clock framework
Date: Wed, 03 Sep 2014 21:33:31 +0200
Message-ID: <3966110.RPrxdc8FBm@wuerfel>
References: <1406753464-15000-1-git-send-email-robert.jarzmik@free.fr> <201408241408.19861.arnd@arndb.de> <20140903184956.11368.47800@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140903184956.11368.47800@quantum>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Daniel Mack <zonque-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wednesday 03 September 2014 11:49:56 Mike Turquette wrote:
> > Right, makes sense. We have in the past done it either way for other
> > platforms. When merging the patches through the clk subsystem, it still
> > makes sense to let us know of those plans and ask for an Ack from
> > the arm-soc maintainers, to be sure we can plan ahead in case there
> > are other (conflicting) patch sets that are sent through arm-soc.
> 
> Do I have your Ack for the arch/arm patches?
> 
> [0] https://lkml.kernel.org/r/<1409758148-20104-1-git-send-email-tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>

I have no objection to the change, but we might need to be careful in
case we get a lot of conflicts.

How about making it a shared branch that you plan to send upstream
but that we can also include in arm-soc to avoid conflicts if necessary?

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
