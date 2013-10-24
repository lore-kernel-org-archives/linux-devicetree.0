From: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or is there something better?
Date: Thu, 24 Oct 2013 10:52:32 +0100
Message-ID: <20131024095232.27BBCC4039D@trevor.secretlab.ca>
References: <20131020220839.GT2443@sirena.org.uk> <5264576F.6050307@wwwdotorg.org> <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg> <52658EBC.8020800@wwwdotorg.org> <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg> <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef> <20131022171346.GE4061@obsidianresearch.com> <20131023080630.GA14413@netboy> <20131023172955.GA17145@obsidianresearch.com> <20131023174458.GC5208@netboy> <1382553982.31058.10.camel@sakura.staff.proxad.net>
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1382553982.31058.10.camel-MdnFuL0m/hCw+z8RR+d9WEZ2mhrpEnA6@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org, Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org

On Wed, 23 Oct 2013 20:46:22 +0200, Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org> wrote:
> 
> On Wed, 2013-10-23 at 19:45 +0200, Richard Cochran wrote:
> > 
> > Once I design my board, and it goes into production, the hardware is
> > fixed. It doesn't change, and neither should the description of the
> > hardware, also known as the DTB. If I have to research all of the
> > ways 
> 
> SOC support are never completely finished; subsystems are getting new
> features.
>  
> It's possible to ship a product with a kernel version that does not
> handle all the chip goodies, then want to upgrade the kernel later when
> someone has written the driver for a previously unused hardware block.
> 
> the first iteration of your DTB would be incomplete, the bindings to
> describe that hardware block would not exist inside it.

At this point if the hardware exists then it should be described in DTB,
even if it is merely compatible, reg, interrupts and maybe clocks
properties. In many cases that is all that is required. It /is/ okay to
amend a binding later and to use default values if the new properties
aren't present.

> real life example with Marvell Kirkwood, hw crypto support was added 1
> year after initial SOC support.

That said, enabling new hardware is a different problem from changing
the binding on working hardware. It is entirely reasonable to update the
hardware description when enabling previously unused peripherals, but it
is absolutely not friendly to change a binding/driver in a what that fails on
previously working DTB (with the caveat that if no one notices, it
isn't breakage).

g.

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
