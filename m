From: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 15:46:00 +0200
Message-ID: <1382622360.6040.79.camel@sakura.staff.proxad.net>
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
	 <1382614439.6040.16.camel@sakura.staff.proxad.net>
	 <1382615278.8522.72.camel@shinybook.infradead.org>
	 <1382616801.6040.26.camel@sakura.staff.proxad.net>
	 <3726fd81259f84ef308ba9011ae35174.squirrel@twosheds.infradead.org>
	 <1382619952.6040.57.camel@sakura.staff.proxad.net>
	 <addbb1933c62983e0114eeda7ce51342.squirrel@twosheds.infradead.org>
Reply-To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <addbb1933c62983e0114eeda7ce51342.squirrel-fWAbwA/6YHlc2C7mugBRk2EX/6BAtgUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 2013-10-24 at 13:14 +0000, David Woodhouse wrote:

> If DMA gives a performance boost for all workloads, what bloody idiot
> defined or reviewed a DT binding that didn't include the information which

who defined it:
  - hobbyist programmer without DMA knowledge 
  - hobbyist programmer without time
  - hobbyist programmer without datasheet access
  - SOC-vendor employed programmer with deadline

who reviewed it:
  - someone without time
  - someone without datasheet access
  - no-one (programmer was part of DT team :)

> It's the difference between doing it as a matter of course, and doing it
> only in the very rare "OMG we fucked up but we really *need* to fix it up
> this time" case.

we manage to screw syscalls, even with the amount of people that have
the ability to review them (as opposed to hardware when you need
datasheet)

few syscalls, lots of hardware.

-- 
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
