From: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 13:33:59 +0200
Message-ID: <1382614439.6040.16.camel@sakura.staff.proxad.net>
References: <20131020220839.GT2443@sirena.org.uk>
	 <5264576F.6050307@wwwdotorg.org>
	 <alpine.LFD.2.03.1310201911190.1951@syhkavp.arg>
	 <52658EBC.8020800@wwwdotorg.org>
	 <alpine.LFD.2.03.1310211632460.1951@syhkavp.arg>
	 <20131022093923.GC15640@ulmo.nvidia.com> <20131022150426.GF29341@beef>
	 <20131022171346.GE4061@obsidianresearch.com>
	 <20131023080630.GA14413@netboy>
	 <20131023172955.GA17145@obsidianresearch.com>
	 <20131023174458.GC5208@netboy>
	 <1382553982.31058.10.camel@sakura.staff.proxad.net>
	 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
Reply-To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024095232.27BBCC4039D-WNowdnHR2B42iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Richard Cochran <richardcochran-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 2013-10-24 at 10:52 +0100, Grant Likely wrote:

> At this point if the hardware exists then it should be described in DTB,
> even if it is merely compatible, reg, interrupts and maybe clocks

if your driver does not use them, chances are you'll get them wrong.

> properties. In many cases that is all that is required. It /is/ okay to
> amend a binding later and to use default values if the new properties
> aren't present.

how do you handle the case of a wrong property, because you only wrote
hardware description and not the driver ?

> hardware description when enabling previously unused peripherals, but it
> is absolutely not friendly to change a binding/driver in a what that fails on
> previously working DTB (with the caveat that if no one notices, it
> isn't breakage).

ok then how do we solve that case:

 - Marvell SOC 1 is mainlined
 - Marvell SOC 2 is mainlined
 - Marvell SOC 'x' is mainlined
 - "PIO" hw crypto driver is written, working for all SOCs
 - [1 year]
 - SOCs bindings are marked as stable
 - [1 year]
 - someone rewrite the driver of hw crypto to use DMA, existing binding
is not ok because clock 'foo' or interrupt 'bar', now required, are not
present.

what is the process merge that driver ?

if the answer is that you need to keep PIO mode in driver so that
existing DTBs still works with it, then this is just plain *wrong*.

-- 
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
