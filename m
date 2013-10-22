From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Tue, 22 Oct 2013 11:22:14 -0600
Message-ID: <20131022172214.GF4061@obsidianresearch.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <20131021091555.GB21518@ulmo.nvidia.com>
 <20131021170711.GA5256@netboy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131021170711.GA5256@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Mon, Oct 21, 2013 at 07:07:11PM +0200, Richard Cochran wrote:
> On Mon, Oct 21, 2013 at 11:15:56AM +0200, Thierry Reding wrote:
> > 
> > Right now, we're taking away much of that flexibility and I see progress
> > on ARM actively hindered.
> 
> Baloney.
> 
> No one is taking away your flexibility or hindering progress. It is
> really very simple. Just make an arm-dt-devel tree where you can both
> change the bindings at will and recommend to people. Once bindings
> have seen some real world testing and have had time to mature, then
> request a merge into mainline.

The argument is that DT is a stable ABI we must never change it once
it hits mainline.

This leads to not accepting patches into mainline until they are
'stable'.

Whihc leads to vendors shipping code in real systems to real customers
with those out of tree patches. (Deadlines are a bitch)

The vendors are now forced to treat the DT as an *UNSTABLE* ABI
because they are shipping non-mainline DT schemas and plan to upgrade
to mainline someday.

Now the vendors no longer value DT as a stable ABI.

So, why are we making argument #1? Seems pretty self defeating to me.

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
