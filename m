From: Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>
Subject: Re: [PATCH v2 02/15] clocksource: orion: Use atomic access for
 shared registers
Date: Tue, 21 Jan 2014 12:02:55 +0100
Message-ID: <20140121110255.GD13396@lunn.ch>
References: <1390295561-3466-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <5118193.GjKusj569J@wuerfel>
 <52DE44B9.70308@gmail.com>
 <4103670.WQZpL6dQdj@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4103670.WQZpL6dQdj@wuerfel>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-watchdog-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lior Amsalem <alior-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Cooper <jason-NLaQJdtUoK4Be96aLqz0jA@public.gmane.org>, Tawfik Bayouk <tawfik-eYqpPyKDWXRBDgjK7y7TUQ@public.gmane.org>, Andrew Lunn <andrew-g2DYL2Zd6BY@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Wim Van Sebroeck <wim-IQzOog9fTRqzQB+pC5nmwQ@public.gmane.org>, Gregory Clement <gregory.clement-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Id: devicetree@vger.kernel.org

> > The real problem with this is that it resides in orion-time.c which
> > is fine for Orion SoCs. Armada 370/XP use a different timer and
> > therefore the _common_ watchdog driver cannot call this function.
> 
> Right, I had missed this part.
> 
> > Moreover, Dove (out of Orion) and Armada 370/XP will happily live in
> > one V7 kernel with both time-orion and time-armada-370-xp compiled in.
> 
> It still wouldn't be too hard to do: both clock drivers could export
> functions with different identifiers, and the wdt driver can use
> conditional compilation (#ifdef or if(IS_ENABLED())) to only call
> those functions when the respective clocksource drivers are enabled.

Hi Arnd.

The plan is to make dove part of MULTI_V7. At that point, you have
both dove and armada-370-xp in the same kernel. Conditional
compilation does not work, the watchdog driver would need to know at
runtime which timer is in use, and call the right timer function.

I'm working on making DT Kirkwood part of MULTI_V5. The changes needed
are mostly trivial. I expect making Dove part of MULTI_V7 is also
trivial, so could happen during the next cycle. So this mix of Dove
and Armada 370 XP is not a theoretical problem, it is something which
needs to be solved ready for merging during the next window.

	Andrew
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
