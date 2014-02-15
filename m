From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 10/23] ARM: MM: Add DT binding for Feroceon L2 cache
Date: Sat, 15 Feb 2014 14:23:23 +0100
Message-ID: <2979047.tn4oVevojb@wuerfel>
References: <1392459621-24003-1-git-send-email-andrew@lunn.ch> <1392459621-24003-11-git-send-email-andrew@lunn.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1392459621-24003-11-git-send-email-andrew-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Saturday 15 February 2014 11:20:08 Andrew Lunn wrote:
> Instantiate the L2 cache from DT. Indicate in DT where the cache
> control register is and if write through should be made.
> 
> Signed-off-by: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
> cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> 

I guess this answers part of my question for patch 5, but I also
wonder if the run-time setting is correct now with the hardcoded
#ifdef in arch/arm/mm/proc-feroceon.S checkign for the
Kconfig option. Presumably the code should match whatever is
set in the cache control register.

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
