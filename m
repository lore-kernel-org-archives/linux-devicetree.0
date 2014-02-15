From: Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
Subject: Re: [PATCH v2 10/23] ARM: MM: Add DT binding for Feroceon L2 cache
Date: Sat, 15 Feb 2014 17:39:09 -0500 (EST)
Message-ID: <alpine.LFD.2.11.1402151735300.17677@knanqh.ubzr>
References: <1392459621-24003-1-git-send-email-andrew@lunn.ch>
 <2979047.tn4oVevojb@wuerfel> <20140215135930.GA26088@lunn.ch>
 <201402152212.02580.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; CHARSET=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <201402152212.02580.arnd-r2nGTMty4D4@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, 15 Feb 2014, Arnd Bergmann wrote:

> On Saturday 15 February 2014, Andrew Lunn wrote:
> > None of the _defconfig's ever turn on
> > CACHE_FEROCEON_L2_WRITETHROUGH. I also did a quick google and could
> > not find any usage of it.
> > 
> > So i see two options:
> > 
> > 1) Remove the wr-override from the DT binding and use
> > CACHE_FEROCEON_L2_WRITETHROUGH.
> > 
> > 2) Remove CACHE_FEROCEON_L2_WRITETHROUGH and make proc-feroceon.S do
> > the right thing at runtime.
> > 
> > I suspect i will go for 1), it is simpler.
> 
> Yes, fair enough. I'd hope we could just kill the option altogether,
> but it's probably hard to find anyone who would remember what it
> was introduced for, unless Nico knows.

There was a time when we didn't know what cache mode was the best 
performance wise.  The right answer is "it depends on the work load" of 
course.  Hence it was made optional for people to play with and choose 
for themselves.


Nicolas
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
