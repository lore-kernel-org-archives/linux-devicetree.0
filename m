From: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 20:13:55 +0200
Message-ID: <20131023181328.GF5208@netboy>
References: <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
 <20131023094903.GD11954@ulmo.nvidia.com>
 <20131023171620.GA5208@netboy>
 <alpine.LFD.2.03.1310231355160.1951@syhkavp.arg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.03.1310231355160.1951-hIgblCxmbi8OMTOF05IoTw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 01:55:24PM -0400, Nicolas Pitre wrote:
> On Wed, 23 Oct 2013, Richard Cochran wrote:
> > I still don't understand why someone (linario?) can't host an
> > arm-dt-devel tree that allows the freedom to change bindings and
> > features the best source for supporting the latest ARM SoCs. I don't
> > buy the argument that only Linus' tree gets enough testing. If another
> > tree really is the best ARM tree, then it will get plenty of attention
> > and testing.
> 
> So you're basically saying that we should split the development effort 
> across multiple trees instead of encouraging people to converge on the 
> same tree?  This is completely contrary to all the efforts we've been 
> deploying to encourage people to submit their code upstream.

No, just a single tree, please.
 
> ii> As an end user, I don't mind waiting for a feature if that means
> > stability and QA. If I get impatient, still I always have the choice
> > to take a development version. But I do not want to be forced to take
> > unfinished work in a released kernel.
> 
> If as an end user you want full QA, you should go with a distro kernel.

No, no, NO! I won't ship a distro kernel because they screw things
up (at least, in my experience). I will ship a 3.x.y stable kernel,
though.
 
> We're talking about the upstream kernel here, and given the current 
> development and release rate we hardly can guarantee you that it'll be 
> free of unfinished work (as long as it doesn't regress existing 
> features).

I read a quote from a Big Cheese saying how the Linux kernel is a
stable release cycle. There are bugs, to be sure, but, in my
experience, each release is pretty stable on x86 (but not on arm).

Thanks,
Richard
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
