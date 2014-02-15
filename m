From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 10/23] ARM: MM: Add DT binding for Feroceon L2 cache
Date: Sat, 15 Feb 2014 14:59:30 +0100
Message-ID: <20140215135930.GA26088@lunn.ch>
References: <1392459621-24003-1-git-send-email-andrew@lunn.ch>
 <1392459621-24003-11-git-send-email-andrew@lunn.ch>
 <2979047.tn4oVevojb@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <2979047.tn4oVevojb@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Sat, Feb 15, 2014 at 02:23:23PM +0100, Arnd Bergmann wrote:
> On Saturday 15 February 2014 11:20:08 Andrew Lunn wrote:
> > Instantiate the L2 cache from DT. Indicate in DT where the cache
> > control register is and if write through should be made.
> > 
> > Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> > cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > 
> 
> I guess this answers part of my question for patch 5, but I also
> wonder if the run-time setting is correct now with the hardcoded
> #ifdef in arch/arm/mm/proc-feroceon.S checkign for the
> Kconfig option. Presumably the code should match whatever is
> set in the cache control register.

Humm, yes, good point.

None of the _defconfig's ever turn on
CACHE_FEROCEON_L2_WRITETHROUGH. I also did a quick google and could
not find any usage of it.

So i see two options:

1) Remove the wr-override from the DT binding and use
CACHE_FEROCEON_L2_WRITETHROUGH.

2) Remove CACHE_FEROCEON_L2_WRITETHROUGH and make proc-feroceon.S do
the right thing at runtime.

I suspect i will go for 1), it is simpler.

  Thanks
	Andrew


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
