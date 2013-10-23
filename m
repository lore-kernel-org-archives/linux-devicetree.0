From: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Wed, 23 Oct 2013 21:12:31 +0200
Message-ID: <1382555551.31058.24.camel@sakura.staff.proxad.net>
References: <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
	 <52658EBC.8020800@wwwdotorg.org>
	 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
	 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
	 <20131022171346.GE4061@obsidianresearch.com>
	 <20131023080630.GA14413@netboy>
	 <20131023172955.GA17145@obsidianresearch.com>
	 <20131023174458.GC5208@netboy>
	 <1382553982.31058.10.camel@sakura.staff.proxad.net>
	 <20131023185116.GJ5208@netboy>
Reply-To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131023185116.GJ5208@netboy>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Wed, 2013-10-23 at 20:51 +0200, Richard Cochran wrote:

> I have no problem with new kernel features unlocked by new DT
> bindings.
> 
> I *do* have a problem with new kernels breaking existing DT bindings.

well this assume the new feature does not need modifying an existing
binding.

again taking the Kirkwood crypto example, the driver was written using
lets say "PIO" mode, and a patch has been posted recently that mostly
rewrite the driver to use DMA mode after.

chances are the binding written by the first developer would not be the
same at all as the second

does the "DT bindings validation team" will have to look inside SOC
datasheet and decide whether the developer described the hardware
correctly ?

In another post, someone proposed that time would tell if a binding was
"stable" enough. In that case that's not true, 2 years have passed
before someone took a glance at what the hardware could do and proposed
a different implementation.

-- 
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
