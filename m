From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v2 10/23] ARM: MM: Add DT binding for Feroceon L2 cache
Date: Sat, 15 Feb 2014 22:12:02 +0100
Message-ID: <201402152212.02580.arnd@arndb.de>
References: <1392459621-24003-1-git-send-email-andrew@lunn.ch> <2979047.tn4oVevojb@wuerfel> <20140215135930.GA26088@lunn.ch>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140215135930.GA26088-g2DYL2Zd6BY@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Cc: Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Sebastian Hesselbarth <sebastian.hesselbarth-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Saturday 15 February 2014, Andrew Lunn wrote:
> None of the _defconfig's ever turn on
> CACHE_FEROCEON_L2_WRITETHROUGH. I also did a quick google and could
> not find any usage of it.
> 
> So i see two options:
> 
> 1) Remove the wr-override from the DT binding and use
> CACHE_FEROCEON_L2_WRITETHROUGH.
> 
> 2) Remove CACHE_FEROCEON_L2_WRITETHROUGH and make proc-feroceon.S do
> the right thing at runtime.
> 
> I suspect i will go for 1), it is simpler.

Yes, fair enough. I'd hope we could just kill the option altogether,
but it's probably hard to find anyone who would remember what it
was introduced for, unless Nico knows.

Git history points to 

commit 4360bb41920ffacd4a935fa692768129ee5bef4e
Author: Ronen Shitrit <rshitrit-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
Date:   Tue Sep 23 15:28:10 2008 +0300

    [ARM] Kirkwood: add support for L2 cache WB/WT selection
    
    Feroceon L2 cache can work in eighther write through or write back mode
    on Kirkwood. Add the option to configure this mode according to Kconfig.
    
    Signed-off-by: Ronen Shitrit <rshitrit-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>
    Signed-off-by: Nicolas Pitre <nico-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>

	Arnd
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
