From: Maxime Bizon <mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org>
Subject: Re: [Ksummit-2013-discuss] ARM topic: Is DT on ARM the solution, or
 is there something better?
Date: Thu, 24 Oct 2013 16:33:39 +0200
Message-ID: <1382625219.6040.96.camel@sakura.staff.proxad.net>
References: <20131023174458.GC5208@netboy>
	 <1382553982.31058.10.camel@sakura.staff.proxad.net>
	 <20131024095232.27BBCC4039D@trevor.secretlab.ca>
	 <1382614439.6040.16.camel@sakura.staff.proxad.net>
	 <1382615278.8522.72.camel@shinybook.infradead.org>
	 <20131024122346.GD11296@ulmo.nvidia.com>
	 <1382619655.6040.52.camel@sakura.staff.proxad.net>
	 <516bfc7f9366ff3ef9187c36dd160888.squirrel@twosheds.infradead.org>
	 <1382621431.6040.66.camel@sakura.staff.proxad.net>
	 <af289ef3cc80be8de26274ba1f598d54.squirrel@twosheds.infradead.org>
	 <20131024141955.GB25061@ulmo.nvidia.com>
Reply-To: mbizon-MmRyKUhfbQ9GWvitb5QawA@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="ANSI_X3.4-1968"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131024141955.GB25061-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org" <ksummit-2013-discuss-cunTk1MwBs98uUxBSJOaYoYkZiVZrdSR2LY78lusg7I@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Matt Porter <matt.porter-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: devicetree@vger.kernel.org


On Thu, 2013-10-24 at 16:19 +0200, Thierry Reding wrote:

> We treated DT the same way we had treated platform data before, which
> has inevitable lead to the current mess, which is only slightly better
> than what we used to have. 

Side question, in your point of view, how is that better ?

current DT tools are not able to validate a file wrt its schema, so for
now we just moved platdata to DTS files and lost compiler type checking
in between.

I respectfully understand people fighting for *stable* DT because I see
the benefits behind this, even if IMO they absolutely do not outweigh
the pain.

But I fail to see any benefits of "forever unstable" DT, if you have to
tie the kernel tree with a DTB file, the description could have been
left in C code.

-- 
Maxime


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
