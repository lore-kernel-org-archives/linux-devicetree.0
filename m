From: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 5/5] rtc: at91sam9: add DT bindings documentation
Date: Wed, 10 Sep 2014 17:52:36 +0200
Message-ID: <20140910155236.GL2974@localhost>
References: <1409733934-14465-1-git-send-email-boris.brezillon@free-electrons.com>
 <1409733934-14465-6-git-send-email-boris.brezillon@free-electrons.com>
 <20140910121424.GG2974@localhost>
 <20140910152019.111c4c01@bbrezillon>
 <20140910150702.GK2974@localhost>
 <20140910173114.593dd132@bbrezillon>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20140910173114.593dd132@bbrezillon>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Boris BREZILLON <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Cc: Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Nicolas Ferre <nicolas.ferre-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Jean-Christophe Plagniol-Villard <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Andrew Victor <linux-PelNFVqkFnVyf+4FbqDuWQ@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: devicetree@vger.kernel.org

On Wed, Sep 10, 2014 at 05:31:14PM +0200, Boris BREZILLON wrote:
> On Wed, 10 Sep 2014 17:07:02 +0200
> Johan Hovold <johan-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:

> > Yes, this essentially what I suggested in the thread (and my last reply)
> > and relying on syscon rather than a custom driver seems like a good
> > idea. It would allow early access to the registers too with the recently
> > proposed changes. It would not guarantee any kind of exclusivity,
> > though, but I guess that's tolerable?
> 
> Yep, that's one of the concern I had with the syscon/regmap
> approach :-(, but I guess I'll give this solution a try and post a new
> version of this series ;-).

Perhaps we should see what Nicolas and Jean-Christophe says before
rushing into anything (again). ;)

I remember J-C considered loosing track of what was using a particular
backup register to be a regression. But I guess you can't have it both
ways (e.g. if you also want the early access soon provided by syscon).

I'll refresh my rtt and gmbr-node patches meanwhile, as they should be
needed in some form at least.

> Can we just leave the rtt as an rtc problem on the side for now and bind
> it to the rtc-at91sam9 driver.
> 
> If we ever decide to add a new driver using the RTT for another purpose
> we will still be able to reference the RTT block like this (and keep
> the existing rtt node definition):
> 
> rtt-based-rtc {
> 	compatible = "atmel,rtt-rtc";
> 	atmel,rtt = <&rtt>;
> 	atmel,time-reg = <&gpbr 0x0>;
> }

But why not do this from the start?

> rtt-based-xdev {
> 	compatible = "atmel,rtt-xdev";
> 	atmel,rtt = <&rtt>;
> 	/*...*/
> }

Johan
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
