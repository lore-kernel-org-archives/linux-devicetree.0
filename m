From: Marcus Wolf <marcus.wolf-hymvNObv7Fheq5RAq1AYSxS11BummzK+@public.gmane.org>
Subject: Re: [PATCH 1/1] staging: pi433: fix problem with division in
 rf69_set_deviation
Date: Sun, 30 Jul 2017 17:21:44 +0200 (CEST)
Message-ID: <1603596658.13802.1501428104756@ox.hosteurope.de>
References: <39f4e59cae6d241235f8f2cc6eebb33c-EhVcX1pHQwdXWkQFBhENSgEKLlwACzJXX19HAVhEWENbS1kLMF52CEtUX1pBSEwcXlJRL1lQWAheVn4GUFc=-webmailer1@server05.webmailer.hosteurope.de>
 <201707172156.DCyTyWc2%fengguang.wu@intel.com>
 <652336354.3806.1500549785404@ox.hosteurope.de>
 <20170720113705.d65hxm3jbki2ynqd@mwanda>
 <CAMuHMdVgw=V6f8wzcXvS3gk8GK0bOpdgs_jxL6Y_X9idJD_x3Q@mail.gmail.com>
 <255867683.7064.1500566196444@ox.hosteurope.de>
 <20170729000118.GA28861@kroah.com>
 <1812078351.11080.1501318275697@ox.hosteurope.de>
 <20170729222127.GB16460@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170729222127.GB16460-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: "kbuild-all-JC7UmRfGjtg@public.gmane.org" <kbuild-all-JC7UmRfGjtg@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, driverdevel <devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: devicetree@vger.kernel.org

Hi Greg, hi Dan

the toolingproblem is a little bit more complicated. Since a mainline kernel
isn't directly able to boot on the RasPi, for testing I work with a Raspbian
kernel. Since at the beginning, I never thought of submitting the driver, I
started with a side-build project with SVN - that's stil my master... In
addition, disk is full :-( 

So in principle nothing is really adequate to meet the need of easy
participating in kernel development.
I will revise my tooling, as soon as I find the time and quietness - most
probably I need to setup from scratch.

For the announced change in rf69.c I will try to equip an SVN-diff with
apropriate headers next week, so Dan can crosscheck with his work - I hope, I
will make it without errors...

Have a nice weekend,

Marcus


> Greg KH <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org> hat am 30. Juli 2017 um 00:21
> geschrieben:
>
>
> On Sat, Jul 29, 2017 at 10:51:15AM +0200, Marcus Wolf wrote:
> > Hi Greg,
> >
> > already had a discussion concerning that patch with Dan yesterday.
> > I really don't know what's going on there. I detached the patch once more
> > from
> > my outbox and had a very close look in an editor and looked at it with a
> > difftool. In my outbox the patch is fine. I really don't knwo why it reaches
> > you
> > crapped.
> >
> > Since there are contsant problems with my patches, I will stop sending
> > patches
> > for a while. As soon as I can find time to deeply confess with the tooling,
> > I
> > will start over with trying.
>
> Just use 'git send-email' for patches if you are having problems with
> your email client. And get a better email client the kernel
> Documentation has a whole file just about that topic and how to do it
> correctly.
>
> > Concerning this patch: You can use Arnds Patch from yesterday instead:
> > [PATCH] staging: pi433: use div_u64 for 64-bit division
> > It's a bit different to my patch, but according to yesterdays discussion, it
> > should also fix the problem.
>
> I already took it into my tree.
>
> thanks,
>
> greg k-h
>
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
