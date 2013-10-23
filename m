From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 11:29:55 -0600
Message-ID: <20131023172955.GA17145@obsidianresearch.com>
References: <52644A9E.3060007@wwwdotorg.org>
 <20131020220839.GT2443@sirena.org.uk>
 <5264576F.6050307@wwwdotorg.org>
 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
 <52658EBC.8020800@wwwdotorg.org>
 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
 <20131022093923.GC15640@ulmo.nvidia.com>
 <20131022150426.GF29341@beef>
 <20131022171346.GE4061@obsidianresearch.com>
 <20131023080630.GA14413@netboy>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131023080630.GA14413@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, Oct 23, 2013 at 10:06:31AM +0200, Richard Cochran wrote:
> On Tue, Oct 22, 2013 at 11:13:46AM -0600, Jason Gunthorpe wrote:
> > The question I asked last time this came up, which was left unaswered:
> > 
> >  Who does this stable DT ABI vision benifit, and how much is that
> >  benifit worth?
> 
> [Sigh]
> 
> I already answered this question more than once. I guess it doesn't
> hurt to answer it again: It helps the users. Please, don't forget
> about them.

I've seen that nebulous answer before. It is awfully vauge. Don't you
think a better, more excting answer is required to commit the kernel
community to such a huge amount of work+pain?

What users? What use cases? Who exactly?

Crucially: Does the above justify the huge effort on the kernel side?

I'm a user of the kernel and I'm sitting here saying I don't need
this.

Thierry represents a chunk of users and he is saying much the same.

Others have made similar comments.

> If I, as an embedded developer, design my board to work with kernel
> version N and a given DTB, then I can upgrade to any kernel version
> M (where M > N) using the *same* DTB, and it still works.

You can use the DTB that comes with your kernel version. Just like
modules, and everything else that comes with the kernel.

The embedded vendor doing turnkey stuff (eg folks like me) can supply
the dtb, kernel, modules, etc as a bundle.

The less embedded, distro focused machines can supply dtb, kernel, modules,
etc as a bundle through the distro.

This is all very doable, and it isn't really even that hard.

As far as I can see, all stable DTB gets you is the ability to flash
the DTB into the firmware and never change it. Who does that actually
help?

Jason
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
